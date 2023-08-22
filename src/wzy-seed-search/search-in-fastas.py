from Bio import SeqIO
import os 
import pandas as pd
import numpy as np

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
with open("manuscript/supplementary/supplementary-tables/bp-pol-seeds.txt", 'w') as outfile:
    outfile.write(f"protein_accession\tspecies\tserotype\tCAZy_family\tCSDB_Linear_corrected\n")
    df = pd.read_csv("data/wzy/wzy.tsv", sep='\t')
    for index, row in df.iterrows():
        acc = row.protein_accession
        family_membership = ''
        for family in family2accs:
            if acc in family2accs[family]:
                family_membership = family
                count += 1
        if pd.isnull(row.CSDB_Linear_corrected):
            csdb = ''
        else:
            csdb = row.CSDB_Linear_corrected
        
        outfile.write(f"{acc}\t{row.species_original}\t{row.serotype}\t{family_membership}\t{csdb}\n")

print(count)