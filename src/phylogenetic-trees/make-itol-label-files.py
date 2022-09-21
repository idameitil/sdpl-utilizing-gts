import pandas as pd
import random

def make_taxonomy_label_file(df, enzyme_family_name):
    wanted_ranks = ['phylum', 'class', 'order', 'family', 'genus', 'species']
    for rank in wanted_ranks:
        outfilename = f"data/{enzyme_family_name}/phylogenetic-trees/itol-label-files/{rank}.txt"
        with open(outfilename, "w") as file:
            header = f"DATASET_COLORSTRIP\nSEPARATOR COMMA\nDATASET_LABEL,{rank}\nCOLOR,#ff0000\nDATA\n"
            file.write(header)
            tax2color = dict()
            for index, row in df.iterrows():
                acc, tax = row['protein_accession'], row[rank]
                if tax not in tax2color:
                    color = '#' + "%06x" % random.randint(0, 0xFFFFFF)
                    tax2color[tax] = color
                file.write(f"{acc},{tax2color[tax]},{tax}\n")

def make_image_label_file(df, enzyme_family_name):
    outfilename = f"data/{enzyme_family_name}/phylogenetic-trees/itol-label-files/sugar-images.txt"
    with open(outfilename, "w") as file:
        header = "DATASET_IMAGE\nSEPARATOR TAB\nDATASET_LABEL\timage\nCOLOR,#ff0000\nMARGIN\t0\nSHOW_INTERNAL\t"\
                    "t0\nIMAGE_ROTATION\t0\nIMAGE_SHIFT_V\t0\nIMAGE_SHIFT_H\t0\nSIZE_FACTOR	1\nDATA\n"
        file.write(header)
        for index, row in df.iterrows():
            file.write(f"{row.protein_accession}\t-1\t1\t0\t0\t0\t{row.csdb_image_path}\n")

wzy_df = pd.read_csv("data/wzy/seeds-and-hits.tsv", sep='\t', dtype='object')
waal_df = pd.read_csv("data/waal/seeds-and-hits.tsv", sep='\t', dtype='object')
eca_pol_df = pd.read_csv("data/eca-pol/seeds-and-hits.tsv", sep='\t', dtype='object')

print('wzy')
make_taxonomy_label_file(wzy_df, 'wzy')
make_image_label_file(wzy_df, 'wzy')

print('waal')
make_taxonomy_label_file(waal_df, 'waal')
make_image_label_file(waal_df, 'waal')

print('eca-pol')
make_taxonomy_label_file(eca_pol_df, 'eca-pol')
