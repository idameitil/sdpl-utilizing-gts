import pandas as pd
from common import get_taxon, get_desired_sugars_df
import sys
import re

def not_pd_null(value):
    return not pd.isnull(value)

enzyme_family = sys.argv[1]
if enzyme_family == 'wzy':
    original_df = pd.read_csv("data/selected-wzys.tsv", sep='\t', dtype = object)
    output_filename = "data/wzy/wzy.tsv"
elif enzyme_family == 'waal':
    original_df = pd.read_csv("data/waal/selected-waals.tsv", sep='\t', dtype = object)
    output_filename = "data/waal/waal.tsv"

### READ SELECTED TSV ###
original_df['id'] = original_df['species_original'].astype('str') + original_df['serotype'].astype('str')

### ADD TAXONOMY ###
desired_ranks = ['phylum', 'class', 'order', 'family', 'genus', 'species']
for rank in desired_ranks:
    original_df[rank] = original_df.genbank_taxon.apply(lambda x: get_taxon(x, rank))

### ADD CSDB ###
desired_sugars_df = get_desired_sugars_df(
    list(original_df.species),
    list(original_df.serotype),
    list(original_df.id),
    list(original_df.CSDB_record_ID_forced)
    )

# Merge original df with CSDB df
merged_df = pd.merge(original_df, desired_sugars_df, on='id', how='left')
merged_df.drop(['id'], axis = 1, inplace = True)

# Add corrected_sugar_string
data = []
for index, row in merged_df.iterrows():
    if not_pd_null(row.corrected_sugar_string):
        data.append(row.corrected_sugar_string)
    else:
        data.append(row.CSDB_Linear)
merged_df['CSDB_Linear_corrected'] = data

# Add bond and sugar stereochemistry
def is_axial_equatorial(alpha_beta, D_L):
    if alpha_beta == 'a' and D_L == 'D' or alpha_beta == 'b' and D_L == 'L':
        return 'axial'
    if alpha_beta == 'a' and D_L == 'L' or alpha_beta == 'b' and D_L == 'D':
        return 'equatorial'

if enzyme_family == 'wzy':
    alpha_beta = []
    D_L = []
    axial_equatorial = []
    for index, row in merged_df.iterrows():
        if not_pd_null(row.CSDB_Linear_corrected):
            splitted_string = row.CSDB_Linear_corrected.split(' ')[0].split(']')[-1]
            regex = r"([ab])([DL])"
            # sugar_string = row.CSDB_Linear_corrected.split(' ')[0]
            result = re.findall(regex, splitted_string)
            if len(result) > 0:
                alpha_beta.append(result[-1][0])
                D_L.append(result[-1][1])
                axial_equatorial.append(is_axial_equatorial(result[-1][0], result[-1][1]))
            else:
                print('Error: Could not read sugar')
        else:
            alpha_beta.append('')
            D_L.append('')
            axial_equatorial.append('')
    merged_df['alpha_beta'] = alpha_beta
    merged_df['D_L'] = D_L
    merged_df['axial_equatorial'] = axial_equatorial

# Remove sugar data from 'no_sugar' rows
merged_df.loc[merged_df.CSDB_record_ID_forced == 'no_sugar', ['CSDB_record_ID', 'CSDB_Linear', 'glycoct', 'CSDB_nonpersistent_article_ID', 'doi', 'pmid', 'NCBI_TaxID']] = None

### ADD ANNOTATED COLUMN ###
merged_df['annotated'] = 1

### ADD LENGTH COLUMN ###
merged_df['length'] = merged_df.seq.apply(lambda x: len(x))

### ADD CSDB IMAGE PATH COLUMN ###
merged_df['csdb_image_path'] = merged_df.loc[pd.notnull(merged_df['CSDB_record_ID']), 'CSDB_record_ID'].apply(lambda x: 'https://raw.githubusercontent.com/idameitil/wzy_polymerases/main/csdb/snfg/3/' + str(x) + '.gif')

### WRITE NEW TSV ###
merged_df.to_csv(output_filename, sep = '\t', index=False)

if len(merged_df) != len(original_df):
    sys.stderr.write("WARNING: output file has a different number of lines than inputfile. Check that duplicated serotypes have the same forced sugar. \n")
# To see duplicates:
# print(merged_df[merged_df.protein_accession.duplicated()])
