import pandas as pd

df1 = pd.read_excel('seeds-and-families.xlsx')
df2 = pd.read_csv('data/wzy/seed-cazy-search/best_hmm_hits-new.tsv', sep='\t')

merged_df = pd.merge(df1, df2, how='left', left_on='protein_accession', right_on='query_id')

merged_df.to_excel('merged.xlsx', index=False)