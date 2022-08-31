import sys
import os
import pandas as pd

timestamp = sys.argv[1]
clustering_dir = f"data/wzy/ssn-clusterings/{timestamp}"

clusters_table_filename = f"{clustering_dir}/clusters.tsv"
with open(clusters_table_filename, 'r') as infile:
    clusters = {}
    for line in infile:
        acc, cluster_name = line.strip().split()
        if cluster_name in clusters:
            clusters[cluster_name].append(acc)
        else:
            clusters[cluster_name] = [acc]

# Read sequence files
annotated_df = pd.read_csv("data/wzy/wzy.tsv", sep='\t')
blast_hits_df = pd.read_csv("data/wzy/blast/unique-hits.csv", sep=' ,', \
    names=['protein_accession', 'org', 'taxid', 'name', 'seq'], engine='python')

# Write cluster fastas etc
clusterdir = f"{clustering_dir}/clusters"
if not os.path.isdir(clusterdir):
    os.makedirs(clusterdir)
name = 0
with open(f"{clustering_dir}/clusters.tsv", "w") as cluster_file:
    for cluster_name in clusters:
        accessions = clusters[cluster_name]
        name += 1
        cluster_size = len(accessions)
        cluster_id = f"{str(cluster_size).zfill(4)}_{name}"
        dir = f"{clusterdir}/{cluster_id}"
        if not os.path.isdir(dir):
            os.makedirs(dir)
        with open(f"{dir}/sequences.fa", "w") as fasta_outfile, \
            open(f"{dir}/seeds.txt", "w") as seed_list_file:

            accessions_done = list()
            # Write annotated
            annotated_in_cluster = annotated_df.loc[annotated_df['protein_accession'].isin(accessions), ['protein_accession', 'seq']]
            for index, row in annotated_in_cluster.iterrows():
                accessions_done.append(row.protein_accession)
                fasta_outfile.write(f">{row.protein_accession}\n{row.seq}\n")
                cluster_file.write(f"{row.protein_accession}\t{name}\n")
                seed_list_file.write(f"{row.protein_accession}\n")
            # Write blast hits
            blast_hits_in_cluster = blast_hits_df.loc[blast_hits_df['protein_accession'].isin(accessions), ['protein_accession', 'seq']]
            for index, row in blast_hits_in_cluster.iterrows():
                if row.protein_accession not in accessions_done:
                    fasta_outfile.write(f">{row.protein_accession}\n{row.seq}\n")
                    cluster_file.write(f"{row.protein_accession}\t{name}\n")
        blast_hits_in_cluster = blast_hits_df[blast_hits_df['protein_accession'].isin(accessions)]
        blast_hits_in_cluster.to_csv(f"{dir}/hits.tsv", sep='\t')

sys.exit()
acc2seq = dict()

cluster_name = 0
for cluster in clusters:
    cluster_name += 1
    cluster_size = len(cluster)
    cluster_id = f"{str(cluster_size).zfill(4)}_{cluster_name}"
    dir = f"{clusterdir}/{cluster_id}"
    if not os.path.isdir(dir):
        os.makedirs(dir)
    with open(f"{dir}/sequences.fa", "w") as fasta_outfile, \
        open(f"{dir}/seeds.txt", "w") as seed_list_file:
        for acc in cluster:
            fasta_outfile.write(f">{acc}\n{acc2seq[acc]}\n")
            cluster_file.write(f"{acc}\t{cluster_name}\n")
            if acc in seed_accessions:
                seed_list_file.write(f"{acc}\n")