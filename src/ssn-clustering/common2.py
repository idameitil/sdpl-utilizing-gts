import os
import pandas as pd
from Bio import SeqIO

wzy_seeds_filename = 'data/wzy/wzy.tsv'
wzy_hits_filename = 'data/wzy/blast-full-genbank/1e-15/hits-enriched.tsv'
wzy_seeds_and_hits_filename = 'data/wzy/seeds-and-hits.tsv'
csdb_images_folder = '../../../csdb/images/'
github_url = 'https://github.com/idameitil/phd/tree/master'

def not_pd_null(value):
    return not pd.isnull(value)

def get_conserved_residues(df):
    """Gets convvserved residues from MSA"""
    AAs_ignore = ['-', 'G', 'A', 'V', 'C', 'P', 'L', 'I', 'M', 'W', 'F']
    length = len(df)
    count_sequences = df.shape[1]
    conserved_residues = dict()
    for position in range(length):
        most_frequent_AA = df.iloc[position].mode().values
        if len(most_frequent_AA) == 1:
            count_most_frequent_AA = df.iloc[position].value_counts().max()
            freq_most_frequent_AA = (count_most_frequent_AA / count_sequences)
            if freq_most_frequent_AA > 0.97 and most_frequent_AA not in AAs_ignore:
                conserved_residues[position] = (most_frequent_AA[0], freq_most_frequent_AA)
    return conserved_residues

def split(str):
    return [c for c in str]

def fasta_sequences_to_pd_df(sequences):
    return pd.DataFrame({sequence.id: split(str(sequence.seq)) for sequence in sequences})

def residue_to_str(residue):
    (position, residue_data) = residue
    (AA, frequency) = residue_data
    return f"{AA} {position}"

def is_accession_in_sugar_db(accessions_df, accession):
    CSDB_record_id = accessions_df.loc[accessions_df.protein_accession == accession, 'CSDB_record_ID'].item()
    return not pd.isnull(CSDB_record_id)

def get_sugar_image(sugar_id):
    return f"{csdb_images_folder}{sugar_id}.gif"

def get_conserved_residues_string(file):
    sequences = SeqIO.parse(file, 'fasta')
    sequences_df = fasta_sequences_to_pd_df(sequences)
    residues = get_conserved_residues(sequences_df)
    return ', '.join(map(residue_to_str, residues.items()))

def filename_to_url(filename):
    return f"{github_url}/{filename}"

class SSNClusterData:
    ssn_clustering_id = ''
    clusters = []
    seeds_df = []
    hits_df = []
    seeds_and_hits_df = []

    def __init__(self, ssn_clustering_id):
        self.ssn_clustering_id = ssn_clustering_id
        self.clusters = []
        self.seeds_df = pd.read_csv(wzy_seeds_filename, sep='\t', dtype=object)
        self.hits_df = pd.read_csv(wzy_hits_filename, sep='\t', dtype=object)
        self.seeds_and_hits_df = pd.read_csv(wzy_seeds_and_hits_filename, sep='\t', dtype=object)
        self.cluster_table_url = filename_to_url(self.cluster_table_filename())
        self.load_metadata()
        self.load_clusters()
        self.load_included_accessions()
        self.load_taxons_before_after_table()
        self.load_info()

    def results_dir_top(self):
        return f"data/wzy/ssn-clusterings/{self.ssn_clustering_id}/"

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

    def get_count_taxons_before(self, rank):
        return len(self.seeds_df.loc[self.seeds_df.protein_accession.isin(self.included_accessions), rank].unique())

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
                    if acc in list(self.seeds_df.protein_accession):
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
        search_results = self.seeds_df.loc[self.seeds_df.protein_accession == accession, 'CSDB_record_ID']
        if search_results.size != 0:
            return search_results.item()
        search_results = self.hits_df.loc[self.hits_df.protein_accession == accession, 'CSDB_record_ID_y']
        if search_results.size != 0:
            return search_results.item()
        return None

    def get_alphafold_models(self, accessions):
        rows_alphafold = self.seeds_and_hits_df.loc[(self.seeds_and_hits_df.protein_accession.isin(accessions))
                                           & (self.seeds_and_hits_df.alphafold_bool == 'True')]
        alphafold_models = {}
        for index, row in rows_alphafold.iterrows():
            acc = row.protein_accession
            af_model_url = f"{github_url}/{row.alphafold_path}"
            alphafold_models[acc] = af_model_url
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
        seeds_table.rename(columns={'WzyE':'Enterobacterial common antigen Wzy'}, inplace=True)
        return seeds_table

    def get_sugars2accessions(self, accessions):
        sugars2accessions = {}
        for accession in accessions:
            sugar_id = self.get_sugar_id(accession)
            if not_pd_null(sugar_id):
                if sugar_id in sugars2accessions:
                    sugars2accessions[sugar_id].append(accession)
                else:
                    sugars2accessions[sugar_id] = [accession]
        return sugars2accessions

    def is_sugar_only_blast(self, sugar_id, sugars2accessions, seed_accessions):
        is_only_blast = True
        for accession in sugars2accessions[sugar_id]:
            if accession in seed_accessions:
                is_only_blast = False
        return is_only_blast
    
    def enrich_sugars(self, seed_accessions, sugars2accessions):
        enriched_sugars = {
            sugar_id: {
            'accessions': sugars2accessions[sugar_id], 
            'image': get_sugar_image(sugar_id),
            'is_only_blast': self.is_sugar_only_blast(sugar_id, sugars2accessions, seed_accessions)
             }
             for sugar_id in sugars2accessions}
        return enriched_sugars
        
    def load_cluster_data(self, cluster_id):
        [size, name] = cluster_id.split('_')
        size = int(size)
        # conserved_residues_string = ''
        MSA_url = filename_to_url(self.MSA_filename(cluster_id))
        fasta_url = filename_to_url(self.fasta_filename(cluster_id))
        malign_url = filename_to_url(self.malign_filename(cluster_id))
        logo_url = filename_to_url(self.logo_filename(cluster_id))
        tree_url = filename_to_url(self.tree_filename(cluster_id))
        hits_table_url = filename_to_url(self.hits_table_filename(cluster_id))
        with open(self.MSA_filename(cluster_id), 'r') as MSA_file:
            conserved_residues_string = get_conserved_residues_string(MSA_file)
        seed_accessions, hit_accessions = self.read_split_fasta_seeds_hits(self.fasta_filename(cluster_id))
        accessions = []
        accessions.extend(seed_accessions)
        accessions.extend(hit_accessions)
        accessions = list(set(accessions))
        sugar_ids = filter(not_pd_null, [self.get_sugar_id(accession) for accession in accessions])
        #sugar_images = list(set([get_sugar_image(sugar_id) for sugar_id in sugar_ids]))
        alphafold_models = self.get_alphafold_models(accessions)
        taxonomy_table = self.get_taxonomy_table(accessions)
        seeds_table = self.get_seeds_table(seed_accessions)
        sugars2accessions = self.get_sugars2accessions(accessions)
        enriched_sugars = self.enrich_sugars(seed_accessions, sugars2accessions)

        return {
            'name': name,
            'size': size,
            'conserved_residues': conserved_residues_string,
            'sugars': enriched_sugars,
            'afa_url': MSA_url,
            'fasta_url': fasta_url,
            'malign_url': malign_url,
            'logo_url': logo_url,
            'tree_url': tree_url,
            'hits_table_url': hits_table_url,
            'alphafold_models': alphafold_models,
            'taxonomy_table': taxonomy_table,
            'seeds_table': seeds_table
        }