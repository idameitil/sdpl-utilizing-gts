import os
import sys
import pandas as pd
import networkx as nx
sys.path.append("/Users/idamei/garryg/bioP/lib")

timestamp = sys.argv[1]
expansion_threshold = float(sys.argv[2])
ssn_threshold = int(sys.argv[3])
cdhit_threshold = 99
min_length_filter = 320
max_length_filter = 600

def write_metadata():
    outfile = open(f"{outdir}/metadata.txt", "w")
    outfile.write(f"CD-HIT threshold: {cdhit_threshold}%\n")
    outfile.write(f"Length filter: min {min_length_filter}, max {max_length_filter}\n")
    outfile.write(f"Expansion threshold: e-value {expansion_threshold}\n")
    outfile.write(f"SSN threshold: score {ssn_threshold}\n")
    outfile.close()

def read_banned_list(banned_file):
    with open(banned_file, 'r') as fh:
        banned_accessions = set()
        for line in fh:
            banned_accessions.add(line.strip())
    return banned_accessions

def read_filtered_reduced_fasta(filtered_reduced_fasta):
    with open(filtered_reduced_fasta) as fh:
        filtered_reduced_accessions = set()
        for line in fh:
            if line.startswith('>'):
                accession = line.strip().split(' ')[0][1:]
                filtered_reduced_accessions.add(accession)
    return filtered_reduced_accessions

def read_seed_fasta(seed_fasta):
    with open(seed_fasta) as fh:
        seed_accessions = set()
        for line in fh:
            if line.startswith('>'):
                accession = line.strip().split(' ')[0][1:]
                seed_accessions.add(accession)
    return seed_accessions

def read_unique_hits_tsv(unique_hits_tsv):
    unique_hits_df = pd.read_csv(unique_hits_tsv, sep = '\t', names=['acc', 'evalue'])
    return unique_hits_df

def find_accessions_to_include(banned_accessions, filtered_reduced_accessions, seed_accessions, unique_hits_df, expansion_threshold):
    # Filter hits by expansion threshold
    below_threshold_all = set(unique_hits_df.loc[unique_hits_df.evalue < expansion_threshold, 'acc'])
    filtered_reduced_below_threshold = filtered_reduced_accessions.intersection(below_threshold_all)
    # Add seeds
    union = filtered_reduced_below_threshold.union(seed_accessions)
    # Remove banned
    accessions_include = union - banned_accessions
    return accessions_include

def write_included_accession_file(accessions_include):
    with open(f"{outdir}/included_accessions.txt", 'w') as outfile:
        for acc in accessions_include:
            outfile.write(acc+'\n')

def write_edge_file(network_filename, accessions_include):
    df = pd.read_csv(network_filename, sep='\t')
    df_filtered = df[(df.score > ssn_threshold) & (df.source.isin(accessions_include)) & (df.target.isin(accessions_include))]
    df_filtered.to_csv(f"{outdir}/network", sep = '\t', columns=['source', 'target', 'score'], header=False, index=False)

def get_clusters():
    with open(f"{outdir}/network", "r") as edge_file:
        G = nx.read_weighted_edgelist(edge_file)
    clusters = sorted(nx.connected_components(G), key = len, reverse=True)
    return clusters

def write_info_file():
    """Global variables: accessions_include, clusters"""
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

# Make outdir
outdir = f"data/wzy/ssn-clusterings/{timestamp}"
if not os.path.isdir(outdir):
    os.makedirs(outdir)

# Define file paths
filtered_reduced_fasta = f"data/wzy/blast/unique-hits-min{min_length_filter}max{max_length_filter}-cdhit{cdhit_threshold}.fasta"
banned_file = "data/wzy/banned"
unique_hits_tsv = "data/wzy/blast/unique-hits.tsv"
seed_fasta = "data/wzy/wzy.fasta"
network_filename = "data/wzy/all-vs-all-blast/network"

write_metadata()

banned_accessions = read_banned_list(banned_file)
filtered_reduced_accessions = read_filtered_reduced_fasta(filtered_reduced_fasta)
seed_accessions = read_seed_fasta(seed_fasta)
unique_hits_df = read_unique_hits_tsv(unique_hits_tsv)

accessions_include = find_accessions_to_include(banned_accessions, \
    filtered_reduced_accessions, seed_accessions, unique_hits_df, expansion_threshold)
write_included_accession_file(accessions_include)

write_edge_file(network_filename, accessions_include)

clusters = get_clusters()

write_info_file()

# Read sequence files
annotated_df = pd.read_csv("data/wzy/wzy.tsv", sep='\t')
blast_hits_df = pd.read_csv("data/wzy/blast/unique-hits.csv", sep=' ,', \
    names=['acc', 'org', 'taxid', 'name', 'seq'], engine='python')

# Write cluster fastas
clusterdir = f"{outdir}/clusters"
if not os.path.isdir(clusterdir):
    os.makedirs(clusterdir)
cluster_file = open(f"{outdir}/clusters.tsv", "w")
count = 0
for cluster in clusters:
    count += 1
    # Cluster name
    cluster_size = len(cluster)
    cluster_name = f"{str(cluster_size).zfill(4)}_{count}"
    # Make cluster dir
    dir = f"{clusterdir}/{cluster_name}"
    if not os.path.isdir(dir):
        os.makedirs(dir)
    with open(f"{dir}/sequences.fa", "w") as fasta_outfile, open(f"{dir}/seeds.txt", "w") as seed_list_file:
        accessions_done = list()
        # Write annotated
        annotated_in_cluster = annotated_df.loc[annotated_df['protein_accession'].isin(cluster), ['protein_accession', 'seq']]
        for index, row in annotated_in_cluster.iterrows():
            accessions_done.append(row.protein_accession)
            fasta_outfile.write(f">{row.protein_accession}\n{row.seq}\n")
            cluster_file.write(f"{row.protein_accession}\t{count}\n")
            seed_list_file.write(f"{row.protein_accession}\n")
        # Write blast hits
        blast_hits_in_cluster = blast_hits_df.loc[blast_hits_df['acc'].isin(cluster), ['acc', 'seq']]
        for index, row in blast_hits_in_cluster.iterrows():
            if row.acc not in accessions_done:
                fasta_outfile.write(f">{row.acc}\n{row.seq}\n")
                cluster_file.write(f"{row.acc}\t{count}\n")
    # Blast hits tsv file
    blast_hits_in_cluster = blast_hits_df[blast_hits_df['acc'].isin(cluster)]
    blast_hits_in_cluster.to_csv(f"{dir}/hits.tsv", sep='\t')