from Bio import SeqIO
import sys

seed_fasta = "data/waal/waal.fasta"
seed_sequences = SeqIO.parse(open(seed_fasta), 'fasta')

blast_threshold = sys.argv[1]
cdhit_threshold = sys.argv[2]

hits_include_fasta = f"data/waal/blast/unique-hits-short-headers-{blast_threshold}-filtered-cdhit{cdhit_threshold}.fasta"
hit_sequences = SeqIO.parse(open(hits_include_fasta), 'fasta')

banned_filename = "data/waal/banned"
with open(banned_filename, 'r') as banned_file:
    banned = set()
    for line in banned_file:
        banned.add(line.strip())

outdir = "data/waal"

out_fasta_filename = f"{outdir}/seeds-and-hits{blast_threshold}-cdhit{cdhit_threshold}.fasta"
with open(out_fasta_filename, 'w') as outfile:
    accessions_done = set()
    lengths = []
    for entry in hit_sequences:
        if entry.id not in banned:
            outfile.write(f">{entry.id}\n{entry.seq}\n")
            accessions_done.add(entry.id)
    for entry in seed_sequences:
        if entry.id not in accessions_done:
            outfile.write(f">{entry.id}\n{entry.seq}\n")