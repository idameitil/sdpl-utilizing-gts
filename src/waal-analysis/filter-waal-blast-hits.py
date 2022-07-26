from Bio import SeqIO
import pandas as pd

infile_path = "data/waal/blast/unique-hits-short-headers.fasta"
fasta_sequences = SeqIO.parse(open(infile_path), 'fasta')
df = pd.read_csv("data/waal/blast/unique-hits.tsv", sep='\t', names=['acc', 'evalue'], dtype={'acc':'object', 'evalue':'float64'})
accessions_include = df.loc[df.evalue < 1e-15, 'acc']

outfile_name = "data/waal/blast/unique-hits-short-headers-1e-15-filtered.fasta"
with open(outfile_name, 'w') as outfile:
    for fasta in fasta_sequences:
        name, sequence = fasta.id, str(fasta.seq)
        acc = name.split(' ')[0]
        if acc in list(accessions_include):
            if len(sequence) > 280 and len(sequence) < 500:
                outfile.write(f">{acc}\n{sequence}\n")