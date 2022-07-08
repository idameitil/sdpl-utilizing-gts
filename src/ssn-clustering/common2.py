import os
import pandas as pd
from Bio import SeqIO
import numpy as np
from scipy import stats

wzy_seeds_and_hits_filename = 'data/wzy/seeds-and-hits.tsv'
phobius_filename = 'data/wzy/phobius/2112081041/Phobius prediction.txt'
csdb_images_folder = '../../../csdb/images/'
github_url = 'https://github.com/idameitil/phd/tree/master'

def not_pd_null(value):
    return not pd.isnull(value)

aminoacids = ['A', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'K', 'L',
        'M', 'N', 'P', 'Q', 'R', 'S', 'T', 'V', 'W', 'Y', '-', 'X', 'J']

def AA_to_number(AA):
    return aminoacids.index(AA)

def number_to_AA(number):
    return aminoacids[number]

AA_to_number_vectorized = np.vectorize(AA_to_number)
number_to_AA_vectorized = np.vectorize(number_to_AA)

def read_MSA_file(MSA_filename):
    with open(MSA_filename, 'r') as MSA_file:
        proteins = SeqIO.parse(MSA_file, 'fasta')
        fasta_dict = {protein.id: protein.seq for protein in proteins}
    return fasta_dict

def get_conserved_residues(fasta_dict):
    AAs_ignore = ['-', 'G', 'A', 'V', 'C', 'P', 'L', 'I', 'M', 'W', 'F']
    sequences = np.array([np.array(list(fasta_dict[acc])) for acc in fasta_dict])
    no_sequences = sequences.shape[0]
    sequences_numerical = AA_to_number_vectorized(sequences)
    mode = stats.mode(sequences_numerical)
    mode_AAs = number_to_AA_vectorized(mode[0][0])
    frequencies = mode[1][0] / no_sequences
    condition = (frequencies > 0.97) & (np.isin(mode_AAs, AAs_ignore, invert=True))
    conserved_AAs = mode_AAs[condition]
    conserved_positions = list(np.where(condition)[0])
    return {pos: AA for pos, AA in zip(conserved_positions, conserved_AAs)}

def get_specific_positions_conserved_residues(accession, conserved_residues, fasta_dict):
    """Gets positions of conserved residues in a specific protein"""
    seq = fasta_dict[accession]
    protein_position = 0
    positions = []
    alignment_position = 0
    for AA in seq:
        if AA != '-':
            protein_position += 1
        if alignment_position in conserved_residues:
            if AA == conserved_residues[alignment_position][0]:
                positions.append(protein_position)
            else:
                pass
                # print(f"Warning: {accession} doesn't have the conserved residue {alignment_position} {conserved_residues[alignment_position][0]}")
        alignment_position += 1
    return positions

def get_conserved_positions_af_models(alphafold_models, conserved_residues, fasta_dict):
    conserved_positions_alphafold_models = {}
    for accession in alphafold_models:
        conserved_positions_alphafold_models[accession] = get_specific_positions_conserved_residues(accession, conserved_residues, fasta_dict)
    return conserved_positions_alphafold_models

def get_conserved_residues_string(conserved_residues):
    residue_string = ', '.join([f"{conserved_residues[position]} {position}" for position in conserved_residues])
    return residue_string

def is_accession_in_sugar_db(accessions_df, accession):
    CSDB_record_id = accessions_df.loc[accessions_df.protein_accession == accession, 'CSDB_record_ID'].item()
    return not pd.isnull(CSDB_record_id)

def get_sugar_image(sugar_id):
    return f"{csdb_images_folder}{sugar_id}.gif"

def filename_to_url(filename):
    return f"{github_url}/{filename}"

def read_phobius(phobius_filename):
    TM_counts = {}
    with open(phobius_filename, 'r') as file:
        flag = False
        for line in file:
            if line.strip().startswith('Prediction of'):
                accession = line.strip().split()[2]
                TM_count = 0
                flag = True
            if line.strip() == '//':
                TM_counts[accession] = TM_count
                flag = False
            if flag and line.strip() != '':
                if line.split()[1] == 'TRANSMEM':
                    TM_count += 1
    return TM_counts

