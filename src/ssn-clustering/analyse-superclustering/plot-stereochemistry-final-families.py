import sys
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

df = pd.read_csv("data/wzy/final-family-membership-mod.csv", sep='\t')
families = sorted(pd.unique(df.CAZy_family.astype(str)).tolist())
families.remove('nan')
axial_counts = []
equatorial_counts = []
family2counts = {}
for family in families:
    axial_counts.append(len(df[(df.CAZy_family == family) & (df.axial_equatorial == 'axial')]))
    equatorial_counts.append(len(df[(df.CAZy_family == family) & (df.axial_equatorial == 'equatorial')]))
old2newnames = {'X617': 'GTxx4', 'X631': 'GTxx5', 'X634': 'GTxx6',
         'X613': 'GTxx7', 'X614': 'GTxx8', 'X609': 'GTxx9', 'X607': 'GTx10', 'X605': 'GTx11',
         'X610': 'GTx12', 'X612': 'GTx13', 'X606': 'GTx14', 'X611': 'GTx15', 'X608': 'GTx16', 'X633': 'GTx17'}
# for family in families:
#     new_name = old2newnames[family]
#     axial_counts = len(df[(df.CAZy_family == family) & (df.axial_equatorial == 'axial')])
#     equatorial_counts = len(df[(df.CAZy_family == family) & (df.axial_equatorial == 'equatorial')])
#     family2counts[new_name] = {'axial_counts': axial_counts, 'equatorial_counts': equatorial_counts}

order = ['GTxx4', 'GTxx5', 'GTxx6', 'GTxx6', 'GTxx7', 'GTxx8', 'GTxx9', \
         'GTx10', 'GTx11', 'GTx12', 'GTx13', 'GTx14', 'GTx15', 'GTx16', 'GTx17']

# equatorial_counts_ordered = []
# axial_counts_ordered = []
# for family in order:
#     equatorial_counts_ordered.append(family2counts[family]['equatorial_counts'])
#     axial_counts_ordered.append(family2counts[family]['axial_counts'])
# print(equatorial_counts_ordered)
families_new_names = [old2newnames[family] for family in families]

# Make plot
x = np.arange(len(families_new_names))
width = 0.4

fig, ax = plt.subplots(figsize=(9, 7))

ax.bar(families_new_names, axial_counts, width, label='Axial bonds')
ax.bar(families_new_names, equatorial_counts, width, bottom=axial_counts,
       label='Equatorial bonds')

plt.xticks(rotation = 90)

ax.set_ylabel('Count')
ax.set_xlabel('CAZy family')
ax.set_title('')
# ax.legend()

plt.savefig(f"data/wzy/stereochemistry-final.png", dpi=300)