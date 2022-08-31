import os
import sys
import pandas as pd
import networkx as nx
from Bio import SeqIO

timestamp = sys.argv[1]
expansion_threshold = float(sys.argv[2])
ssn_threshold = int(sys.argv[3])
enzyme_family = sys.argv[4]
cdhit_threshold = 99
min_length_filter = 320
max_length_filter = 600

# Define file paths
filtered_reduced_fasta = f"data/wzy/blast/unique-hits-min{min_length_filter}max{max_length_filter}-cdhit{cdhit_threshold}.fasta"
banned_file = f"data/{enzyme_family}/banned"
unique_hits_tsv = "data/wzy/blast/unique-hits.tsv"
seed_fasta = f"data/{enzyme_family}/{enzyme_family}.fasta"
network_filename = f"data/{enzyme_family}/all-vs-all-blast/network"

unique_hits_df = pd.read_csv(unique_hits_tsv, sep = '\t', names=['protein_accession', 'evalue'])

def write_metadata():
    with open(f"{outdir}/metadata.txt", "w") as outfile:
        outfile.write(f"CD-HIT threshold: {cdhit_threshold}%\n")
        outfile.write(f"Length filter: min {min_length_filter}, max {max_length_filter}\n")
        outfile.write(f"Expansion threshold: e-value {expansion_threshold}\n")
        outfile.write(f"SSN threshold: score {ssn_threshold}\n")

def read_banned_list():
    with open(banned_file, 'r') as fh:
        banned_accessions = set()
        for line in fh:
            banned_accessions.add(line.strip())
    return banned_accessions

def read_filtered_reduced_fasta():
    with open(filtered_reduced_fasta) as fh:
        filtered_reduced_accessions = set()
        for line in fh:
            if line.startswith('>'):
                accession = line.strip().split(' ')[0][1:]
                filtered_reduced_accessions.add(accession)
    return filtered_reduced_accessions

def read_seed_fasta():
    with open(seed_fasta) as fh:
        seed_accessions = set()
        for line in fh:
            if line.startswith('>'):
                accession = line.strip().split(' ')[0][1:]
                seed_accessions.add(accession)
    return seed_accessions

def find_accessions_to_include():
    if enzyme_family == 'wzy':
        banned_accessions = read_banned_list()
        filtered_reduced_accessions = read_filtered_reduced_fasta()
        seed_accessions = read_seed_fasta()
        # Filter hits by expansion threshold
        below_threshold_all = set(unique_hits_df.loc[unique_hits_df.evalue < expansion_threshold, 'protein_accession'])
        filtered_reduced_below_threshold = filtered_reduced_accessions.intersection(below_threshold_all)
        # Add seeds
        union = filtered_reduced_below_threshold.union(seed_accessions)
        # Remove banned
        accessions_include = union - banned_accessions
        return accessions_include
    elif enzyme_family == 'waal':
        input_fasta_filename = "data/waal/genbank-search/hits-1e-5-cd-hit99.fasta"
        fasta = SeqIO.parse(input_fasta_filename, format='fasta')
        accessions_include = [entry.id for entry in fasta]
        return accessions_include
    elif enzyme_family == 'eca-pol':
        input_fasta_filename = "data/eca-pol/genbank-search/hits-cdhit99.fasta"
        fasta = SeqIO.parse(input_fasta_filename, format='fasta')
        accessions_include = [entry.id for entry in fasta]
        return accessions_include

def write_included_accession_file():
    accessions_include = find_accessions_to_include()
    with open(f"{outdir}/included_accessions.txt", 'w') as outfile:
        for acc in accessions_include:
            outfile.write(acc+'\n')

def write_edge_file():
    accessions_include = find_accessions_to_include()
    df = pd.read_csv(network_filename, sep='\t')
    df_filtered = df[(df.score > ssn_threshold) & (df.source.isin(accessions_include)) & (df.target.isin(accessions_include))]
    df_filtered.to_csv(f"{outdir}/network", sep = '\t', columns=['source', 'target', 'score'], header=False, index=False)

def get_clusters():
    with open(f"{outdir}/network", "r") as edge_file:
        G = nx.read_weighted_edgelist(edge_file)
    clusters = sorted(nx.connected_components(G), key = len, reverse=True)
    return clusters

def write_info_file():
    """Global variables: clusters"""
    accessions_include = find_accessions_to_include()
    def get_total_count():
        total_count = len(accessions_include)
        return total_count
    def get_node_count():
        node_count = 0
        for cluster in clusters:
            node_count += len(cluster)
        return node_count
    def get_singleton_count():
        singleton_count = get_total_count() - get_node_count()
        return singleton_count
    def get_cluster_count():
        cluster_count = len(clusters)
        return cluster_count
    with open(f"{outdir}/info.txt", "w") as outfile:
        outfile.write(f"Total number of proteins in network: {get_total_count()} \n")
        outfile.write(f"Number of singletons: {get_singleton_count()} \n")
        outfile.write(f"Number of nodes in clusters: {get_node_count()} \n")
        outfile.write(f"Number of clusters: {get_cluster_count()} \n")

def write_cluster_tsv():
    with open(f"{outdir}/clusters.tsv", "w") as cluster_file:
        cluster_name = 0
        for cluster in clusters:
            cluster_name += 1
            for acc in cluster:
                cluster_file.write(f"{acc}\t{cluster_name}\n")

# Make outdir
outdir = f"data/{enzyme_family}/ssn-clusterings/{timestamp}"
if not os.path.isdir(outdir):
    os.makedirs(outdir)

write_metadata()

write_included_accession_file()

write_edge_file()

clusters = get_clusters()

write_cluster_tsv()

write_info_file()