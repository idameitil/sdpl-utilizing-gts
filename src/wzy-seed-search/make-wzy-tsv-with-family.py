import pandas as pd

wzy_df = pd.read_csv('data/wzy/wzy.tsv', sep='\t')
family_df = pd.read_excel('data/wzy/seeds-cazyfamily.xlsx')

merged_df = pd.merge(wzy_df, family_df, on='protein_accession', how='left')
old2newnames = {'X617': 'GTxx4', 'X631': 'GTxx5', 'X634': 'GTxx6',
         'X613': 'GTxx7', 'X614': 'GTxx8', 'X609': 'GTxx9', 'X607': 'GTx10', 'X605': 'GTx11',
         'X610': 'GTx12', 'X612': 'GTx13', 'X606': 'GTx14', 'X611': 'GTx15', 'X608': 'GTx16', 'X633': 'GTx17'}
merged_df2 = merged_df.replace({"CAZy_family": old2newnames})

output_filename = 'data/wzy/wzy-with-CAZy-family.tsv'
merged_df2.to_csv(output_filename, sep='\t', index=False)