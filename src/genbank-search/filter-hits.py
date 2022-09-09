import pandas as pd
import sys

enzyme_family = sys.argv[1]
threshold = float(sys.argv[2])

input_filename = f"data/{enzyme_family}/genbank-search/hits-evalue.tsv"

df = pd.read_csv(input_filename, sep='\t')

if enzyme_family == 'waal':
    df_filtered = df[(df['evalue_clade1'] < threshold) | (df['evalue_clade2'] < threshold)]
elif enzyme_family == 'eca-pol':
    df_filtered = df[df['evalue'] < threshold]
else:
    raise Exception('No setup for this family')

outfilename = f"data/{enzyme_family}/genbank-search/hits-evalue-{threshold}.tsv"
df_filtered.to_csv(outfilename, index=False, sep='\t')

outfilename = f"data/{enzyme_family}/genbank-search/hits-{threshold}.txt"
df_filtered['acc'].to_csv(outfilename, index=False, header=False)