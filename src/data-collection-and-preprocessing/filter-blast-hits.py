import os

# Length filter
infile = open('data/wzy/blast/unique-hits.fasta')
outfile = open('data/wzy/blast/unique-hits-min320max600.fasta', 'w')
first = True
for line in infile:
    # Header
    if line.startswith('>'):
        # Save previous
        if not first:
            if len(seq) > 320 and len(seq) < 600:
                outfile.write(f'>{acc}\n{seq}\n')
        acc = line.split(' ')[0][1:]
        seq = ''
        first = False
    # Seq
    else:
        seq += line.strip()

infile.close()
outfile.close()

# CD-HIT
os.system(f'cd-hit -i data/wzy/blast/unique-hits-min320max600.fasta -o data/wzy/blast/unique-hits-min320max600-cdhit99.fasta -c 0.99')