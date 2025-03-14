import pandas as pd
import random
from colour import Color
import math
import numpy as np
import os

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

def make_taxonomy_label_file_text(df, enzyme_family_name):
    outfilename = f"data/{enzyme_family_name}/phylogenetic-trees/itol-label-files/species_text.txt"
    with open(outfilename, "w") as file:
        header = f"DATASET_TEXT\nSEPARATOR COMMA\nDATASET_LABEL,species_text\nCOLOR,#ff0000\nDATA\n"
        file.write(header)
        tax2color = {
            'Acinetobacter baumannii': '#28E2E5',
            'Acinetobacter nosocomialis': '#28E2E5',
            'Streptococcus pneumoniae': '#61D04F',
            'Yersinia pseudotuberculosis': '#2297E6',
            'Yersinia similis': '#2297E6',
            'Escherichia coli': '#DF536B',
            'Shigella boydii': '#CD0BBC',
            'Shigella flexneri': '#CD0BBC',
            'Shigella dysenteriae': '#CD0BBC',
            'Pseudomonas aeruginosa': '#F5C710',
            'Salmonella enterica': '9E9E9E'
            }
        for index, row in df.iterrows():
            acc, tax = row['protein_accession'], row.species
            text = f"{tax} {row.serotype}"
            file.write(f"{acc},{text},-1,{tax2color[tax]},bold,1,0\n")

def make_alphafold_label_file():
    outfilename = f"data/wzy/phylogenetic-trees/itol-label-files/alphafold.txt"
    dirs = os.listdir('data/wzy/alphafold')
    with open(outfilename, 'w') as outfile:
        header = f"DATASET_COLORSTRIP\nSEPARATOR TAB\nDATASET_LABEL\talphafold\nCOLOR\t#ff0000\nDATA\n"
        outfile.write(header)    
        for dir in dirs:
            outfile.write(f"{dir}\t#28E2E5\t{dir}\n")

make_alphafold_label_file()

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

def make_pubmed_color_file(df, enzyme_family_name):
    outfilename = f"data/{enzyme_family_name}/phylogenetic-trees/itol-label-files/pubmed.txt"
    pubmed2color = {'23922982': '#21f505', '16532061': '#77d907', '28364730': '#07d97e', '25972421': '#070ad9',\
    '30709819': '#d98507', '25358682': '#eff702', '23874940': '#aa02f7'}
    pubmed2name = {'23922982': "Ree baumannii", '16532061': "Ree pneumoniae", '28364730': 'Ree pseudo',\
        '25972421': 'DTU coli', '30709819': 'Wu Shigella', '25358682': 'Islam aeruginosa', '23874940': 'Ree Salmonella'}
    red = '#f70202'
    with open(outfilename, "w") as file:
        header = f"DATASET_COLORSTRIP\nSEPARATOR COMMA\nDATASET_LABEL,pubmed\nCOLOR,#ff0000\nDATA\n"
        file.write(header)
        for index, row in df.iterrows():
            if row.pubmed in pubmed2color:
                file.write(f"{row.protein_accession},{pubmed2color[row.pubmed]},{row.pubmed} {pubmed2name[row.pubmed]}\n")
            else:
                file.write(f"{row.protein_accession},{red},{row.pubmed}\n")

wzy_seeds_df = pd.read_csv("data/wzy/wzy.tsv", sep='\t', dtype='object')
make_taxonomy_label_file_text(wzy_seeds_df, 'wzy')

wzy_df = pd.read_csv("data/wzy/seeds-and-hits.tsv", sep='\t', dtype='object')
waal_df = pd.read_csv("data/waal/seeds-and-hits.tsv", sep='\t', dtype='object')
eca_pol_df = pd.read_csv("data/eca-pol/seeds-and-hits.tsv", sep='\t', dtype='object')

print('wzy')
# make_taxonomy_label_file(wzy_df, 'wzy')
make_image_label_file(wzy_df, 'wzy')
# make_seeds_label_file(wzy_df, 'wzy')
# make_pubmed_color_file(wzy_df, 'wzy')

# print('waal')
# make_taxonomy_label_file(waal_df, 'waal')
# make_image_label_file(waal_df, 'waal')
# make_seeds_label_file(waal_df, 'waal')
# make_evalue_genbank_label_file('waal')

# print('eca-pol')
# make_taxonomy_label_file(eca_pol_df, 'eca-pol')
# make_seeds_label_file(eca_pol_df, 'eca-pol')


# make_hits_label_file(eca_pol_df, 'eca-pol')
# make_pct_label_file('eca-pol')
# make_evalue_genbank_label_file('eca-pol')
# make_score_genbank_label_file('eca-pol')
# PUT GENBANK SEARCH TSV
# eca_pol_genbank_search_df = pd.read_csv("data/eca-pol/genbank-search/hits-enriched.tsv", sep='\t', dtype='object')
# make_taxonomy_label_file(eca_pol_genbank_search_df, 'eca-pol', genbank_hits=True)

def make_family_membership_color_file(acc2family, acc2color):
    outfilename = f"data/wzy/phylogenetic-trees/itol-label-files/family_color.txt"
    with open(outfilename, "w") as file:
        header = f"DATASET_COLORSTRIP\nSEPARATOR COMMA\nDATASET_LABEL,family_colors\nCOLOR,#ff0000\nDATA\n"
        file.write(header)
        for acc in acc2family:
            family = acc2family[acc]
            file.write(f"{acc},{family2color[family]},{family}\n")

def make_family_membership_arrow_file(acc2family, acc2color, family2firstacc):
    outfilename = f"data/wzy/phylogenetic-trees/itol-label-files/family_arrow.txt"
    with open(outfilename, "w") as file:
        header = f"DATASET_CONNECTION\nSEPARATOR COMMA\nDATASET_LABEL,family_arrows\nCOLOR,#ff0ff0\nALIGN_TO_LABELS,1\nCENTER_CURVES,1\nCENTER_CURVES,1\nDATA\n"
        file.write(header)
        for acc in acc2family:
            family = acc2family[acc]
            if acc == family2firstacc[family]:
                pass
            else:
                file.write(f"{family2firstacc[family]},{acc},2,{family2color[family]},dashed,{family}\n")               

family2color = {'X608': '#FF0000', 'X611': '#00FF00', 'X606': '#0000FF', 'X605': '#00FFFF', \
                'X617': '#FFFF00', 'X612': '#FF00FF', 'X609': '#C0C0C0', 'X614': '#808000', \
                'X607': '#800000', 'X613': '#000000', 'X610': '#008000', 'X631': '#800080', \
                'X634': '#008080', 'X633': '#000080'}

# input_filename = f"data/wzy/seeds-cazyfamily.xlsx"
# df = pd.read_excel(input_filename)
# acc2family = {}
# family2firstacc = {}
# families_done = []
# for index, row in df.iterrows():
#     acc2family[row.protein_accession] = row.CAZy_family
#     family = row.CAZy_family
#     if row.CAZy_family.isnull():
#         continue
#     if family not in families_done:
#         family2firstacc[family] = row.protein_accession
# make_family_membership_color_file(acc2family, family2color)
# make_family_membership_arrow_file(acc2family, family2color, family2firstacc)

