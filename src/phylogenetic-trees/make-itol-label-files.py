import pandas as pd
import random

wzy_seed_df = pd.read_csv("data/wzy/wzy.tsv", sep='\t')
waal_seed_df = pd.read_csv("data/waal/waal.tsv", sep='\t')

def make_taxonomy_label_file(seed_df, enzyme_family_name):
    wanted_ranks = ['phylum', 'class', 'order', 'family', 'genus', 'species']
    for rank in wanted_ranks:
        outfilename = f"data/{enzyme_family_name}/phylogenetic-trees/itol-label-files/{rank}.txt"
        with open(outfilename, "w") as file:
            header = f"DATASET_COLORSTRIP\nSEPARATOR COMMA\nDATASET_LABEL,{rank}\nCOLOR,#ff0000\nDATA\n"
            file.write(header)
            tax2color = dict()
            for index, row in seed_df.iterrows():
                acc, tax = row['protein_accession'], row[rank]
                if tax not in tax2color:
                    color = '#' + "%06x" % random.randint(0, 0xFFFFFF)
                    tax2color[tax] = color
                file.write(f"{acc},{tax2color[tax]},{tax}\n")

def make_polysaccharide_type_label_file(seed_df, enzyme_family_name):
    outfilename = f"data/{enzyme_family_name}/phylogenetic-trees/itol-label-files/polysaccharide-type.txt"
    with open(outfilename, "w") as file:
        header = f"DATASET_COLORSTRIP\nSEPARATOR COMMA\nDATASET_LABEL,Polysaccharide type\nCOLOR\t#ff0000\nDATA\n"
        file.write(header)
        for index, row in seed_df.iterrows():
            colors = {'ECA Wzy':'green', 'CPS Wzy':'red', 'O-antigen Wzy':'blue'}
            if row.WzyE == 1:
                type = 'ECA Wzy'
            elif row.CPS == 1:
                type = 'CPS Wzy'
            else:
                type = 'O-antigen Wzy'
            file.write(f"{row['protein_accession']},{colors[type]},{type}\n")

def make_image_label_file(seed_df, enzyme_family_name):
    outfilename = f"data/{enzyme_family_name}/phylogenetic-trees/itol-label-files/sugar-images.txt"
    with open(outfilename, "w") as file:
        header = "DATASET_IMAGE\nSEPARATOR TAB\nDATASET_LABEL\timage\nCOLOR,#ff0000\nMARGIN\t0\nSHOW_INTERNAL\t"\
                    "t0\nIMAGE_ROTATION\t0\nIMAGE_SHIFT_V\t0\nIMAGE_SHIFT_H\t0\nSIZE_FACTOR	1\nDATA\n"
        file.write(header)
        for index, row in seed_df.iterrows():
            file.write(f"{row.protein_accession}\t-1\t1\t0\t0\t0\t{row.csdb_image_path}\n")

make_taxonomy_label_file(wzy_seed_df, 'wzy')
make_taxonomy_label_file(waal_seed_df, 'waal')
make_image_label_file(wzy_seed_df, 'wzy')
make_image_label_file(wzy_seed_df, 'wzy')
make_image_label_file(waal_seed_df, 'waal')