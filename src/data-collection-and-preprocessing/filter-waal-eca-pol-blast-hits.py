from Bio import SeqIO
import pandas as pd
import sys

protein_family = sys.argv[1]
min_length = int(sys.argv[2])
max_length = int(sys.argv[3])
pct_threshold = int(sys.argv[4])

infile_path = f"data/{protein_family}/blast/unique-hits-short-headers.fasta"
fasta_sequences = SeqIO.parse(open(infile_path), 'fasta')
df = pd.read_csv(f"data/{protein_family}/blast/unique-hits.tsv", sep='\t', names=['acc', 'pct', 'evalue'], dtype={'acc':'object', 'pct':'float64', 'evalue':'float64'})
accessions_include = df.loc[df.pct >= pct_threshold, 'acc']

outfile_name = f"data/{protein_family}/blast/unique-hits-short-headers-{pct_threshold}-filtered.fasta"
with open(outfile_name, 'w') as outfile:
    for fasta in fasta_sequences:
        name, sequence = fasta.id, str(fasta.seq)
        acc = name.split(' ')[0]
        if acc in list(accessions_include):
            if len(sequence) >= min_length and len(sequence) <= max_length:
                outfile.write(f">{acc}\n{sequence}\n")