class SSNClusterData:

    seeds_and_hits_df = pd.read_csv(wzy_seeds_and_hits_filename, sep='\t', dtype=object)
    TM_counts = read_phobius(phobius_filename)

    def __init__(self, ssn_clustering_id):
        self.ssn_clustering_id = ssn_clustering_id

        self.seed_accessions = self.load_seed_accessions()
        self.load_included_accessions()

        self.clusters = []
        self.cluster_table_url = filename_to_url(self.cluster_table_filename())

        self.load_metadata()
        self.load_info()
        self.load_cluster_dict()
        self.load_taxons_before_after_table()
        self.load_clusters()

    def load_seed_accessions(self):
        return list(self.seeds_and_hits_df[self.seeds_and_hits_df.seed == '1']['protein_accession'])

    def results_dir_top(self):
        return f"data/wzy/ssn-clusterings/{self.ssn_clustering_id}"

    def results_dir(self):
        return f"data/wzy/ssn-clusterings/{self.ssn_clustering_id}/clusters"

    def cluster_table_filename(self):
        return f"{self.results_dir_top()}/clusters.tsv"

    def MSA_filename(self, cluster_id):
        return f"{self.results_dir()}/{cluster_id}/sequences.afa"

    def fasta_filename(self ,cluster_id):
        return f"{self.results_dir()}/{cluster_id}/sequences.fa"

    def malign_filename(self ,cluster_id):
        return f"{self.results_dir()}/{cluster_id}/sequences.malign"

    def logo_filename(self, cluster_id):
        return f"{self.results_dir()}/{cluster_id}/sequences.logo.pdf"

    def tree_filename(self, cluster_id):
        return f"{self.results_dir()}/{cluster_id}/sequences.nwk"

    def hits_table_filename(self, cluster_id):
        return f"{self.results_dir()}/{cluster_id}/hits.tsv"

    def info_filename(self):
        return f"{self.results_dir_top()}/info.txt"

    def metadata_filename(self):
        return f"{self.results_dir_top()}/metadata.txt"
    
    def clusters_filename(self):
        return f"{self.results_dir_top()}/clusters.tsv"

    def included_accessions_filename(self):
        return f"{self.results_dir_top()}/included_accessions.txt"

    def load_metadata(self):
        with open(self.metadata_filename(), 'r') as metadata_file:
            metadata = ''
            for line in metadata_file:
                metadata += line + '\n'
        self.metadata = metadata

    def load_info(self):
        with open(self.info_filename(), 'r') as info_file:
            info = ''
            for line in info_file:
                info += line + '\n'
        self.info = info

    def load_included_accessions(self):
        with open(f"{self.included_accessions_filename()}", 'r') as included_accessions_file:
            included_accessions = []
            for line in included_accessions_file:
                included_accessions.append(line.strip())
        self.included_accessions = included_accessions

    def load_cluster_dict(self):
        cluster_dict = {}
        with open(self.clusters_filename(), 'r') as cluster_file:
            for line in cluster_file:
                splitted_line = line.strip().split()
                accession, cluster = splitted_line[0], splitted_line[1]
                cluster_dict[accession] = cluster
        self.cluster_dict = cluster_dict

    def get_count_taxons_before(self, rank):
        return len(self.seeds_and_hits_df.loc[self.seeds_and_hits_df.protein_accession.isin(self.seed_accessions), rank].unique())

    def get_count_taxons_after(self, rank):
        return len(self.seeds_and_hits_df.loc[self.seeds_and_hits_df.protein_accession.isin(self.included_accessions), rank].unique())

    def load_taxons_before_after_table(self):
        data = {}
        ranks = ['kingdom', 'phylum', 'class', 'order', 'family', 'genus', 'species']
        for rank in ranks:
            data[rank] = {'before': self.get_count_taxons_before(rank), 'after': self.get_count_taxons_after(rank)}
        before_after_df = pd.DataFrame(data)
        self.taxons_before_after_table = before_after_df

    def read_split_fasta_seeds_hits(self, fasta_filename):
        seed_accessions = []
        hit_accessions = []
        with open(fasta_filename, 'r') as fasta_file:
            for fasta_line in fasta_file:
                if fasta_line.startswith('>'):
                    acc = fasta_line.strip()[1:]
                    if acc in self.seed_accessions:
                        seed_accessions.append(acc)
                    else:
                        hit_accessions.append(acc)
        return (seed_accessions, hit_accessions)

    def load_clusters(self):
        cluster_filenames = [file for file in os.listdir(
            self.results_dir()) if not file.startswith('.')]
        cluster_filenames.sort(reverse=True)
        self.clusters = map(lambda cluster_id: self.load_cluster_data(cluster_id), cluster_filenames)

    def get_sugar_id(self, accession):
        search_results = self.seeds_and_hits_df.loc[self.seeds_and_hits_df.protein_accession == accession, 'CSDB_record_ID']
        if search_results.size != 0:
            return search_results.item()
        return None

    def get_alphafold_models(self, accessions):
        rows_alphafold = self.seeds_and_hits_df.loc[(self.seeds_and_hits_df.protein_accession.isin(accessions))
                                           & (self.seeds_and_hits_df.alphafold_bool == '1')]
        alphafold_models = {}
        for index, row in rows_alphafold.iterrows():
            acc = row.protein_accession
            af_model_url = f"{github_url}/{row.alphafold_path}"
            alphafold_models[acc] = {'filepath': row.alphafold_path, 'url': af_model_url}
        return alphafold_models

    def get_taxonomy_table(self, accessions):
        # Get counts and make heirarchy dict
        hierarchy = dict()
        ranks = ['order', 'family', 'genus']
        counts = {rank: {} for rank in ranks}
        for index, row in self.seeds_and_hits_df.loc[self.seeds_and_hits_df.protein_accession.isin(
                accessions)].iterrows():
            # Save hierarchy
            if row.order not in hierarchy:
                hierarchy[row.order] = {row.family: [row.genus]}
            else:
                if row.family not in hierarchy[row.order]:
                    hierarchy[row.order][row.family] = [row.genus]
                elif row.genus not in counts['genus']:
                    hierarchy[row.order][row.family].append(row.genus)
            # Count
            for rank in ranks:
                if row[rank] not in counts[rank]:
                    counts[rank][row[rank]] = 1
                else:
                    counts[rank][row[rank]] += 1

        data = {'order (count)': [], 'family (count)': [], 'genus (count)': []}

        # Make pandas dataframe with hierarchy and count
        # Order
        orders_sorted = sorted(counts['order'].items(),
                            key=lambda x: x[1], reverse=True)
        for order, count in orders_sorted:
            first_in_order = True
            order_string = f"{order} ({count})"
            # Family
            families_in_order = {key: counts['family'][key]
                                for key in hierarchy[order]}
            families_sorted = sorted(
                families_in_order.items(), key=lambda x: x[1], reverse=True)
            for family, count in families_sorted:
                first_in_family = True
                family_string = f"{family} ({count})"
                # Genus
                genera_in_order = {key: counts['genus'][key]
                                for key in hierarchy[order][family]}
                genera_sorted = sorted(
                    genera_in_order.items(), key=lambda x: x[1], reverse=True)
                for genus, count in genera_sorted:
                    genus_string = f"{genus} ({count})"
                    if first_in_order:
                        data['order (count)'].append(order_string)
                        data['family (count)'].append(family_string)
                        data['genus (count)'].append(genus_string)
                        first_in_order = False
                        first_in_family = False
                    else:
                        if first_in_family:
                            data['order (count)'].append("")
                            data['family (count)'].append(family_string)
                            data['genus (count)'].append(genus_string)
                            first_in_family = False
                        else:
                            data['order (count)'].append("")
                            data['family (count)'].append("")
                            data['genus (count)'].append(genus_string)
        return pd.DataFrame(data)

    def get_seeds_table(self, seed_accessions):
        seeds_table = self.seeds_and_hits_df.loc[self.seeds_and_hits_df.protein_accession.isin(seed_accessions),
                                        ['protein_accession', 'order', 'family', 'genus', 'species', 
                                        'serotype', 'WzyE']]
        seeds_table.rename(columns={'WzyE':'Enterobacterial common antigen Wzy',
        'protein_accession': 'accession'}, inplace=True)
        return seeds_table

    def get_sugars2accessions(self, accessions, seed_accessions):
        sugars2accessions = {}
        for accession in accessions:
            sugar_id = self.get_sugar_id(accession)
            if not_pd_null(sugar_id):
                serotype = self.seeds_and_hits_df.loc[self.seeds_and_hits_df['protein_accession'] == accession]['serotype'].item()
                species = self.seeds_and_hits_df.loc[self.seeds_and_hits_df['protein_accession'] == accession]['species'].item()
                if sugar_id in sugars2accessions:
                    sugars2accessions[sugar_id].append({'accession': accession, 'species': species, 'serotype': serotype})
                else:
                    sugars2accessions[sugar_id] = [{'accession': accession, 'species': species, 'serotype': serotype}]
        return sugars2accessions

    def is_sugar_only_blast(self, sugar_id, sugars2accessions, seed_accessions):
        is_only_blast = True
        for protein in sugars2accessions[sugar_id]:
            if protein['accession'] in seed_accessions:
                is_only_blast = False
        return is_only_blast
    
    def enrich_sugars(self, seed_accessions, sugars2accessions):
        enriched_sugars = {
            sugar_id: {
            'proteins': sugars2accessions[sugar_id],
            'image': get_sugar_image(sugar_id),
            'is_only_blast': self.is_sugar_only_blast(sugar_id, sugars2accessions, seed_accessions)
             }
             for sugar_id in sugars2accessions}
        return enriched_sugars

    def sugar_images_seeds(self, enriched_sugars):
        return [enriched_sugars[sugar_id]['image'] for sugar_id in enriched_sugars 
        if not enriched_sugars[sugar_id]['is_only_blast']]

    def sugar_images_blast(self, enriched_sugars):
        return [enriched_sugars[sugar_id]['image'] for sugar_id in enriched_sugars 
        if enriched_sugars[sugar_id]['is_only_blast']]
    
    def get_average_length(self, accessions):
        average_length = self.seeds_and_hits_df.loc[self.seeds_and_hits_df.protein_accession.isin(accessions), 'seq'].apply(lambda x: len(x)).mean()
        return round(average_length, 1)

    def get_github_cluster_url(self, cluster_name):
        return f"{github_url}/{self.results_dir_top()}/report.md#cluster-{cluster_name}"

    def get_TM_count_string(self, accessions):
        return ', '.join([f"{accession}: {self.TM_counts[accession]}" for accession in accessions if accession in self.TM_counts])
        
    def load_cluster_data(self, cluster_id):
        [size, name] = cluster_id.split('_')
        size = int(size)

        seed_accessions, hit_accessions = self.read_split_fasta_seeds_hits(self.fasta_filename(cluster_id))
        accessions = []
        accessions.extend(seed_accessions)
        accessions.extend(hit_accessions)
        accessions = list(set(accessions))

        alphafold_models = self.get_alphafold_models(accessions)
        fasta_dict = read_MSA_file(self.MSA_filename(cluster_id))

        conserved_residues = get_conserved_residues(fasta_dict)
        conserved_positions_af_models = get_conserved_positions_af_models(alphafold_models, conserved_residues, fasta_dict)
        conserved_residues_string = get_conserved_residues_string(conserved_residues)

        seeds_table = self.get_seeds_table(seed_accessions)
        github_cluster_url = self.get_github_cluster_url(name)
        MSA_url = filename_to_url(self.MSA_filename(cluster_id))
        malign_url = filename_to_url(self.malign_filename(cluster_id))
        fasta_url = filename_to_url(self.fasta_filename(cluster_id))
        logo_url = filename_to_url(self.logo_filename(cluster_id))
        tree_url = filename_to_url(self.tree_filename(cluster_id))
        hits_table_url = filename_to_url(self.hits_table_filename(cluster_id))

        sugars2accessions = self.get_sugars2accessions(accessions, seed_accessions)
        enriched_sugars = self.enrich_sugars(seed_accessions, sugars2accessions)
        sugar_images_seeds = self.sugar_images_seeds(enriched_sugars)
        sugar_images_blast = self.sugar_images_blast(enriched_sugars)
        taxonomy_table = self.get_taxonomy_table(accessions)

        average_length = self.get_average_length(accessions)

        TM_count_string = self.get_TM_count_string(accessions)

        return {
            'name': name,
            'size': size,
            'conserved_residues_string': conserved_residues_string,
            'conserved_residues': conserved_residues,
            'conserved_positions_af_models': conserved_positions_af_models,
            'seeds_table': seeds_table,
            'github_cluster_url': github_cluster_url,
            'afa_url': MSA_url,
            'malign_url': malign_url,
            'fasta_url': fasta_url,
            'logo_url': logo_url,
            'tree_url': tree_url,
            'hits_table_url': hits_table_url,
            'sugars': enriched_sugars,
            'sugar_images_seeds': sugar_images_seeds,
            'sugar_images_blast': sugar_images_blast,
            'alphafold_models': alphafold_models,
            'taxonomy_table': taxonomy_table,
            'accessions': accessions,
            'average_length': average_length,
            'TM_count_string': TM_count_string
        }