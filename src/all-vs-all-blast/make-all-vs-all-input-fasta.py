import shutil
from Bio import SeqIO

unique_hits_fasta_filename = 'data/wzy/blast/unique-hits-short-headers.fasta'
hit_fasta = SeqIO.parse(unique_hits_fasta_filename, format='fasta')
accessions_hits = {entry.id for entry in hit_fasta}

seeds_fasta_filename = 'data/wzy/wzy.fasta'
seed_fasta = SeqIO.parse(seeds_fasta_filename, format='fasta')

output_filename = 'data/wzy/all-vs-all-blast/seeds-and-unique-hits.fasta'
shutil.copy(unique_hits_fasta_filename, output_filename)

with open(output_filename, 'a') as seeds_and_unique_hits_file:
    for entry in seed_fasta:
        if entry.id not in accessions_hits:
            seeds_and_unique_hits_file.write(f">{entry.id}\n{entry.seq}\n")
