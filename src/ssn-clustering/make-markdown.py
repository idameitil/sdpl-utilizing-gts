from ctypes.wintypes import tagRECT
import os
import pandas as pd
import sys
import numpy as np
import math

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

def make_taxonomy_table(taxonomy_df):
    mydict = dict()
    # pd.set_option('display.max_rows', 600)
    # outfile.write(str(taxonomy_df) + '\n\n')
    counts = {'order':{}, 'family':{}, 'genus':{}}
    for index, row in taxonomy_df.iterrows():
        if row.order not in counts['order']:
            counts['order'][row.order] = 1
            counts['family'][row.family] = 1
            counts['genus'][row.genus] = 1
            mydict[row.order] = {row.family: [row.genus]}
        else:
            counts['order'][row.order] += 1
            if row.family not in counts['family']:
                counts['family'][row.family] = 1
                mydict[row.order][row.family] = [row.genus]
                counts['genus'][row.genus] = 1
            else:
                counts['family'][row.family] += 1
                if row.genus not in counts['genus']:
                    counts['genus'][row.genus] = 1
                    if not pd.isna(row.family):
                        mydict[row.order][row.family].append(row.genus)
                else:
                    counts['genus'][row.genus] += 1
    data = {'order (count)':[], 'family (count)':[], 'genus (count)':[]}

    # Order
    orders_sorted = sorted(counts['order'].items(), key=lambda x: x[1], reverse=True)
    for order, count in orders_sorted:
        first_in_order = True
        order_string = f"{order} ({count})"
        # Family
        families_in_order = {key: counts['family'][key] for key in mydict[order]}
        families_sorted = sorted(families_in_order.items(), key=lambda x: x[1], reverse=True)
        for family, count in families_sorted:
            first_in_family = True
            family_string = f"{family} ({count})"
            # Genus
            genera_in_order = {key: counts['genus'][key] for key in mydict[order][family]}
            genera_sorted = sorted(genera_in_order.items(), key=lambda x: x[1], reverse=True)
            for genus, count in genera_sorted:
                genus_string = f"{genus} ({count})"
                if first_in_order:
                    data['order (count)'].append(order_string)
                    data['family (count)'].append(family_string)
                    data['genus (count)'].append(genus_string)
                    first_in_order = False
                    first_in_family = False
                else:
                    if first_in_family:
                        data['order (count)'].append("")
                        data['family (count)'].append(family_string)
                        data['genus (count)'].append(genus_string)
                        first_in_family = False
                    else:
                        data['order (count)'].append("")
                        data['family (count)'].append("")
                        data['genus (count)'].append(genus_string)
    df = pd.DataFrame(data)
    return df.to_markdown(index=False)

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
    logo_url = f"{github_url}/{dir}/sequences.logo.eps"
    outfile.write(f"[Logoplot]({logo_url})\n\n")
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
    # order_count_table = seeds_and_hits_df[seeds_and_hits_df.protein_accession.isin(accessions)]\
    #     .groupby('order')[['order']].count()\
    #     .rename_axis(None) \
    #     .sort_values(by='order', ascending=False)
    # family_count_table = seeds_and_hits_df[seeds_and_hits_df.protein_accession.isin(accessions)]\
    #     .groupby('family')[['family']].count()\
    #     .rename_axis(None) \
    #     .sort_values(by='family', ascending=False)
    # genus_count_table = seeds_and_hits_df[seeds_and_hits_df.protein_accession.isin(accessions)]\
    #     .groupby('genus')[['genus']].count()\
    #     .rename_axis(None) \
    #     .sort_values(by='genus', ascending=False)
    # outfile.write(order_count_table.to_markdown()+'\n\n')
    # outfile.write(family_count_table.to_markdown()+'\n\n')
    # outfile.write(genus_count_table.to_markdown()+'\n\n')

    taxonomy_table = make_taxonomy_table(seeds_and_hits_df.loc[seeds_and_hits_df.protein_accession.isin(accessions), ['class', 'order', 'family', 'genus']])
    outfile.write(taxonomy_table + '\n\n')

    # Navigation to top
    top_navigation_url = f"https://github.com/idameitil/phd/blob/master/data/wzy/ssn-clusterings/clustering/{timestamp}/report.md#navigation"
    outfile.write(f"[top]({top_navigation_url})\n")

    outfile.write('\n')

outfile.close()

# Maybe instead of 