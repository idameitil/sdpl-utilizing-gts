from ete3 import NCBITaxa
import pandas as pd
import sys

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

def get_needed_sugars_df():
    needed_sugars = []
    row_id_done = []
    banned_sugars = ['911', '22678']
    for index, row in hits_with_serotype_df.iterrows():
        if pd.isnull(row.serotype):
            continue
        rows_condition_true = csdb_df[(csdb_df.Taxonomic_name == row.species) & (csdb_df.Strain_or_Serogroup == row.serotype)]
        if len(rows_condition_true) > 0 and row.id not in row_id_done and \
        rows_condition_true['CSDB_record_ID'].iloc[0] not in banned_sugars:
            needed_sugars.append([row.id] + list(rows_condition_true.iloc[0]))
            row_id_done.append(row.id)
    needed_sugars_df = pd.DataFrame(needed_sugars, columns=['id'] + list(csdb_df.columns))
    needed_sugars_df.drop(['Taxonomic_name', 'Strain_or_Serogroup'], axis = 1, inplace = True)
    return needed_sugars_df

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

desired_ranks = ['kingdom', 'phylum', 'class', 'order', 'family', 'genus', 'species']
for rank in desired_ranks:
    hits_with_serotype_df[rank] = hits_with_serotype_df.taxid.apply(lambda x: get_taxon(x, rank))

# Add CSDB
print('getting csdb')

hits_with_serotype_df['id'] = hits_with_serotype_df['species'].astype('str') + \
    hits_with_serotype_df['serotype'].astype('str')

csdb_df = pd.read_csv("data/csdb/CSDB_slice_for_Ida.txt",
                      dtype=object, sep = '\t')
needed_sugars_df = get_needed_sugars_df()

hits_enriched = pd.merge(hits_with_serotype_df, needed_sugars_df, on='id', how='left')
hits_enriched.drop(['id'], axis = 1, inplace = True)

hits_enriched['csdb_image_path'] = hits_enriched.loc[pd.notnull(hits_enriched['CSDB_record_ID']), 
    'CSDB_record_ID'].apply(lambda x: f'{github_url}/{x}.gif')

# Write to file
hits_enriched.to_csv("data/wzy/blast/unique-hits-enriched.tsv", sep = '\t', index=False)

if len(hits_enriched) != len(hits_with_serotype_df):
    sys.stderr.write("WARNING: wzy.tsv has a different number of lines than selected-wzys.tsv.")