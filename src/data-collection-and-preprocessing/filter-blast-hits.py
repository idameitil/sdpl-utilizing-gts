import os

# Length filter
infile = open('data/wzy/blast/unique-hits.fasta')
outfile = open('data/wzy/blast/unique-hits-min320max600.fasta', 'w')
#outfile_tsv = open("data/wzy/blast/unique-hits-min320max600.tsv", 'w')
#outfile_tsv.write('accession\tsequence\n')
first = True
for line in infile:
    # Header
    if line.startswith('>'):
        # Save previous
        if not first:
            if len(seq) > 320 and len(seq) < 600 and seq.startswith("M"):
                outfile.write(f'>{acc}\n{seq}\n')
                #outfile_tsv.write(f'{acc}\t{seq}\n')
        acc = line.split(' ')[0][1:]
        seq = ''
        first = False
    # Seq
    else:
        seq += line.strip()

infile.close()
outfile.close()
#outfile_tsv.close()

# CD-HIT
os.system(f'cd-hit -i data/wzy/blast/unique-hits-min320max600.fasta -o data/wzy/blast/unique-hits-min320max600-cdhit99.fasta -c 0.99')