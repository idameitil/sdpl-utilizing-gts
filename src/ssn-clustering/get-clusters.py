import os
import sys
import random
import pandas as pd
sys.path.append("/Users/idamei/garryg/bioP/lib")

timestamp = sys.argv[1]
expansion_threshold = 10**-30
ssn_threshold = 100
cdhit_threshold = 99
min_length_filter = 320
max_length_filter = 600

def write_metadata():
    """Writes file with metadata.
    Global variables: outdir, expansion_threshold, ssn_threshold
    """
    outfile = open(f"{outdir}/metadata.txt", "w")
    outfile.write(f"CD-HIT threshold: {cdhit_threshold}%\n")
    outfile.write(f"Length filter: min {min_length_filter}, max {max_length_filter}")
    outfile.write(f"Expansion threshold: e-value {expansion_threshold}\n")
    outfile.write(f"SSN threshold: score {ssn_threshold}\n")
    outfile.close()

def read_banned_list(banned_file):
    """Makes list of accessions from banned file."""
    fh = open(banned_file)
    banned_accessions = set()
    for line in fh:
        banned_accessions.add(line.strip())
    return banned_accessions

def read_filtered_reduced_fasta(filtered_reduced_fasta):
    """Reads fasta file with blast hits filtered by length and
    redundancy reduced.
    """
    fh = open(filtered_reduced_fasta)
    filtered_reduced_accessions = set()
    for line in fh:
        if line.startswith('>'):
            accession = line.strip().split(' ')[0][1:]
            filtered_reduced_accessions.add(accession)
    return filtered_reduced_accessions

def read_seed_fasta(seed_fasta):
    """Reads fasta file with seed sequences"""
    fh = open(seed_fasta)
    seed_accessions = set()
    for line in fh:
        if line.startswith('>'):
            accession = line.strip().split(' ')[0][1:]
            seed_accessions.add(accession)
    return seed_accessions

def read_unique_hits_tsv(unique_hits_tsv):
    """Reads file with best e-value for each blast hit"""
    unique_hits_df = pd.read_csv(unique_hits_tsv, sep = '\t', names=['acc', 'evalue'])
    return unique_hits_df

def find_accessions_to_include(banned_accessions, filtered_reduced_accessions, seed_accessions, unique_hits_df, expansion_threshold):
    """Finds accessions to include in SSN.
    Filters based on expansion threshold, adds seeds, and removes banned.
    """

    # Filter hits by expansion threshold
    print(f'Number of filtered, reduced hits: {len(filtered_reduced_accessions)}')
    print(f'Filtering hits based on expansion threshold')
    below_threshold_all = set(unique_hits_df.loc[unique_hits_df.evalue < expansion_threshold, 'acc'])
    filtered_reduced_below_threshold = filtered_reduced_accessions.intersection(below_threshold_all)
    print(f'Number of filtered, reduced hits below threshold: {len(filtered_reduced_below_threshold)}\n')
    # Add seeds
    print(f'Number of seeds: {len(seed_accessions)}')
    print('Adding seeds')
    union = filtered_reduced_below_threshold.union(seed_accessions)
    print(f'Number of filtered, reduced hits below threshold and seeds: {len(union)}\n')
    # Removing banned
    print(f'Number of banned accessions: {len(banned_accessions)}')
    print('Removing banned')
    accessions_include = union - banned_accessions
    print(f'Number of accessions without banned: {len(accessions_include)}\n')
    return accessions_include

def write_included_accession_file(accessions_include):
    """Writes file with list accessions included in the network.
    Global variables: outdir
    """
    outfile = open(f"{outdir}/included_accessions.txt", 'w')
    for acc in accessions_include:
        outfile.write(acc+'\n')
    outfile.close()

def parse_network_file(network_filename, accessions_include):
    """Parses the big network file.
    Filters based on accessions_include and SSN threshold.
    Creates a dict with each accession as key and a list of all its neighbors as value.
    Writes new small network file.
    
    Global variables: outdir, ssn_threshold
    """

    sys.stderr.write("Parsing network file\n\n")
    infile = open(network_filename)
    outfile = open(f"{outdir}/network", "w")
    neighbor_dict = {}
    for line in infile:
        if line.startswith('source'):
            continue
        first_accession, second_accession, score, e_value = line.strip().split('\t')
        # Filter
        if first_accession in accessions_include and second_accession in accessions_include \
            and float(score) > ssn_threshold:
            # Add first accession to neighbor_dict
            if first_accession in neighbor_dict:
                neighbor_dict[first_accession].append(second_accession)
            else:
                neighbor_dict[first_accession] = [second_accession]
            # Add second accession to neighbor_dict
            if second_accession in neighbor_dict:
                neighbor_dict[second_accession].append(first_accession)
            else:
                neighbor_dict[second_accession] = [first_accession]
            # Write to new small network file
            outfile.write(line)
    infile.close()
    outfile.close()
    return neighbor_dict

