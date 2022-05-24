import pandas as pd
import random

seed_df = pd.read_csv("data/wzy/wzy.tsv", sep='\t')

# Make taxonomy label files
wanted_ranks = ['phylum', 'class', 'order', 'family', 'genus', 'species']
for rank in wanted_ranks:
    outfilename = f"data/wzy/phylogenetic-trees/itol-label-files/{rank}.txt"
    with open(outfilename, "w") as file:
        header = f"DATASET_COLORSTRIP\nSEPARATOR COMMA\nDATASET_LABEL,{rank}\nCOLOR,#ff0000\nDATA\n"
        file.write(header)
        tax2color = dict()
        accession2tax = dict()
        for index, row in seed_df.iterrows():
            acc, tax = row['protein_accession'], row[rank]
            if tax not in tax2color:
                color = '#' + "%06x" % random.randint(0, 0xFFFFFF)
                tax2color[tax] = color
            file.write(f"{acc},{tax2color[tax]},{tax}\n")