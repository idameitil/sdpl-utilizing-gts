import networkx as nx
import sys
import os
from Bio import SeqIO
import shutil
import pickle

ssn_timestamp = sys.argv[1]
supercluster_timestamp = sys.argv[2]
threshold = sys.argv[3]

results_dir = f"data/wzy/ssn-clusterings/{ssn_timestamp}/superclusterings/{supercluster_timestamp}"

edge_filename = f"{results_dir}/hmm_edges"
with open(edge_filename, 'r') as infile:
    G = nx.read_weighted_edgelist(infile, delimiter='\t')

connected_components = sorted(nx.connected_components(G), key = len, reverse=True)

supercluster_dir = f"{results_dir}/superclusters"
if not os.path.isdir(supercluster_dir):
    os.makedirs(supercluster_dir)

cluster_dir = f"data/wzy/ssn-clusterings/{ssn_timestamp}/clusters"

supercluster2protein_members = {}

# Super clusters with several clusters
name = 0
clusters_in_superclusters = set()
supercluster2clustermembers = {}
for supercluster in connected_components:
    name += 1
    protein_members = 0
    cluster_members = 0
    fastas = []

    supercluster2clustermembers[str(name)] = []
    
    for cluster in supercluster:
        cluster_size = int(cluster.split('_')[0])
        cluster_name = cluster.split('_')[1]
        cluster_members += 1
        protein_members += cluster_size
        clusters_in_superclusters.add(cluster_name)
        supercluster2clustermembers[str(name)].append(f"{str(cluster_size).zfill(4)}_{cluster_name}")
        # Read fasta
        fasta_filename = f"{cluster_dir}/{str(cluster_size).zfill(4)}_{cluster_name}/sequences.fa"
        fasta = SeqIO.parse(fasta_filename, format='fasta')
        fastas.append(fasta)

    id = f"{str(protein_members).zfill(4)}_{cluster_members}_{name}"
    this_supercluster_dir = f"{supercluster_dir}/{id}"
    if not os.path.isdir(this_supercluster_dir):
        os.makedirs(this_supercluster_dir)

    # Save in dict
    supercluster2protein_members[id] = []

    # Make fasta and add members to dict
    super_fasta_filename = f"{this_supercluster_dir}/sequences.fa"
    with open(super_fasta_filename, 'w') as outfile:
        for fasta in fastas:
            for entry in fasta:
                outfile.write(f">{entry.id}\n{entry.seq}\n")
                supercluster2protein_members[id].append(entry.id)

# Super clusters of one cluster
for cluster in [entry for entry in os.listdir(cluster_dir) if not entry.startswith('.')]:
    cluster_size = int(cluster.split('_')[0])
    cluster_name = cluster.split('_')[1]

    if cluster_name in clusters_in_superclusters:
        continue

    name += 1

    supercluster2clustermembers[str(name)] = [cluster]

    id = f"{str(cluster_size).zfill(4)}_1_{name}"

    this_supercluster_dir = f"{supercluster_dir}/{id}"
    if not os.path.isdir(this_supercluster_dir):
        os.makedirs(this_supercluster_dir)

    supercluster2protein_members[id] = []

    # Read and write fasta
    fasta_filename = f"{cluster_dir}/{str(cluster_size).zfill(4)}_{cluster_name}/sequences.fa"
    fasta = SeqIO.parse(fasta_filename, format='fasta')
    for entry in fasta:
        supercluster2protein_members[id].append(entry.id)
    # Copy fasta
    dest = f"{this_supercluster_dir}/sequences.fa"
    shutil.copy(fasta_filename, dest)

supercluster_tsv_filename = f"{results_dir}/superclusters.tsv"
with open(supercluster_tsv_filename, 'w') as outfile:
    for supercluster in supercluster2protein_members:
        for member in supercluster2protein_members[supercluster]:
            outfile.write(f"{member}\t{supercluster}\n")

# Write file with names of clusters in supercluster
filename = f"{results_dir}/clusters_in_superclusters.pickle"
with open(filename, 'wb') as outfile:
    pickle.dump(supercluster2clustermembers, outfile)

# Write file with names of clusters in supercluster
filename = f"{results_dir}/clusters-in-superclusters.tsv"
with open(filename, 'w') as outfile:
    for supercluster in supercluster2clustermembers:
        for member in supercluster2clustermembers[supercluster]:
            outfile.write(f"{member}\t{supercluster}\n")