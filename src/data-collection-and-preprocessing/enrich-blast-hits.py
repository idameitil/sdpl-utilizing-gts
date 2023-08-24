import pandas as pd
import sys
from common import get_taxon, get_desired_sugars_df
import numpy as np

github_url = 'https://raw.githubusercontent.com/idameitil/wzy_polymerases/main/csdb/snfg/3'

# Read unique-hits.csv
unique_hits_df = pd.read_csv("data/wzy/blast/unique-hits.csv", sep=' ,', dtype=object, \
    engine='python', names = ['protein_accession', 'org', 'taxid', 'name', 'seq'])

# Take only the ones from unique-hits.tsv (as unique-hits.csv contains identical sequences)
non_identical_df = pd.read_csv("data/wzy/blast/unique-hits.tsv", sep='\t', dtype=object, names=['acc', 'evalue'])
unique_hits_df = unique_hits_df[unique_hits_df.protein_accession.isin(non_identical_df.acc)]

# Merge with serotype
serotype_df = pd.read_csv("data/wzy/blast-full-genbank/1e-15/hits-serotypes.tsv", sep='\t', dtype = object)
hits_with_serotype_df = pd.merge(unique_hits_df, serotype_df, on='protein_accession', how='left')

# Add taxonomy
print('getting taxonomy')

desired_ranks = ['phylum', 'class', 'order', 'family', 'genus', 'species']
# desired_ranks = ['species']
for rank in desired_ranks:
    hits_with_serotype_df[rank] = hits_with_serotype_df.taxid.apply(lambda x: get_taxon(x, rank))

# Add CSDB
print('getting csdb')

hits_with_serotype_df['id'] = hits_with_serotype_df['species'].astype('str') + \
    hits_with_serotype_df['serotype'].astype('str')

hits_with_serotype_df['CSDB_record_ID_forced'] = np.nan

desired_sugars_df = get_desired_sugars_df(
    list(hits_with_serotype_df.species),
    list(hits_with_serotype_df.serotype),
    list(hits_with_serotype_df.id),
    list(hits_with_serotype_df.CSDB_record_ID_forced)
    )

hits_with_serotype_df.drop('CSDB_record_ID_forced', axis=1, inplace=True)

hits_enriched = pd.merge(hits_with_serotype_df, desired_sugars_df, on='id', how='left')
hits_enriched.drop(['id'], axis = 1, inplace = True)

hits_enriched['csdb_image_path'] = hits_enriched.loc[pd.notnull(hits_enriched['CSDB_record_ID']), 
    'CSDB_record_ID'].apply(lambda x: f'{github_url}/{x}.gif')

# Write to file
hits_enriched.to_csv("data/wzy/blast/unique-hits-enriched.tsv", sep = '\t', index=False)

if len(hits_enriched) != len(hits_with_serotype_df):
    sys.stderr.write("WARNING: unique-hits-enriched.tsv has a different number of lines than selected-wzys.txt.")