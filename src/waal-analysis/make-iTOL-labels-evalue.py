import pandas as pd
from colour import Color
import math

input_filename = "data/waal/genbank-search/hits-evalue.tsv"

df = pd.read_csv(input_filename, sep='\t')

header = f"DATASET_COLORSTRIP\nSEPARATOR COMMA\nDATASET_LABEL,length\nCOLOR,#ff0000\nDATA\n"

max = math.log10(df[['evalue_clade1', 'evalue_clade2']].dropna().values.max())
min = math.log10(df[['evalue_clade1', 'evalue_clade2']].dropna().values.min())
n = int(max - min)
print(n)
red = Color("white")
colors = list(red.range_to(Color("black"),n))

output_filename = "data/waal/genbank-search/genbank-hits-tree/itol-evalue-clade1.txt"
with open(output_filename, 'w') as outfile:
    outfile.write(header)
    for index, row in df.iterrows():
        if not math.isnan(row.evalue_clade1):
            color=colors[int(math.log10(row.evalue_clade1))].hex
            outfile.write(f"{row.acc},{color},{row.evalue_clade1}\n")

output_filename = "data/waal/genbank-search/genbank-hits-tree/itol-evalue-clade2.txt"
with open(output_filename, 'w') as outfile:
    outfile.write(header)
    for index, row in df.iterrows():
        if not math.isnan(row.evalue_clade2):
            color=colors[int(math.log10(row.evalue_clade2))].hex
            outfile.write(f"{row.acc},{color},{row.evalue_clade2}\n")

output_filename = "data/waal/genbank-search/genbank-hits-tree/itol-evalue-more-than-1e-15.txt"
with open(output_filename, 'w') as outfile:
    outfile.write(header)
    for index, row in df.iterrows():
        if not math.isnan(row.evalue_clade1) and not math.isnan(row.evalue_clade2):
            if row.evalue_clade1 > 1e-15 and row.evalue_clade2 > 1e-15:
                outfile.write(f"{row.acc},#eb3a34,{row.evalue_clade2}\n")
