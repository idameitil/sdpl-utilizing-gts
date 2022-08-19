from Bio import SeqIO
from random import sample
import os
import shutil

# Choose 10 from each
fasta_filenames = ["data/waal/clades/clade1/clade1.fasta", "data/waal/clades/clade2-1/clade2-1.fasta", "data/waal/clades/clade2-2/clade2-2.fasta", "data/gt66/GT66.fasta", "data/wzy/wzy.fasta"]
names = ["clade1", "clade2-1", "clade2-2", "gt66", "wzy"]
hmms = ["data/waal/clades/clade1/clade1.hmm", "data/waal/clades/clade2-1/clade2-1.hmm", "data/waal/clades/clade2-2/clade2-2.hmm"]

for fasta_filename, name in zip(fasta_filenames, names):
    # Read fasta
    print(fasta_filename)
    seqs = SeqIO.parse(fasta_filename, format="fasta")

    outdir_name = f"data/waal/hmmscan/{name}"

    if not os.path.isdir(outdir_name):
        os.makedirs(outdir_name)
    else:
        shutil.rmtree(outdir_name)
        os.makedirs(outdir_name)

    for protein in sample(list(seqs), 10):
        # Write fasta
        accession = protein.id.split('|')[0]
        fasta_filename = f"{outdir_name}/{accession}.fasta"
        with open(fasta_filename, 'w') as outfile:
            outfile.write(f">{accession}\n{str(protein.seq)}\n")
        # Run against hmm db
        command = f"hmmscan data/waal/hmmscan/db/hmmdb {fasta_filename} > {outdir_name}/{accession}.scan"
        os.system(command)
