import sys, os
sys.path.append('src')
from modules.parse_hhblits import parse_hhblits_output
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

hhblits_outdir = 'data/hhblits_cazy_families/output'
hhr_filenames = os.listdir(hhblits_outdir)

acc2name = {'ADC54950.1':'X612', 'AHB32861.1':'X617', 'cazy201071':'SEDS, X571', 'CAI34254.1':'X609',\
    'CAI34369.1':'X613', 'WP_011517284.1':'O-Lig, X615', 'BAQ02088.1':'X605',
    'CAI34124.1':'X607', 'AAM27615.1':'X614', 'AAM27801.1':'X611',
    'AAA92024.1':'ECA-Pol, X586', 'CAI32772.1':'X608', 'AAT77177.1':'X606',
    'AHB32411.1':'X610', 'cazy4457880|1-370|': 'SEDS, X571',
    'BAQ01641.1': 'X631', 'ABG81806.1': 'X633',
    'ADI43271.1': 'X634'
}

old2newnames = {'SEDS, X571': 'SEDS, GT119',
         'X617': 'BP-Pol, GT122', 'X631': 'BP-Pol, GT123', 'X634': 'BP-Pol, GT124',
         'X613': 'BP-Pol, GT125', 'O-Lig, X615': 'O-Lig, GT121', 'X614': 'BP-Pol, GT126', 'X609': 'BP-Pol, GT127', 'X607': 'BP-Pol, GT128', 'X605': 'BP-Pol, GT129',
         'X610': 'BP-Pol, GT130', 'X612': 'BP-Pol, GT131', 'X606': 'BP-Pol, GT132', 'X611': 'BP-Pol, GT133', 'X608': 'BP-Pol, GT134', 'ECA-Pol, X586': 'ECA-Pol, GT120', 'X633': 'BP-Pol, GT135'}

mydict = dict()
for filename in hhr_filenames:
    query_acc, hits = parse_hhblits_output(f"{hhblits_outdir}/{filename}")
    # convert to family names
    query_family_name = acc2name[query_acc]
    new_query_family_name = old2newnames[query_family_name]
    hits_family_names = {}
    for hit in hits:
        hit_family_name = acc2name[hit]
        new_hit_family_name = old2newnames[hit_family_name]
        hits_family_names[new_hit_family_name] = hits[hit]
    # Save
    mydict[new_query_family_name] = hits_family_names

df = pd.DataFrame.from_dict(mydict)

# Set diagonal to max
max_score = df.max().max()
for index, row in df.iterrows():
    row[index] = 200
    pass

order = ['SEDS, GTxx1', 'BP-Pol, GTxx7', 'O-Lig, GTxx3', 'BP-Pol, GTxx8', 'BP-Pol, GTxx9', 'BP-Pol, GTx10', 'BP-Pol, GTx11',
         'BP-Pol, GTx12', 'BP-Pol, GTx13', 'BP-Pol, GTx14', 'BP-Pol, GTx15', 'BP-Pol, GTx16', 'ECA-Pol, GTxx2', 'BP-Pol, GTx17',
         'BP-Pol, GTxx4', 'BP-Pol, GTxx5', 'BP-Pol, GTxx6'
         ]

order = ['SEDS, GT119', 'BP-Pol, GT125', 'O-Lig, GT121', 'BP-Pol, GT126', 'BP-Pol, GT127', 'BP-Pol, GT128', 'BP-Pol, GT129',
         'BP-Pol, GT130', 'BP-Pol, GT131', 'BP-Pol, GT132', 'BP-Pol, GT133', 'BP-Pol, GT134', 'ECA-Pol, GT120', 'BP-Pol, GT135',
         'BP-Pol, GT122', 'BP-Pol, GT123', 'BP-Pol, GT124']
         
df = df.transpose()
df = df.loc[reversed(order), reversed(order)]

df.to_csv("data/hhblits_cazy_families/distance-matrix-hhblits.tsv", sep='\t')

fig, axis = plt.subplots()
heatmap = axis.pcolor(df, cmap=plt.cm.Blues)
plt.colorbar(heatmap)

plt.yticks(np.arange(0.5, len(df.index), 1), df.index)
plt.xticks(np.arange(0.5, len(df.columns), 1), df.columns, rotation=90)

plt.savefig('data/hhblits_cazy_families/heatmap_hhblits.png', bbox_inches='tight', dpi=600)
