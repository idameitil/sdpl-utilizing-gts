import os
import pandas as pd
pd.options.mode.chained_assignment = None

#############
# SEEDS 
#############

# Read seed csv
seed_df = pd.read_csv("data/wzy/wzy.tsv", sep='\t', dtype=object)
seed_df.drop('serotype', axis=1, inplace=True)
seed_df = seed_df.rename(columns = {'genbank_taxon':'taxid', 'annotated':'seed', 'serotype_edited':'serotype'})

# Take subset of columns
columns_include = ['protein_accession', 'taxid', 'kingdom', 'phylum', 'class', \
    'order', 'family', 'genus', 'species', 'seq', 'serotype', 'pubmed', 'CPS', \
    'CSDB_record_ID', 'csdb_image_path', 'is_bond_correct', 'alpha_beta', 'D_L', 'axial_equatorial']
seed_df_small = seed_df[columns_include]

# Get alphafold models
alphafold_dir = "data/wzy/alphafold"
af_models = {accession: f"{alphafold_dir}/{accession}/ranked_0.pdb"
    for accession in os.listdir(alphafold_dir) if not accession.startswith('.')}

# Add alphafold columns
seed_df_small['alphafold_bool'] = seed_df_small['protein_accession'].apply(\
    lambda x: '1' if x in af_models else '0')
seed_df_small['alphafold_path'] = seed_df_small['protein_accession'].apply(\
    lambda x: af_models[x] if x in af_models else '')

# Make boolean seed column
seed_df_small['seed'] = '1'

#############
# HITS 
#############

# Read hits csv
hits_df = pd.read_csv("data/wzy/blast/unique-hits-enriched.tsv", sep='\t', dtype=object)

# Take subset of columns
columns_include = ['protein_accession', 'taxid', 'kingdom', 'phylum', 'class', \
    'order', 'family', 'genus', 'species', 'seq', 'serotype', 'CSDB_record_ID', 'csdb_image_path']
hits_df_small = hits_df[columns_include]

# Remove seeds from hits df
hits_df_small = hits_df_small[~hits_df_small.protein_accession.isin(seed_df.protein_accession)]

# Add alphafold column
hits_df_small['alphafold_bool'] = '0'

# Add empty columns for data that we have for the seeds
empty_columns = ['alphafold_path', 'pubmed', 'CPS', 'alpha_beta', 'D_L', 'axial_equatorial']
for column_name in empty_columns:
    hits_df_small[column_name] = ''

# Add boolean seed column
hits_df_small['seed'] = '0'

#############
# MERGE 
#############

combined_df = pd.concat([seed_df_small, hits_df_small])

output_filename = "data/wzy/seeds-and-hits.tsv"
combined_df.to_csv(output_filename, index=False, sep='\t')