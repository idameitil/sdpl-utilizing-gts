import networkx as nx
import sys
import os
from Bio import SeqIO
import shutil
import pickle

timestamp = sys.argv[1]
threshold = sys.argv[2]

edge_filename = f"data/wzy/ssn-clusterings/{timestamp}/hmm_edges{threshold}"
with open(edge_filename, 'r') as infile:
    G = nx.read_weighted_edgelist(infile, delimiter='\t')

connected_components = sorted(nx.connected_components(G), key = len, reverse=True)

super_cluster_dir = f"data/wzy/ssn-clusterings/{timestamp}/super-clusters"
if not os.path.isdir(super_cluster_dir):
    os.makedirs(super_cluster_dir)

cluster_dir = f"data/wzy/ssn-clusterings/{timestamp}/clusters"

super_cluster2protein_members = {}

# Super clusters with several clusters
name = 0
clusters_in_super_clusters = set()
supercluster2clustermembers = {}
for super_cluster in connected_components:
    name += 1
    protein_members = 0
    cluster_members = 0
    fastas = []

    supercluster2clustermembers[str(name)] = []
    
    for cluster in super_cluster:
        cluster_size = int(cluster.split('_')[0])
        cluster_name = cluster.split('_')[1]
        cluster_members += 1
        protein_members += cluster_size
        clusters_in_super_clusters.add(cluster_name)
        supercluster2clustermembers[str(name)].append(f"{str(cluster_size).zfill(4)}_{cluster_name}")
        # Read fasta
        fasta_filename = f"{cluster_dir}/{str(cluster_size).zfill(4)}_{cluster_name}/sequences.fa"
        fasta = SeqIO.parse(fasta_filename, format='fasta')
        fastas.append(fasta)

    id = f"{str(protein_members).zfill(4)}_{cluster_members}_{name}"
    this_super_cluster_dir = f"{super_cluster_dir}/{id}"
    if not os.path.isdir(this_super_cluster_dir):
        os.makedirs(this_super_cluster_dir)

    # Save in dict
    super_cluster2protein_members[id] = []

    # Make fasta and add members to dict
    super_fasta_filename = f"{this_super_cluster_dir}/sequences.fa"
    with open(super_fasta_filename, 'w') as outfile:
        for fasta in fastas:
            for entry in fasta:
                outfile.write(f">{entry.id}\n{entry.seq}\n")
                super_cluster2protein_members[id].append(entry.id)

# Super clusters of one cluster
for cluster in [entry for entry in os.listdir(cluster_dir) if not entry.startswith('.')]:
    name += 1
    cluster_size = int(cluster.split('_')[0])
    cluster_name = cluster.split('_')[1]

    supercluster2clustermembers[str(name)] = [cluster]

    id = f"{str(cluster_size).zfill(4)}_1_{name}"

    this_super_cluster_dir = f"{super_cluster_dir}/{id}"
    if not os.path.isdir(this_super_cluster_dir):
        os.makedirs(this_super_cluster_dir)

    super_cluster2protein_members[id] = []

    # Read and write fasta
    fasta_filename = f"{cluster_dir}/{str(cluster_size).zfill(4)}_{cluster_name}/sequences.fa"
    fasta = SeqIO.parse(fasta_filename, format='fasta')
    for entry in fasta:
        super_cluster2protein_members[id].append(entry.id)
    # Copy fasta
    dest = f"{this_super_cluster_dir}/sequences.fa"
    shutil.copy(fasta_filename, dest)

supercluster_tsv_filename = f"data/wzy/ssn-clusterings/{timestamp}/superclusters.tsv"
with open(supercluster_tsv_filename, 'w') as outfile:
    for super_cluster in super_cluster2protein_members:
        for member in super_cluster2protein_members[super_cluster]:
            outfile.write(f"{member}\t{super_cluster}\n")

# Write file with names of clusters in supercluster
filename = f"data/wzy/ssn-clusterings/{timestamp}/clusters_in_superclusters.pickle"
with open(filename, 'wb') as outfile:
    pickle.dump(supercluster2clustermembers, outfile)