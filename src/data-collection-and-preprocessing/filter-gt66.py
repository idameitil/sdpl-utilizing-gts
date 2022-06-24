from Bio import SeqIO
import re

infile = "data/gt66/GT66.fasta"
fasta_sequences = SeqIO.parse(open(infile), 'fasta')

# allowed_characters = r'[^\.ARNDCQEGHILKMFPSTWYVX]'
# re.search(allowed_characters, sequence)
allowed_characters = set("ARNDCQEGHILKMFPSTWYVX")
count_total = 0
count_length_filter = 0
outfile = open("data/gt66/GT66-filtered.fasta", "w")
for fasta in fasta_sequences:
    count_total += 1
    name, sequence = fasta.id, str(fasta.seq)
    if len(sequence) > 200 and len(sequence) < 1000 and set(sequence) <= allowed_characters:
        header = name.split('>')
        outfile.write(f">{name}\n{sequence}\n")
    else:
        print(sequence)
        count_length_filter += 1

print(f"Total number of sequences {count_total}")
print(f"Removed by length filter {count_length_filter}")
