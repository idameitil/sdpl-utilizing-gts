import sys, os
sys.path.append('src')
from modules.parse_hhblits import parse_hhblits_output
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

hhblits_outdir = 'data/hhblits_cazy_families/output'
hhr_filenames = os.listdir(hhblits_outdir)

acc2name = {'AAL82786.1':'x612_O-Pol_ret', 'AHB32715.1':'x617_O-Pol_inv', 'cazy201071':'x571_RodA', 'ABW40756.1':'x609_O-Pol_inv',\
    'AAN64568.1':'x613_O-Pol_inv', 'AAA24524.1':'x615_O-Lig_inv', 'ACA24754.1':'x605_O-Pol_inv',\
    'CAI34124.1':'x607_O-Pol_inv', 'AAM27615.1':'x614_O-Pol_inv', 'AAA97573.1':'x611_O-Pol_ret',\
    'AAA92024.1':'x586_ECA-Pol_ret', 'AAM27546.1':'x608_O-Pol_ret', 'AAT77177.1':'x606_O-Pol_ret',\
    'AAX07747.1':'x610_O-Pol_ret'}

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

order = ['x615_O-Lig_inv', 'x617_O-Pol_inv', 'x609_O-Pol_inv', 'x613_O-Pol_inv', 'x605_O-Pol_inv', 'x607_O-Pol_inv', 'x614_O-Pol_inv',\
    'x612_O-Pol_ret', 'x611_O-Pol_ret', 'x608_O-Pol_ret', 'x606_O-Pol_ret', 'x610_O-Pol_ret', 'x586_ECA-Pol_ret']
df = df.loc[order, order]

fig, axis = plt.subplots()
heatmap = axis.pcolor(df, cmap=plt.cm.Blues)
plt.colorbar(heatmap)

plt.yticks(np.arange(0.5, len(df.index), 1), df.index)
plt.xticks(np.arange(0.5, len(df.columns), 1), df.columns, rotation=90)

plt.savefig('data/hhblits_cazy_families/heatmap_hhblits.png', bbox_inches='tight', dpi=600)
