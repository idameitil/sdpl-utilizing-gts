import pandas as pd

filename = "data/wzy/final-family-membership.csv"

df = pd.read_csv(filename)

df.best_family_hit = df.best_family_hit.apply(lambda x: x[:4])
df_mod = df.rename(columns={'best_family_hit': 'CAZy_family'})

# Read wzy.tsv
filename = "data/wzy/wzy.tsv"
df_wzy = pd.read_csv(filename, sep='\t')

# Merge
merged_df = pd.merge(left=df_mod, right=df_wzy, how='left', on='protein_accession')
print(merged_df)
final_df = merged_df[["protein_accession", "CAZy_family", "CAZy_ID", "axial_equatorial"]]

final_df.to_csv("data/wzy/final-family-membership-mod.csv", sep='\t', index=False)