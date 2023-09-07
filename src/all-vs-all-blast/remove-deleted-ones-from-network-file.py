import pandas as pd

network_filename = "data/wzy/all-vs-all-blast/network"

new_network_filename = "data/wzy/all-vs-all-blast/network-new"

fasta_filename = "data/wzy/all-vs-all-blast/seeds-and-unique-hits.fasta"

from Bio import SeqIO

fasta_sequences = SeqIO.parse(open(fasta_filename),'fasta')

accessions_include = []
for fasta in fasta_sequences:
    accessions_include.append(fasta.id)

df = pd.read_csv(network_filename, sep='\t')
df_filtered = df[(df.source.isin(accessions_include)) & (df.target.isin(accessions_include))]
df_filtered.to_csv(new_network_filename, sep = '\t', columns=['source', 'target', 'score'], header=False, index=False)