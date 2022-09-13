from Bio import SeqIO
import sys
import pandas as pd

### Retrieve Wzx and Wzz from genbank records ###

def get_cds_feature_with_qualifier_value(seq_record, name, value):
    # Loop over the features
    for feature in seq_record.features:
        if feature.type == "CDS" and value in feature.qualifiers.get(name, []):
            return feature
    # Could not find it
    return None


gb_file = 'data/selected-OAGCs.gb'

names_wzz = [("gene", "wzz"), ("gene", "wzz (rol)"), ("gene", "wzzE"), ("gene", "wzzB"), ("gene", "wzz(fepE)"), ("product", "Wzz")]
names_wzx = [("gene", "wzx"), ("gene", "WzxC"), ("gene", "WzxE")]
names_waal = [("gene", "waaL"), ("product", "O-antigen ligase")]
wzz_data = []
wzx_data = []
waal_data = []
wzz_accessions_done = []
wzx_accessions_done = []
waal_accessions_done = []
waal_banned = ['ADT77239.1', 'AHG17028.1', 'ABB68107.1']
for gb_record in SeqIO.parse(open(gb_file,"r"), "genbank") :
    dna_accession = gb_record.id
    organism = gb_record.annotations['organism']
    # Wzz
    for name, value in names_wzz:
        feature = get_cds_feature_with_qualifier_value(gb_record, name, value)
        if feature is not None:
            wzz_accession = feature.qualifiers.get('protein_id')[0]
            if wzz_accession not in wzz_accessions_done:
                wzz_seq = feature.qualifiers.get('translation')[0]
                wzz_data.append((wzz_accession, organism, dna_accession, wzz_seq))
                wzz_accessions_done.append(wzz_accession)
    # Wzx
    for name, value in names_wzx:
        feature = get_cds_feature_with_qualifier_value(gb_record, name, value)
        if feature is not None:
            wzx_accession = feature.qualifiers.get('protein_id')[0]
            if wzx_accession not in wzx_accessions_done:
                wzx_seq = feature.qualifiers.get('translation')[0]
                wzx_data.append((wzx_accession, organism, dna_accession, wzx_seq))
                wzx_accessions_done.append(wzx_accession)
    # WaaL
    for name, value in names_waal:
        feature = get_cds_feature_with_qualifier_value(gb_record, name, value)
        if feature is not None:
            waal_accession = feature.qualifiers.get('protein_id')[0]
            if waal_accession not in waal_accessions_done and waal_accession not in waal_banned:
                waal_seq = feature.qualifiers.get('translation')[0]
                waal_data.append((waal_accession, organism, dna_accession, waal_seq))
                waal_accessions_done.append(waal_accession)
wzz_df = pd.DataFrame(wzz_data, columns = ['protein_accession', 'organism', 'dna_accession', 'seq'])
wzx_df = pd.DataFrame(wzx_data, columns = ['protein_accession', 'organism', 'dna_accession', 'seq'])
waal_df = pd.DataFrame(waal_data, columns = ['protein_accession', 'organism', 'dna_accession', 'seq'])

### Merge with wzy table ###

# Read wzy_df
wzy_df = pd.read_csv("data/wzy/wzy.tsv", sep = '\t', dtype=object)
wzy_columns = wzy_df.columns.drop(['comment']).tolist()
# Remove columns
wzy_df.drop(['protein_accession', 'seq'], axis=1, inplace=True)
# Merge
wzz_merged_df = pd.merge(wzz_df, wzy_df, on='dna_accession', how='left')
wzx_merged_df = pd.merge(wzx_df, wzy_df, on='dna_accession', how='left')
waal_merged_df = pd.merge(waal_df, wzy_df, on='dna_accession', how='left')

### Write to file ###
wzz_final_df = wzz_merged_df.loc[:,wzy_columns]
wzx_final_df = wzx_merged_df.loc[:,wzy_columns]
waal_final_df = waal_merged_df.loc[:,wzy_columns]

wzz_final_df.to_csv("data/wzz/wzz.tsv", sep='\t', index=False)
wzx_final_df.to_csv("data/wzx/wzx.tsv", sep='\t', index=False)
waal_final_df.to_csv("data/waal/waal.tsv", sep='\t', index=False)