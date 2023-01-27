from Bio import SeqIO

input_filename = "data/eca-pol/MSA_CAZy_family/accessions_clade1"
accessions_clade1 = list()
with open(input_filename) as infile:
    for line in infile:
        accessions_clade1.append(line.strip().replace(" ", "_"))

reblasting_fasta_filename = "data/eca-pol/MSA_CAZy_family/reblast_hits.fasta"
fasta_sequences = SeqIO.parse(open(reblasting_fasta_filename),'fasta')

output_filename = "data/eca-pol/MSA_CAZy_family/clade1.fasta"
with open(output_filename, 'w') as outfile:
    for fasta in fasta_sequences:
        if fasta.id in accessions_clade1:
            outfile.write(f">{fasta.id}\n{str(fasta.seq)}\n")