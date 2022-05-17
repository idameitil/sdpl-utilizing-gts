from random import seed
import pandas as pd
from ete3 import NCBITaxa
import sys
import os

#################
### Alphafold ###
#################

# Find out which seeds have alphafold models
alphafold_dir = "data/wzy/alphafold"
alphafold_experiments = os.listdir(alphafold_dir)
af_models = dict()
for folder in alphafold_experiments:
    if folder.startswith('.'):
        continue
    if os.path.isdir(f"{alphafold_dir}/{folder}/af_out"):
        models = os.listdir(f"{alphafold_dir}/{folder}/af_out")
        for model in models:
            model_fullpath = f"{alphafold_dir}/{folder}/af_out/" + model + '/ranked_0.pdb'
            af_models[model] = model_fullpath

#############
### SEEDS ###
#############

# Read seed csv
seed_df = pd.read_csv("data/wzy/wzy.tsv", sep='\t', dtype=object)
seed_df.drop('serotype', axis=1, inplace=True)
seed_df = seed_df.rename(columns = {'genbank_taxon':'taxid', 'annotated':'seed', 'serotype_edited':'serotype'})

# Take subset of columns
columns_include = ['protein_accession', 'taxid', 'kingdom', 'phylum', 'class', \
    'order', 'family', 'genus', 'species', 'seq', 'serotype', 'pubmed', 'WzyE', 'CPS', 'CSDB_record_ID', 'csdb_image_path']
seed_df_small = seed_df[columns_include]

# Add alphafold columns
seed_df_small['alphafold_bool'] = seed_df_small['protein_accession'].apply(\
    lambda x: True if x in af_models else False )
seed_df_small['alphafold_path'] = seed_df_small['protein_accession'].apply(\
    lambda x: af_models[x] if x in af_models else '' )

# Make boolean seed column
seed_df_small['seed'] = True

print(f'Number of seeds: {len(seed_df_small)}')

############
### HITS ###
############

# Read hits csv
hits_df = pd.read_csv("data/wzy/blast/unique-hits.csv", sep=' ,', dtype=object, \
    engine='python', names = ['protein_accession', 'org', 'taxid', 'name', 'seq'])

# unique-hits.csv contains identical sequences
# we take only the ones from unique-hits.tsv
df = pd.read_csv("data/wzy/blast/unique-hits.tsv", sep='\t', dtype=object, names=['acc', 'evalue'])
hit_accessions = df.acc
hits_df = hits_df[hits_df.protein_accession.isin(hit_accessions)]

# Get taxonomy for blast hits
print('getting taxonomy')
ncbi = NCBITaxa()
def get_taxon(taxid, rank):
    try:
        lineage = ncbi.get_lineage(taxid)
        lineage2ranks = ncbi.get_rank(lineage)
        ranks2lineage = dict((rank, taxid) for (taxid, rank) in lineage2ranks.items())
        taxon = ncbi.get_taxid_translator([ranks2lineage[rank]])[ranks2lineage[rank]]
    except:
        taxon = 'NA'
    return taxon
desired_ranks = ['kingdom', 'phylum', 'class', 'order', 'family', 'genus', 'species']
for rank in desired_ranks:
    hits_df[rank] = hits_df.taxid.apply(lambda x: get_taxon(x, rank))

# Take subset of columns
columns_include = ['protein_accession', 'taxid', 'kingdom', 'phylum', 'class', \
    'order', 'family', 'genus', 'species', 'seq']
hits_df_small = hits_df[columns_include]
print(f'Number of unique blast hits: {len(hits_df_small)}')

# Remove seeds from hits df
hits_df_small = hits_df_small[~hits_df_small.protein_accession.isin(seed_df.protein_accession)]
print(f'Number of unique blast hits that are not also seeds: {len(hits_df_small)}')

# Add alphafold column
hits_df_small['alphafold_bool'] = False

# Add empty columns for data that we have for the seeds
empty_columns = ['alphafold_path', 'serotype', 'pubmed', 'WzyE', 'CPS', 'CSDB_record_ID', 'csdb_image_path']
for column_name in empty_columns:
    hits_df_small[column_name] = ''

# Add boolean seed column
hits_df_small['seed'] = False

#############
### MERGE ###
#############

# Merge
combined_df = pd.concat([seed_df_small, hits_df_small])
print(f'Number of unique blast hits and seeds: {len(combined_df)}')

# Outfile
output_filename = "data/wzy/seeds-and-hits.tsv"
combined_df.to_csv(output_filename, index=False, sep='\t')