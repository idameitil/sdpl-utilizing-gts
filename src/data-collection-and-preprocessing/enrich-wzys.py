import pandas as pd
from common import get_taxon, get_desired_sugars_df
import sys

def not_pd_null(value):
    return not pd.isnull(value)

### READ SELECTED TSV ###
polymerase_df = pd.read_csv("data/selected-wzys.tsv", sep='\t', dtype = object)
polymerase_df['id'] = polymerase_df['species_original'].astype('str') + polymerase_df['serotype_edited'].astype('str')

### ADD TAXONOMY ###
desired_ranks = ['kingdom', 'phylum', 'class', 'order', 'family', 'genus', 'species']
for rank in desired_ranks:
    polymerase_df[rank] = polymerase_df.genbank_taxon.apply(lambda x: get_taxon(x, rank))

### ADD CSDB ###
desired_sugars_df = get_desired_sugars_df(
    list(polymerase_df.species),
    list(polymerase_df.serotype_edited),
    list(polymerase_df.id),
    list(polymerase_df.CSDB_record_ID_forced)
    )

# Merge original df with CSDB df
merged_df = pd.merge(polymerase_df, desired_sugars_df, on='id', how='left')
merged_df.drop(['id'], axis = 1, inplace = True)

# Add corrected_sugar_string
data = []
for index, row in merged_df.iterrows():
    if not_pd_null(row.corrected_sugar_string):
        data.append(row.corrected_sugar_string)
    else:
        data.append(row.CSDB_Linear)
merged_df['CSDB_Linear_corrected'] = data

# Remove sugar data from 'no_sugar' rows
merged_df.loc[merged_df.CSDB_record_ID_forced == 'no_sugar', ['CSDB_record_ID', 'CSDB_Linear', 'glycoct', 'CSDB_nonpersistent_article_ID', 'doi', 'pmid', 'NCBI_TaxID']] = None

### ADD ANNOTATED COLUMN ###
merged_df['annotated'] = 1

### ADD LENGTH COLUMN ###
merged_df['length'] = merged_df.seq.apply(lambda x: len(x))

### ADD CSDB IMAGE PATH COLUMN ###
merged_df['csdb_image_path'] = merged_df.loc[pd.notnull(merged_df['CSDB_record_ID']), 'CSDB_record_ID'].apply(lambda x: 'https://raw.githubusercontent.com/idameitil/wzy_polymerases/main/csdb/snfg/3/' + str(x) + '.gif')

### WRITE NEW TSV ###
merged_df.to_csv("data/wzy/wzy.tsv", sep = '\t', index=False)

if len(merged_df) != len(polymerase_df):
    sys.stderr.write("WARNING: wzy.tsv has a different number of lines than selected-wzys.tsv. Check that duplicated serotypes have the same forced sugar. \n")
# To see duplicates:
# print(merged_df[merged_df.protein_accession.duplicated()])
