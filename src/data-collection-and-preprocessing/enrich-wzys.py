from heapq import merge
from ete3 import NCBITaxa
import pandas as pd

### READ SELECTED TSV ###
polymerase_df = pd.read_csv("data/selected-wzys.tsv", sep='\t', dtype = object)
polymerase_df['id'] = polymerase_df['species_original'].astype('str') + polymerase_df['serotype_edited'].astype('str')

### ADD TAXONOMY ###
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
    polymerase_df[rank] = polymerase_df.genbank_taxon.apply(lambda x: get_taxon(x, rank))

### ADD CSDB ###
# Load CSDB df
csdb_df = pd.read_csv("data/csdb/CSDB_slice_for_Ida.txt",
                      dtype={'pmid':'object', 'CSDB_record_ID': 'object', 'CSDB_nonpersistent_article_ID':'object'},
                      sep = '\t')

# Make dataframe with the needed sugars
data = []
row_id_done = []
print('getting csdb')
# Loop through polymerase df
for index, row in polymerase_df.iterrows():
    # If there's no forced sugar, save the one for this serotype
    if pd.isna(row.CSDB_record_ID_forced):
        # Get rows in csdb df with that serotype
        rows_condition_true = csdb_df[(csdb_df.Taxonomic_name == row.species) & (csdb_df.Strain_or_Serogroup == row.serotype_edited)]
        if len(rows_condition_true) > 0 and row.id not in row_id_done:
            data.append([row.id] + list(rows_condition_true.iloc[0]))
            row_id_done.append(row.id)
    # If there is a forced sugar, save that one
    else:
        if row.CSDB_record_ID_forced == 'no_sugar':
            pass
        else:
            rows_condition_true = csdb_df[(csdb_df.CSDB_record_ID == row.CSDB_record_ID_forced)]
            if row.CSDB_record_ID_forced not in row_id_done:
                data.append([row.id] + list(rows_condition_true.iloc[0]))
                row_id_done.append(row.CSDB_record_ID_forced)
new_df = pd.DataFrame(data, columns=['id'] + list(csdb_df.columns))
new_df.drop(['Taxonomic_name', 'Strain_or_Serogroup'], axis = 1, inplace = True)

# Merge original df with CSDB df
merged_df = pd.merge(polymerase_df, new_df, on='id', how='left')
merged_df.drop(['id'], axis = 1, inplace = True)

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
    sys.stderr.write("WARNING: wzy.tsv has a different number of lines than selected-wzys.tsv.")