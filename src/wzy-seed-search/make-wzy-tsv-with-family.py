import pandas as pd

wzy_df = pd.read_csv('data/wzy/wzy.tsv', sep='\t')
family_df = pd.read_excel('data/wzy/seeds-cazyfamily.xlsx')

merged_df = pd.merge(wzy_df, family_df, on='protein_accession', how='left')

output_filename = 'data/wzy/wzy-with-CAZy-family.tsv'
merged_df.to_csv(output_filename, sep='\t', index=False)