def get_clusters(neighbor_dict):
    """Gets all clusters in network."""
    sys.stderr.write("Getting clusters\n")
    to_visit = neighbor_dict
    to_visit_next = set()
    visited = set()
    clusters = list()
    while len(to_visit) > 0:
        # Choose random from to_visit
        this_acc, neighbors = random.choice(list(to_visit.items()))
        # Remove this_acc from to_visit
        to_visit.pop(this_acc)
        # Add to visited
        visited.add(this_acc)
        # Initialize cluster
        cluster = {this_acc}
        # Add neighbors to to_visit_next
        to_visit_next.update(neighbors)
        # Loop through neighbors
        while len(to_visit_next) > 0:
             # Choose random from to_visit_next
            this_acc = to_visit_next.pop()
            visited.add(this_acc)
            # Get neighbors (and remove from to_visit)
            neighbors = to_visit.pop(this_acc)
            # Add to cluster
            cluster.add(this_acc)
            # Add neighbors to to_visit_next
            for neighbor in neighbors:
                if neighbor not in visited:
                    to_visit_next.add(neighbor)
        clusters.append(cluster)
    return clusters

def write_info_file():
    """ Writes info file.
    Global variables: accessions_include, clusters
    """
    def get_total_count(accessions_include):
        total_count = len(accessions_include)
        return total_count

    def get_node_count(clusters):
        node_count = 0
        for cluster in clusters:
            node_count += len(cluster)
        return node_count

    def get_singleton_count(total_count, node_count):
        singleton_count = total_count - node_count
        return singleton_count

    def get_cluster_count(clusters):
        cluster_count = len(clusters)
        return cluster_count
    # Get info
    total_count = get_total_count(accessions_include)
    node_count = get_node_count(clusters)
    singleton_count = get_singleton_count(total_count, node_count)
    cluster_count = get_cluster_count(clusters)
    # Write to file
    outfile = open(f"{outdir}/info.txt", "w")
    outfile.write(f"Total number of proteins in network: {total_count} \n")
    outfile.write(f"Number of singletons: {singleton_count} \n")
    outfile.write(f"Number of nodes in clusters: {node_count} \n")
    outfile.write(f"Number of clusters: {cluster_count} \n")

# Make outdir
outdir = f"data/wzy/ssn-clusterings/clustering/{timestamp}"
if not os.path.isdir(outdir):
    os.makedirs(outdir)

# Define file paths
filtered_reduced_fasta = f"data/wzy/blast/unique-hits-min{min_length_filter}max{max_length_filter}-cdhit{cdhit_threshold}.fasta"
banned_file = "data/wzy/ssn-clusterings/banned"
unique_hits_tsv = "data/wzy/blast/unique-hits.tsv"
seed_fasta = "data/wzy/wzy.fasta"
network_file = "data/wzy/ssn-clusterings/all-vs-all-blast/2205121500/network"

# Write metadata
write_metadata()
# Parse files
banned_accessions = read_banned_list(banned_file)
filtered_reduced_accessions = read_filtered_reduced_fasta(filtered_reduced_fasta)
seed_accessions = read_seed_fasta(seed_fasta)
unique_hits_df = read_unique_hits_tsv(unique_hits_tsv)
# Get accessions to include
accessions_include = find_accessions_to_include(banned_accessions, \
    filtered_reduced_accessions, seed_accessions, unique_hits_df, expansion_threshold)
# Write file with included accesions
write_included_accession_file(accessions_include)
# Parse network file
neighbor_dict = parse_network_file(network_file, accessions_include)
# Get clusters
clusters = get_clusters(neighbor_dict)
# Write info file
write_info_file()

# Read sequence files
annotated_df = pd.read_csv("data/wzy/wzy.tsv", sep='\t')
blast_hits_df = pd.read_csv("data/wzy/blast/unique-hits.csv", sep=' ,', \
    names=['acc', 'org', 'taxid', 'name', 'seq'])

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
    # Fasta file
    fasta_outfile = open(f"{dir}/sequences.fa", "w")
    accessions_done = list()
    # Write annotated
    annotated_in_cluster = annotated_df.loc[annotated_df['protein_accession'].isin(cluster), ['protein_accession', 'seq']]
    for index, row in annotated_in_cluster.iterrows():
        accessions_done.append(row.protein_accession)
        fasta_outfile.write(f">{row.protein_accession}\n{row.seq}\n")
        cluster_file.write(f"{row.protein_accession}\t{count}\n")
    # Write blast hits
    blast_hits_in_cluster = blast_hits_df.loc[blast_hits_df['acc'].isin(cluster), ['acc', 'seq']]
    for index, row in blast_hits_in_cluster.iterrows():
        if row.acc not in accessions_done:
            fasta_outfile.write(f">{row.acc}\n{row.seq}\n")
            cluster_file.write(f"{row.acc}\t{count}\n")