import os
import pandas as pd

# Read MSAs
msa_folder_name = "data/hhblits_cazy_families/msas-family-names"

family2members = {}
data = []
for filename in os.listdir(msa_folder_name):
    if '_' in filename or '-' in filename:
        continue
    family = filename[:4]
    members = []
    with open(f"{msa_folder_name}/{filename}", 'r') as infile:
        for line in infile:
            if line.startswith('>'):
                acc = line.strip().split()[0][1:]
                members.append(acc)
                data.append([family, acc])
    family2members[family] = members

new_df = pd.DataFrame(data, columns=['Family_membership_final', 'acc'])

old_df = pd.read_csv('data/wzy/wzy_with_cazy_family.tsv', sep='\t')

merged_df = pd.merge(left=old_df, right=new_df, how='left', left_on='protein_accession', right_on='acc')

final_df = merged_df.drop('acc', axis=1)

final_df.to_csv("data/wzy/wzy_with_cazy_family_accessions_msa-membership.tsv", sep='\t', index=False)