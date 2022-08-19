# Script only used once, maybe remove

import pandas as pd

wzy_df = pd.read_csv('data/selected-wzys.tsv', sep='\t', dtype=object)
correct_accession_file = open('dna_accession_versions')
correct_accession_list = []
for line in correct_accession_file:
    correct_accession_list.append(line.strip())
correct_accession_file.close()


for index, row in wzy_df.iterrows():
    old_accession = row.dna_accession
    found = False
    for acc in correct_accession_list:
        if not pd.isna(old_accession):
            if acc.startswith(old_accession):
                wzy_df.loc[index, 'dna_accession'] = acc
                found = True
    if found is False:
        print(old_accession)

wzy_df = wzy_df.to_csv('data/selected-wzys-new.tsv', sep='\t', index=False)