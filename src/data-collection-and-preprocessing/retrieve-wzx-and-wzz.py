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

wzz_tsv_outfile = open('data/wzz/wzz.tsv', 'w')
wzx_tsv_outfile = open('data/wzx/wzx.tsv', 'w')
names_wzz = [("gene", "wzz"), ("gene", "wzz (rol)"), ("gene", "wzzE"), ("gene", "wzzB"), ("gene", "wzz(fepE)"), ("product", "Wzz")]
names_wzx = [("gene", "wzx"), ("gene", "WzxC"), ("gene", "WzxE")]
wzz_data = []
wzx_data = []
outfile = open('dna_accession_versions', 'w')
for gb_record in SeqIO.parse(open(gb_file,"r"), "genbank") :
    outfile.write(gb_record.id + '\n')
    dna_accession = gb_record.name
    organism = gb_record.annotations['organism']
    for name, value in names_wzz:
        feature = get_cds_feature_with_qualifier_value(gb_record, name, value)
        if feature is not None:
            wzz_accession = feature.qualifiers.get('protein_id')[0]
            wzz_seq = feature.qualifiers.get('translation')[0]
            wzz_data.append((wzz_accession, organism, dna_accession, wzz_seq))
    for name, value in names_wzx:
        feature = get_cds_feature_with_qualifier_value(gb_record, name, value)
        if feature is not None:
            wzx_accession = feature.qualifiers.get('protein_id')[0]
            wzx_seq = feature.qualifiers.get('translation')[0]
            wzx_data.append((wzx_accession, organism, dna_accession, wzx_seq))
wzz_df = pd.DataFrame(wzz_data, columns = ['protein_accession', 'organism', 'dna_accession', 'seq'])
wzx_df = pd.DataFrame(wzz_data, columns = ['protein_accession', 'organism', 'dna_accession', 'seq'])

### Merge with wzy table ###

wzy_df = pd.read_csv("data/wzy/wzy.tsv", sep = '\t', dtype=object)
print(wzy_df)
wzy_columns = wzy_df.columns.drop(['WzyE', 'comment']).tolist()

wzy_df.drop(['protein_accession', 'seq'], axis=1, inplace=True)

wzz_merged_df = pd.merge(wzz_df, wzy_df, on='dna_accession', how='left')
wzx_merged_df = pd.merge(wzx_df, wzy_df, on='dna_accession', how='left')

print(wzz_merged_df)

### Write to file ###

wzz_final_df = wzz_merged_df.loc[:,wzy_columns]
wzx_final_df = wzx_merged_df.loc[:,wzy_columns]

#merged_df['CSDB_record_ID'] = merged_df['CSDB_record_ID'].astype(int, errors='ignore')

wzz_final_df.to_csv("data/wzz/wzz.tsv", sep='\t', index=False)
wzx_final_df.to_csv("data/wzx/wzx.tsv", sep='\t', index=False)