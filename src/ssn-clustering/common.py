import os
import pandas as pd
from Bio import SeqIO

wzy_seeds_filename = 'data/wzy/wzy.tsv'
wzy_hits_filename = 'data/wzy/blast-full-genbank/1e-15/hits-enriched.tsv'
csdb_images_folder = '../../../csdb/images/'

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

class SSNClusterData:
    ssn_clustering_id = ''
    clusters = []
    seeds_df = []
    hits_df = []

    def __init__(self, ssn_clustering_id):
        self.ssn_clustering_id = ssn_clustering_id
        self.clusters = []
        self.seeds_df = pd.read_csv(wzy_seeds_filename, sep='\t', dtype=object)
        self.hits_df = pd.read_csv(wzy_hits_filename, sep='\t', dtype=object)
        self.load_clusters()

    def results_dir(self):
        return f"data/wzy/ssn-clusterings/{self.ssn_clustering_id}/clusters"

    def MSA_filename(self, cluster_id):
        return f"{self.results_dir()}/{cluster_id}/sequences.afa"

    def fasta_filename(self ,cluster_id):
        return f"{self.results_dir()}/{cluster_id}/sequences.fa"

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

    def load_cluster_data(self, cluster_id):
        [size, name] = cluster_id.split('_')
        size = int(size)
        # conserved_residues_string = ''
        with open(self.MSA_filename(cluster_id), 'r') as MSA_file:
            conserved_residues_string = get_conserved_residues_string(MSA_file)
        seed_accessions, hit_accessions = self.read_split_fasta_seeds_hits(self.fasta_filename(cluster_id))
        accessions = []
        accessions.extend(seed_accessions)
        accessions.extend(hit_accessions)
        accessions = list(set(accessions))
        sugar_ids = filter(not_pd_null, [self.get_sugar_id(accession) for accession in accessions])
        sugar_images = list(set([get_sugar_image(sugar_id) for sugar_id in sugar_ids]))

        return {
            'name': name,
            'size': size,
            'conserved_residues': conserved_residues_string,
            'sugars': sugar_images
        }

