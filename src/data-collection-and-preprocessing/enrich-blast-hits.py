from heapq import merge
from ete3 import NCBITaxa
import pandas as pd
import sys

### READ TSV ###
serotype_df = pd.read_csv("data/wzy/blast-full-genbank/1e-15/hits-serotypes.tsv", sep='\t', dtype = object)
seeds_and_hits_df = pd.read_csv("data/wzy/seeds-and-hits.tsv", '\t', dtype=object)
hits_df = pd.merge(serotype_df, seeds_and_hits_df, on='protein_accession', how='left')
hits_df['id'] = hits_df['species'].astype('str') + hits_df['serotype_x'].astype('str')

### ADD CSDB ###
# Load CSDB df
csdb_df = pd.read_csv("data/csdb/CSDB_slice_for_Ida.txt",
                      dtype={'pmid':'object', 'CSDB_record_ID': 'object', 'CSDB_nonpersistent_article_ID':'object'},
                      sep = '\t')

# Make dataframe with the needed sugars
data = []
row_id_done = []
banned_sugars = ['911', '22678']
print('getting csdb')
# Loop through polymerase df
for index, row in hits_df.iterrows():
    # If there's no forced sugar, save the one for this serotype
    # if pd.isna(row.CSDB_record_ID_forced):
        # Get rows in csdb df with that serotype
    rows_condition_true = csdb_df[(csdb_df.Taxonomic_name == row.species) & (csdb_df.Strain_or_Serogroup == row.serotype_x)]
    if len(rows_condition_true) > 0 and row.id not in row_id_done and rows_condition_true['CSDB_record_ID'].iloc[0] not in banned_sugars:
        data.append([row.id] + list(rows_condition_true.iloc[0]))
        row_id_done.append(row.id)
    # If there is a forced sugar, save that one
    # else:
    #     if row.CSDB_record_ID_forced == 'no_sugar':
    #         pass
    #     else:
    #         rows_condition_true = csdb_df[(csdb_df.CSDB_record_ID == row.CSDB_record_ID_forced)]
    #         if row.CSDB_record_ID_forced not in row_id_done:
    #             data.append([row.id] + list(rows_condition_true.iloc[0]))
    #             row_id_done.append(row.CSDB_record_ID_forced)
new_df = pd.DataFrame(data, columns=['id'] + list(csdb_df.columns))
new_df.drop(['Taxonomic_name', 'Strain_or_Serogroup'], axis = 1, inplace = True)

# Merge original df with CSDB df
merged_df = pd.merge(hits_df, new_df, on='id', how='left')
merged_df.drop(['id'], axis = 1, inplace = True)

### ADD CSDB IMAGE PATH COLUMN ###
merged_df['csdb_image_path'] = merged_df.loc[pd.notnull(merged_df['CSDB_record_ID_x']), 'CSDB_record_ID_x'].apply(lambda x: 'https://raw.githubusercontent.com/idameitil/wzy_polymerases/main/csdb/snfg/3/' + str(x) + '.gif')

### WRITE NEW TSV ###
merged_df.to_csv("data/wzy/blast-full-genbank/1e-15/hits-enriched.tsv", sep = '\t', index=False)

if len(merged_df) != len(hits_df):
    sys.stderr.write("WARNING: wzy.tsv has a different number of lines than selected-wzys.tsv.")