import sys, os
sys.path.append('src')
from modules.parse_hhblits import parse_hhblits_output
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

hhblits_outdir = 'data/hhblits_cazy_families/output'
hhr_filenames = os.listdir(hhblits_outdir)

# acc2name = {'AAL82786.1':'x612_O-Pol_ret', 'AHB32715.1':'x617_O-Pol_inv', 'cazy201071':'x571_RodA_inv', 'ABW40756.1':'x609_O-Pol_inv',\
#     'AAN64568.1':'x613_O-Pol_inv', 'AAA24524.1':'x615_O-Lig_inv', 'ACA24754.1':'x605_O-Pol_inv',\
#     'CAI34124.1':'x607_O-Pol_inv', 'AAM27615.1':'x614_O-Pol_inv', 'AAA97573.1':'x611_O-Pol_ret',\
#     'AAA92024.1':'x586_ECA-Pol_ret', 'AAM27546.1':'x608_O-Pol_ret', 'AAT77177.1':'x606_O-Pol_ret',\
#     'AAX07747.1':'x610_O-Pol_ret', 'cazy4457880|1-370|': 'rodA2'}

acc2name = {'ADC54950.1':'X612, O-Pol, ret', 'AHB32861.1':'X617, O-Pol, inv', 'cazy201071':'X571, RodA, inv', 'CAI34254.1':'X609, O-Pol, inv',\
    'CAI34369.1':'X613, O-Pol, inv', 'WP_011517284.1':'X615, O-Lig, inv', 'BAQ02088.1':'X605, O-Pol, inv',
    'CAI34124.1':'X607, O-Pol, inv', 'AAM27615.1':'X614, O-Pol, inv', 'AAA97573.1':'X611, O-Pol, ret',
    'AAA92024.1':'X586, ECA-Pol, ret', 'CAI32772.1':'X608, O-Pol, ret', 'AAT77177.1':'X606, O-Pol, ret',
    'AHB32411.1':'X610, O-Pol, ret', 'cazy4457880|1-370|': 'X571, RodA, inv',
    'BAQ00858.1': 'X631, O-Pol, inv', 'CAI32935.1': 'X632, O-Pol, inv', 'CAB63298.1': 'X633, O-Pol, ret',
    'BAQ00994.1': '0079_2_17, inv', 'ADV17650.1': '0081_4_4, inv',
    'WP_097449287.1': '0079_1_32, ret', 'AIG62684.1': '0078_2_19, ret', 'ADI43263.1': '0075_1_33, inv',
    'BAQ01238.1': '0073_3_9, inv', 'CAI32973.1': '0067_3_10, inv', 'WP_077201143.1': '0065_2_16, inv'}

#'ABZ06599.1':'X571_RodA_inv',
mydict = dict()
for filename in hhr_filenames:
    query_acc, hits = parse_hhblits_output(f"{hhblits_outdir}/{filename}")
    # convert to family names
    query_family_name = acc2name[query_acc]
    hits_family_names = {}
    for hit in hits:
        hit_family_name = acc2name[hit]
        hits_family_names[hit_family_name] = hits[hit]
    # Save
    mydict[query_family_name] = hits_family_names

df = pd.DataFrame.from_dict(mydict)
order = ['X617, O-Pol, inv', 'X631, O-Pol, inv', '0081_4_4, inv',
         'X571, RodA, inv',
         'X613, O-Pol, inv', 'X615, O-Lig, inv', 'X614, O-Pol, inv', 'X609, O-Pol, inv', 'X607, O-Pol, inv', 
         'X605, O-Pol, inv', 'X632, O-Pol, inv', '0079_2_17, inv', '0075_1_33, inv',
         '0073_3_9, inv', '0067_3_10, inv', '0065_2_16, inv',
         'X610, O-Pol, ret', 'X612, O-Pol, ret', 'X606, O-Pol, ret', 'X611, O-Pol, ret', 'X608, O-Pol, ret', 
         'X586, ECA-Pol, ret', 'X633, O-Pol, ret', '0079_1_32, ret', '0078_2_19, ret'
    ]
df = df.loc[reversed(order), reversed(order)]

df.to_csv("distance-matrix-hhblits.tsv", sep='\t')

fig, axis = plt.subplots()
heatmap = axis.pcolor(df, cmap=plt.cm.Blues)
plt.colorbar(heatmap)

plt.yticks(np.arange(0.5, len(df.index), 1), df.index)
plt.xticks(np.arange(0.5, len(df.columns), 1), df.columns, rotation=90)

plt.savefig('data/hhblits_cazy_families/heatmap_hhblits.png', bbox_inches='tight', dpi=600)
