import pandas as pd

def not_pd_null(value):
    return not pd.isnull(value)

input_filename = "data/wzy/phylogenetic-trees/small-tree-poster/selected-nodes-small-tree.txt"
with open(input_filename, 'r') as infile:
    selected_acc = set()
    for line in infile:
        selected_acc.add(line.strip().replace(' ', '_'))

seeds_filename = "data/wzy/wzy.tsv"
seeds_df = pd.read_csv(seeds_filename, sep='\t', dtype=object)

seeds_with_sugar = set(seeds_df[seeds_df.apply(lambda row: not_pd_null(row.CSDB_record_ID), axis=1)].protein_accession)

selected_acc_with_sugar = selected_acc.intersection(seeds_with_sugar)

output_filename = "data/wzy/phylogenetic-trees/small-tree-poster/selected-nodes-small-tree.fasta"
with open(output_filename, 'w') as outfile:
    for acc in selected_acc_with_sugar:
        seq = seeds_df.loc[seeds_df.protein_accession == acc]['seq'].values[0]
        outfile.write(f">{acc}\n{seq}\n")