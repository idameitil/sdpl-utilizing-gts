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
    'CAI34124.1':'X607', 'AAM27615.1':'X614', 'AAA97573.1':'X611',
    'AAA92024.1':'ECA-Pol, X586', 'CAI32772.1':'X608', 'AAT77177.1':'X606',
    'AHB32411.1':'X610', 'cazy4457880|1-370|': 'SEDS, X571',
    'BAQ01641.1': 'X631', 'ABG81806.1': 'X633',
    'ADI43271.1': 'X634'
}

old2newnames = {'SEDS, X571': 'SEDS, GTxx1',
         'X617': 'GTxx4', 'X631': 'GTxx5', 'X634': 'GTxx6',
         'X613': 'GTxx7', 'O-Lig, X615': 'O-Lig, GTxx3', 'X614': 'GTxx8', 'X609': 'GTxx9', 'X607': 'GTx10', 'X605': 'GTx11',
         'X610': 'GTx12', 'X612': 'GTx13', 'X606': 'GTx14', 'X611': 'GTx15', 'X608': 'GTx16', 'ECA-Pol, X586': 'ECA-Pol, GTxx2', 'X633': 'GTx17'}

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
print(mydict)
df = pd.DataFrame.from_dict(mydict)

# Set diagonal to max
max_score = df.max().max()
for index, row in df.iterrows():
    row[index] = 200

# order = ['SEDS, X571',
#          'X617', 'X631', 'X634',
#          'X613', 'O-Lig, X615', 'X614', 'X609', 'X607', 'X605',
#          'X610', 'X612', 'X606', 'X611', 'X608', 'ECA-Pol, X586', 'X633'
#     ]

order = ['SEDS, GTxx1',
         'GTxx4', 'GTxx5', 'GTxx6',
         'GTxx7', 'O-Lig, GTxx3', 'GTxx8', 'GTxx9', 'GTx10', 'GTx11',
         'GTx12', 'GTx13', 'GTx14', 'GTx15', 'GTx16', 'ECA-Pol, GTxx2', 'GTx17']

print(df)
df = df.loc[reversed(order), reversed(order)]

df.to_csv("data/hhblits_cazy_families/distance-matrix-hhblits.tsv", sep='\t')

fig, axis = plt.subplots()
heatmap = axis.pcolor(df, cmap=plt.cm.Blues)
plt.colorbar(heatmap)

plt.yticks(np.arange(0.5, len(df.index), 1), df.index)
plt.xticks(np.arange(0.5, len(df.columns), 1), df.columns, rotation=90)

plt.savefig('data/hhblits_cazy_families/heatmap_hhblits.png', bbox_inches='tight', dpi=600)
