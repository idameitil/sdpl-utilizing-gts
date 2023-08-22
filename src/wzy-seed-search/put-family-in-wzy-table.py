import pandas as pd
import json

# Read HMM hits
hmm_hits_filename = "data/wzy/seed-cazy-search/best_hmm_hits.tsv"
hits_df = pd.read_csv(hmm_hits_filename, sep='\t')

# Read wzy.tsv
wzy_table_filename = "data/wzy/wzy.tsv"
seed_table = pd.read_csv(wzy_table_filename, sep='\t')

# Merge
merged_df = seed_table.merge(right=hits_df, how='left', left_on='protein_accession', right_on='query_id')

# Get seeds in ssn clusters
superclusters_tsv_filename = "data/wzy/ssn-clusterings/2210171613/superclusterings/2210191051/superclusters.tsv"
superclusters_df = pd.read_csv(superclusters_tsv_filename, sep='\t', names=['acc', 'supercluster'])
supercluster2family = json.load(open("data/hhblits_cazy_families/supercluster2family.json"))
# superclusters_df = superclusters_df.replace({"supercluster": supercluster2family}).rename(columns={"supercluster": "membership_superclustering"})
superclusters_df["supercluster"] = superclusters_df["supercluster"].map(supercluster2family)
superclusters_df.rename(columns={"supercluster": "membership_superclustering"}, inplace=True)

# Merge supercluster members
merged_df2 = merged_df.merge(right=superclusters_df, how='left', left_on='protein_accession', right_on='acc')

# Select columns
columns = ['species_original', 'protein_accession', 'serotype', 'seq', 'pubmed', 'CSDB_Linear_corrected', 'hmm_name', 'evalue', 'membership_superclustering', 'axial_equatorial']
small_df = merged_df2[columns]
small_df_renamed = small_df.rename(columns={'hmm_name': 'best_family_hit'})

# Write to file
output_filename = "data/wzy/wzy_with_cazy_family.tsv"
small_df_renamed.to_csv(output_filename, sep='\t', index=False)

