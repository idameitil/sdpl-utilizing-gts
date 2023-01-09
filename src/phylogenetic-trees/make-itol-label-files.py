import pandas as pd
import random
from colour import Color
import math

def make_taxonomy_label_file(df, enzyme_family_name, genbank_hits = False):
    wanted_ranks = ['phylum', 'class', 'order', 'family', 'genus', 'species']
    for rank in wanted_ranks:
        if genbank_hits:
            outfilename = f"data/{enzyme_family_name}/phylogenetic-trees/itol-label-files/genbank_hits_{rank}.txt"
        else:
            outfilename = f"data/{enzyme_family_name}/phylogenetic-trees/itol-label-files/{rank}.txt"
        with open(outfilename, "w") as file:
            header = f"DATASET_COLORSTRIP\nSEPARATOR TAB\nDATASET_LABEL\t{rank}\nCOLOR\t#ff0000\nDATA\n"
            file.write(header)
            tax2color = dict()
            for index, row in df.iterrows():
                acc, tax = row['protein_accession'], row[rank]
                if tax not in tax2color:
                    color = '#' + "%06x" % random.randint(0, 0xFFFFFF)
                    tax2color[tax] = color
                file.write(f"{acc}\t{tax2color[tax]}\t{tax}\n")

def make_image_label_file(df, enzyme_family_name):
    outfilename = f"data/{enzyme_family_name}/phylogenetic-trees/itol-label-files/sugar-images.txt"
    with open(outfilename, "w") as file:
        header = "DATASET_IMAGE\nSEPARATOR TAB\nDATASET_LABEL\timage\nCOLOR,#ff0000\nMARGIN\t0\nSHOW_INTERNAL\t"\
                    "t0\nIMAGE_ROTATION\t0\nIMAGE_SHIFT_V\t0\nIMAGE_SHIFT_H\t0\nSIZE_FACTOR	1\nDATA\n"
        file.write(header)
        for index, row in df.iterrows():
            file.write(f"{row.protein_accession}\t-1\t1\t0\t0\t0\t{row.csdb_image_path}\n")

def make_seeds_label_file(df, enzyme_family_name):
    outfilename = f"data/{enzyme_family_name}/phylogenetic-trees/itol-label-files/seeds.txt"
    with open(outfilename, "w") as file:
        header = f"DATASET_COLORSTRIP\nSEPARATOR TAB\nDATASET_LABEL\tseed\nCOLOR\t#ff0000\nDATA\n"
        file.write(header)
        for index, row in df.iterrows():
            if row.seed == '1':
                file.write(f"{row.protein_accession}\t#000000\t\n")

def make_hits_label_file(df, enzyme_family_name):
    """Delete this one, just for seeing which hits were new after incorporating more seeds"""
    outfilename = f"data/{enzyme_family_name}/phylogenetic-trees/itol-label-files/hits.txt"
    with open("acc_before", 'r') as infile:
        accs = []
        for line in infile:
            accs.append(line.strip())
    with open(outfilename, "w") as file:
        header = f"DATASET_COLORSTRIP\nSEPARATOR TAB\nDATASET_LABEL\tseed\nCOLOR\t#ff0000\nDATA\n"
        file.write(header)
        for acc in accs:
            file.write(f"{acc}\t#000000\t\n")

def make_pct_label_file(enzyme_family_name):
    outfilename = f"data/{enzyme_family_name}/phylogenetic-trees/itol-label-files/blast-pctid.txt"
    n = 101
    colors = list(Color("white").range_to(Color("black"),n))
    df = pd.read_csv("data/eca-pol/blast/unique-hits.tsv", sep='\t', names=['acc', 'pct', 'evalue'])
    with open(outfilename, 'w') as outfile:
        header = f"DATASET_COLORSTRIP\nSEPARATOR TAB\nDATASET_LABEL\tpct\nCOLOR\t#ff0000\nDATA\n"
        outfile.write(header)
        for index, row in df.iterrows():
            pct, acc = row.pct, row.acc
            color=colors[math.floor(pct)].hex
            outfile.write(f"{acc}\t{color}\t{pct}\n")

def make_evalue_genbank_label_file(enzyme_family_name):
    outfilename = f"data/{enzyme_family_name}/phylogenetic-trees/itol-label-files/genbank-search-evalue.txt"
    df = pd.read_csv("data/eca-pol/genbank-search/hits-evalue.tsv", sep='\t')
    max = math.log10(df.evalue.dropna().values.max())
    min = math.log10(df.evalue.dropna().values.min())
    n = int(max - min)
    colors = list(Color("black").range_to(Color("white"),n))
    with open(outfilename, 'w') as outfile:
        header = f"DATASET_COLORSTRIP\nSEPARATOR TAB\nDATASET_LABEL\tgenbank-search-evalue\nCOLOR\t#ff0000\nDATA\n"
        outfile.write(header)
        for index, row in df.iterrows():
            evalue, acc = row.evalue, row.acc
            color=colors[int(math.log10(evalue))].hex
            outfile.write(f"{acc}\t{color}\t{evalue}\n")

def make_score_genbank_label_file(enzyme_family_name):
    outfilename = f"data/{enzyme_family_name}/phylogenetic-trees/itol-label-files/genbank-search-score.txt"
    df = pd.read_csv("data/eca-pol/genbank-search/hits-evalue.tsv", sep='\t')
    max = df.score.dropna().values.max()
    n = int(max) + 1
    colors = list(Color("white").range_to(Color("black"),n))
    with open(outfilename, 'w') as outfile:
        header = f"DATASET_COLORSTRIP\nSEPARATOR TAB\nDATASET_LABEL\tgenbank-search-score\nCOLOR\t#ff0000\nDATA\n"
        outfile.write(header)
        for index, row in df.iterrows():
            score, acc = row.score, row.acc
            color=colors[math.floor(score)].hex
            outfile.write(f"{acc}\t{color}\t{score}\n")

wzy_df = pd.read_csv("data/wzy/seeds-and-hits.tsv", sep='\t', dtype='object')
waal_df = pd.read_csv("data/waal/seeds-and-hits.tsv", sep='\t', dtype='object')
eca_pol_df = pd.read_csv("data/eca-pol/seeds-and-hits.tsv", sep='\t', dtype='object')

# print('wzy')
# make_taxonomy_label_file(wzy_df, 'wzy')
# make_image_label_file(wzy_df, 'wzy')
# make_seeds_label_file(wzy_df, 'wzy')

# print('waal')
# make_taxonomy_label_file(waal_df, 'waal')
# make_image_label_file(waal_df, 'waal')
# make_seeds_label_file(waal_df, 'waal')
# make_evalue_genbank_label_file('waal')

print('eca-pol')
make_taxonomy_label_file(eca_pol_df, 'eca-pol')
make_seeds_label_file(eca_pol_df, 'eca-pol')
make_hits_label_file(eca_pol_df, 'eca-pol')
make_pct_label_file('eca-pol')
make_evalue_genbank_label_file('eca-pol')
make_score_genbank_label_file('eca-pol')
# PUT GENBANK SEARCH TSV
# eca_pol_genbank_search_df = pd.read_csv("data/eca-pol/genbank-search/hits-enriched.tsv", sep='\t', dtype='object')
# make_taxonomy_label_file(eca_pol_genbank_search_df, 'eca-pol', genbank_hits=True)
