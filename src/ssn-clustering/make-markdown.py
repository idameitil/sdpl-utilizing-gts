import os
import pandas as pd

timestamp = sys.argv[1]

github_url = 'https://github.com/idameitil/phd/tree/master'

resultsdir = f"data/wzy/ssn-clusterings/clustering/{timestamp}"

outfile = open(f"{resultsdir}/report.md", "w")
outfile.write(f"# Report of ssn-clustering run {timestamp}\n")

# Metadata
outfile.write('## Metadata\n')
metadata_file = open(f"{resultsdir}/metadata.txt")
for line in metadata_file:
    outfile.write(line + '\n')
metadata_file.close()

# Info
outfile.write('## Info\n')
info_file = open(f"{resultsdir}/info.txt")
for line in info_file:
    outfile.write(line + '\n')
info_file.close()

cluster_tsv_url = f"{github_url}/{resultsdir}/clusters.tsv"
outfile.write(f"File with accessions in each cluster: {cluster_tsv_url}\n\n")

seed_df = pd.read_csv("data/wzy/wzy.tsv", sep = '\t')

# Clusters
outfile.write('## Clusters\n')
clusterdir = f"{resultsdir}/clusters"
clusters = os.listdir(clusterdir)
clusters.sort(reverse=True)
for cluster in clusters:
    if cluster.startswith('.'):
        continue
    dir = f"{clusterdir}/{cluster}"
    # Header
    name = cluster.split('_')[1]
    outfile.write(f"### Cluster {name}\n")
    # Number of members
    count = cluster.split('_')[0].lstrip('0')
    outfile.write(f"Total number of members in cluster: {count}\n\n")
    # Get list of accessions
    fasta_file = open(f"{dir}/sequences.fa")
    accessions = list()
    seed_accessions = list()
    hit_accessions = list()
    for line in fasta_file:
        if line.startswith('>'):
            acc = line.strip()[1:]
            accessions.append(acc)
            if acc in list(seed_df.protein_accession):
                seed_accessions.append(acc)
            else:
                hit_accessions.append(acc)
    outfile.write(f"Number of seeds in cluster: {len(seed_accessions)}\n\n")
    outfile.write(f"Seeds in cluster: {', '.join(seed_accessions)}\n\n")
    outfile.write(f"Number of blast hits in cluster: {len(hit_accessions)}\n\n")
    #outfile.write(f"Blast hits in cluster: {', '.join(hit_accessions)}\n\n")
    # Alignment
    fasta_msa_url = f"{github_url}/{dir}/sequences.afa"
    outfile.write(f"MSA fasta: {fasta_msa_url}\n\n")
    malign_url = f"{github_url}/{dir}/sequences.malign"
    outfile.write(f"Malign view: {malign_url}\n\n")
    # Fasta
    fasta_url = f"{github_url}/{dir}/sequences.fa"
    outfile.write(f"Fasta of members: {fasta_url}\n\n")
    # Logoplot
    logo_url = f"{github_url}/{dir}/sequences.logo-001.jpg"
    outfile.write(f"Logoplot (OBS: this is still the old tool): {logo_url}\n\n")
    # Taxonomy

    outfile.write('\n')
outfile.close()

# Maybe instead of 