from Bio import SeqIO
import pandas as pd
import sys

protein_family = sys.argv[1]
min_length = int(sys.argv[2])
max_length = int(sys.argv[3])

infile_path = f"data/{protein_family}/blast/unique-hits-short-headers.fasta"
fasta_sequences = SeqIO.parse(open(infile_path), 'fasta')
df = pd.read_csv(f"data/{protein_family}/blast/unique-hits.tsv", sep='\t', names=['acc', 'evalue'], dtype={'acc':'object', 'evalue':'float64'})
accessions_include = df.loc[df.evalue < 1e-15, 'acc']

outfile_name = f"data/{protein_family}/blast/unique-hits-short-headers-1e-15-filtered.fasta"
with open(outfile_name, 'w') as outfile:
    for fasta in fasta_sequences:
        name, sequence = fasta.id, str(fasta.seq)
        acc = name.split(' ')[0]
        if acc in list(accessions_include):
            if len(sequence) > min_length and len(sequence) < max_length:
                outfile.write(f">{acc}\n{sequence}\n")