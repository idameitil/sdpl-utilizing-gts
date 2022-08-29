import pandas as pd
from Bio import SeqIO

hit_filename = "data/waal/genbank-search/hits-evalue.tsv"
df = pd.read_csv(hit_filename, sep = '\t')

genbank_filename = "data/genbank/genbank.fa"

fasta = SeqIO.parse(open(genbank_filename, 'r'), format='fasta')

output_filename = "data/waal/genbank-search/hits.fasta"
with open(output_filename, 'w') as outfile:
    for entry in fasta:
        if entry.id in set(df.acc):
            outfile.write(f">{entry.id}\n{entry.seq}\n")
