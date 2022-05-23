import os
import pandas as pd
import sys

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
outfile.write(f"[File with accessions in each cluster]({cluster_tsv_url})\n\n")

clusterdir = f"{resultsdir}/clusters"
clusters = os.listdir(clusterdir)
clusters.sort(reverse=True)

# Navigation
outfile.write('## Navigation\n')
for cluster in clusters:
    name = cluster.split('_')[1]
    count = cluster.split('_')[0].lstrip('0')
    navigation_url = f"https://github.com/idameitil/phd/blob/master/data/wzy/ssn-clusterings/clustering/{timestamp}/report.md#cluster-{name}"
    outfile.write(f"[{name}({count})]({navigation_url})  ")
outfile.write('\n\n')

# Clusters
outfile.write('## Clusters\n')
seed_df = pd.read_csv("data/wzy/wzy.tsv", sep = '\t', dtype=object)
seeds_and_hits_df = pd.read_csv("data/wzy/seeds-and-hits.tsv", sep='\t', dtype=object)
image_github_url = 'https://github.com/idameitil/phd/raw/master'
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
    
    # Seeds
    #outfile.write(f"Number of seeds in cluster: {len(seed_accessions)}\n\n")
    outfile.write(f"#### Seeds in cluster:\n\n")
    seeds_table = seeds_and_hits_df.loc[seeds_and_hits_df.protein_accession.isin(seed_accessions),\
        ['protein_accession', 'order', 'family', 'genus', 'species', 'serotype']]
    outfile.write(seeds_table.to_markdown(index=False)+'\n\n')
    #outfile.write(f"Number of blast hits in cluster: {len(hit_accessions)}\n\n")

    # Alignment
    fasta_msa_url = f"{github_url}/{dir}/sequences.afa"
    outfile.write(f"[MSA fasta]({fasta_msa_url})\n\n")
    malign_url = f"{github_url}/{dir}/sequences.malign"
    outfile.write(f"[Malign view]({malign_url})\n\n")
    # Fasta
    fasta_url = f"{github_url}/{dir}/sequences.fa"
    outfile.write(f"[Fasta of members]({fasta_url})\n\n")
    # Logoplot
    #logo_url = f"{github_url}/{dir}/sequences.logo-001.jpg"
    #outfile.write(f"[Logoplot]({logo_url}) (OBS: this is still the old tool)\n\n")
    # Hits table
    hits_tsv_url = f"{github_url}/{dir}/hits.tsv"
    outfile.write(f"[Hits in cluster]({hits_tsv_url})\n\n")

    # Sugar images
    outfile.write("#### Sugars in cluster:\n\n")
    images = dict()
    for seed in seed_accessions:
        CSDB_record_id = seed_df.loc[seed_df.protein_accession == seed, 'CSDB_record_ID'].item()
        if not pd.isnull(CSDB_record_id):
            if CSDB_record_id in images:
                images[CSDB_record_id].append(seed)
            else:
                images[CSDB_record_id] = [seed]
    for image in images:
        image_path = f"../../../../csdb/images/{image}.gif"
        #image_path = f"/Users/idamei/phd/data/csdb/images/{image}.gif"
        seeds = images[image]
        outfile.write(f"{', '.join(seeds)}:\n\n")
        outfile.write(f"![]({image_path})\n\n")

    # AlphaFold models
    outfile.write("#### Alphafold models:\n\n")
    rows_alphafold = seeds_and_hits_df.loc[(seeds_and_hits_df.protein_accession.isin(accessions))\
         & (seeds_and_hits_df.alphafold_bool == 'True')]
    for index, row in rows_alphafold.iterrows():
        acc = row.protein_accession
        af_model_url = f"{github_url}/{row.alphafold_path}"
        outfile.write(f"[{acc}]({af_model_url})\n\n")

    # Taxonomy
    outfile.write(f"#### Taxonomy:\n\n")
    order_count_table = seeds_and_hits_df[seeds_and_hits_df.protein_accession.isin(accessions)]\
        .groupby('order')[['order']].count()\
        .rename_axis(None) \
        .sort_values(by='order', ascending=False)
    family_count_table = seeds_and_hits_df[seeds_and_hits_df.protein_accession.isin(accessions)]\
        .groupby('family')[['family']].count()\
        .rename_axis(None) \
        .sort_values(by='family', ascending=False)
    genus_count_table = seeds_and_hits_df[seeds_and_hits_df.protein_accession.isin(accessions)]\
        .groupby('genus')[['genus']].count()\
        .rename_axis(None) \
        .sort_values(by='genus', ascending=False)
    outfile.write(order_count_table.to_markdown()+'\n\n')
    outfile.write(family_count_table.to_markdown()+'\n\n')
    outfile.write(genus_count_table.to_markdown()+'\n\n')

    # Navigation to top
    top_navigation_url = f"https://github.com/idameitil/phd/blob/master/data/wzy/ssn-clusterings/clustering/{timestamp}/report.md#navigation"
    outfile.write(f"[top]({top_navigation_url})\n")

    outfile.write('\n')

outfile.close()

# Maybe instead of 