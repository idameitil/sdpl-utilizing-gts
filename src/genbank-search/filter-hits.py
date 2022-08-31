import pandas as pd
import sys

enzyme_family = sys.argv[1]

input_filename = f"data/{enzyme_family}/genbank-search/hits-evalue.tsv"

df = pd.read_csv(input_filename, sep='\t')

if enzyme_family == 'waal':
    df_filtered = df[(df['evalue_clade1'] < 1e-5) | (df['evalue_clade2'] < 1e-5)]
elif enzyme_family == 'eca-pol':
    df_filtered = df[df['evalue'] < 1e-5]
else:
    raise Exception('No setup for this family')

outfilename = f"data/{enzyme_family}/genbank-search/hits-evalue-1e-5.tsv"

df_filtered.to_csv(outfilename, index=False, sep='\t')
