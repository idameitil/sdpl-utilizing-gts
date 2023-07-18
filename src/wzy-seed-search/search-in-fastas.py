from Bio import SeqIO
import os 
import pandas as pd

# Read all fastas
fasta_dir = "data/wzy/all-familiy-fastas"
fastas = os.listdir(fasta_dir)
family2accs = {}
for filename in fastas:
    filepath = f"{fasta_dir}/{filename}"
    fasta_sequences = SeqIO.parse(open(filepath),'fasta')
    accs = []
    for fasta in fasta_sequences:
        name, sequence = fasta.id, str(fasta.seq)
        acc = name.split('|')[0]
        accs.append(acc)
    family = filename.replace('.txt', '')
    family2accs[family] = accs

# Read seeds file
count = 0
with open("data/wzy/seed-family-membership-final.tsv", 'w') as outfile:
    df = pd.read_excel("data/wzy/wzy_with_cazy_family_accessions.xls")
    for index, row in df.iterrows():
        acc = row.protein_accession
        family_membership = ''
        for family in family2accs:
            if acc in family2accs[family]:
                family_membership = family
                count += 1
        outfile.write(f"{acc}\t{row.CAZy_ID}\t{family_membership}\n")

print(count)