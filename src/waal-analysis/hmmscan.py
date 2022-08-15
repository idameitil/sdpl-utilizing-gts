from Bio import SeqIO
from random import sample
import os

# Choose 10 from each
fasta_filenames = ["data/waal/clades/clade1/clade1.fasta", "data/waal/clades/clade2-1/clade2-1.fasta", "data/waal/clades/clade2-2/clade2-2.fasta", "data/gt66/GT66.fasta", "data/wzy/wzy.fasta"]

for fasta_filename in fasta_filenames:
    # Read fasta
    print(fasta_filename)
    seqs = SeqIO.parse(fasta_filename, format="fasta")

    sample = sample(list(seqs), 10)

    os.makedirs("")

# Run against the 3 HMMs with hmmscan