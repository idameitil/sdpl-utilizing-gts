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
if enzyme_family == 'wzy':
    filtered_reduced_fasta = f"data/wzy/blast/unique-hits-min{min_length_filter}max{max_length_filter}-cdhit{cdhit_threshold}.fasta"
    unique_hits_tsv = "data/wzy/blast/unique-hits.tsv"
    banned_file = f"data/{enzyme_family}/banned"
    seed_fasta = f"data/{enzyme_family}/{enzyme_family}.fasta"
    unique_hits_df = pd.read_csv(unique_hits_tsv, sep = '\t', names=['protein_accession', 'score', 'evalue'])
else:
    reduced_fasta = f"data/{enzyme_family}/genbank-search/hits-cdhit99.fasta"
    evalue_tsv = f"data/{enzyme_family}/genbank-search/hits-evalue.tsv"
    evalue_df = pd.read_csv(evalue_tsv, sep='\t')

network_filename = f"data/{enzyme_family}/all-vs-all-blast/network-new"

def write_metadata():
    with open(f"{outdir}/metadata.txt", "w") as outfile:
        outfile.write(f"CD-HIT threshold: {cdhit_threshold}%\n")
        outfile.write(f"Length filter: min {min_length_filter}, max {max_length_filter}\n")
        outfile.write(f"Expansion threshold: e-value {expansion_threshold}\n")
        outfile.write(f"SSN threshold: score {ssn_threshold}\n")

def get_accessions_from_list_file(filename):
    with open(filename, 'r') as infile:
        accessions = {line.strip() for line in infile}
    return accessions

def get_accessions_from_fasta(filename):
    with open(filename, 'r') as infile:
        fasta = SeqIO.parse(infile, format='fasta')
        accessions = {entry.id for entry in fasta}
    return accessions

def find_accessions_to_include():
    # for small ssn for poster
    # if enzyme_family == 'wzy':
    #     return get_accessions_from_list_file("data/wzy/phylogenetic-trees/small-tree-poster/selected-nodes-small-tree.txt")
    if enzyme_family == 'wzy':
        banned_accessions = get_accessions_from_list_file(banned_file)
        filtered_reduced_accessions = get_accessions_from_fasta(filtered_reduced_fasta)
        # seed_accessions = get_accessions_from_fasta(seed_fasta)
        # Filter hits by expansion threshold
        below_threshold_all = set(unique_hits_df.loc[unique_hits_df.evalue < expansion_threshold, 'protein_accession'])
        filtered_reduced_below_threshold = filtered_reduced_accessions.intersection(below_threshold_all)
        # Add seeds
        # union = filtered_reduced_below_threshold.union(seed_accessions)
        # Remove banned
        # accessions_include = union - banned_accessions
        accessions_include = filtered_reduced_below_threshold - banned_accessions
        return accessions_include
    elif enzyme_family == 'eca-pol':
        reduced = get_accessions_from_fasta(reduced_fasta)
        below_threshold_all = set(evalue_df.loc[evalue_df.evalue < expansion_threshold, 'acc'])
        reduced_below_threshold = reduced.intersection(below_threshold_all)
        return reduced_below_threshold
    elif enzyme_family == 'waal':
        reduced = get_accessions_from_fasta(reduced_fasta)
        below_threshold_all = set(evalue_df.loc[(evalue_df.evalue_clade1 < expansion_threshold) | (evalue_df.evalue_clade2 < expansion_threshold), 'acc'])
        reduced_below_threshold = reduced.intersection(below_threshold_all)
        return reduced_below_threshold

def write_included_accession_file():
    accessions_include = find_accessions_to_include()
    with open(f"{outdir}/included_accessions.txt", 'w') as outfile:
        for acc in accessions_include:
            outfile.write(acc+'\n')

def write_edge_file():
    accessions_include = find_accessions_to_include()
    df = pd.read_csv(network_filename, sep='\t', names=['source', 'target', 'score'])
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