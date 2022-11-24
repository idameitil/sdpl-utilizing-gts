from Bio import SeqIO
import os

def read_clade(clade_filename):
    clade_accessions = set()
    with open(clade_filename) as infile:
        for line in infile:
            clade_accessions.add(line.strip().replace(' ', '_'))
    return clade_accessions

def write_output(cladename, fasta_dict):
    output_filename = f"data/waal/clades/{clade}/{clade}.fasta"
    with open(output_filename, 'w') as outfile:
        for acc in fasta_dict:
            outfile.write(f">{acc}\n{fasta_dict[acc]}\n")
    return

clades = [dir for dir in os.listdir("data/waal/clades") if not dir.startswith('.')]

for clade in clades:
    accession_list_filename = f"data/waal/clades/{clade}/{clade}"

    clade_accessions = read_clade(accession_list_filename)

    acc2seq = {}
    for entry in SeqIO.parse("data/waal/seeds-and-reduced-hits.fasta", format='fasta'):
        if entry.id in clade_accessions:
            acc2seq[entry.id] = entry.seq

    write_output(clade, acc2seq)