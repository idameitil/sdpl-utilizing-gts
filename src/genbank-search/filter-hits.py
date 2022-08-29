import pandas as pd

input_filename = "data/waal/genbank-search/hits-evalue.tsv"

df = pd.read_csv(input_filename, sep='\t')

df_filtered = df[(df['evalue_clade1'] < 1e-5) | (df['evalue_clade2'] < 1e-5)]

outfilename = "data/waal/genbank-search/hits-evalue-1e-5.tsv"

df_filtered.to_csv(outfilename, index=False, sep='\t')
