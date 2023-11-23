import sys
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

df = pd.read_csv("data/wzy/wzy-with-CAZy-family.tsv", sep='\t')
families = sorted(pd.unique(df.CAZy_family.astype(str)).tolist())
families.remove('nan')

family2counts = {}
old2newnames = {'X617': 'GTxx4', 'X631': 'GTxx5', 'X634': 'GTxx6',
         'X613': 'GTxx7', 'X614': 'GTxx8', 'X609': 'GTxx9', 'X607': 'GTx10', 'X605': 'GTx11',
         'X610': 'GTx12', 'X612': 'GTx13', 'X606': 'GTx14', 'X611': 'GTx15', 'X608': 'GTx16', 'X633': 'GTx17'}
for family in families:
    # new_name = old2newnames[family]
    axial_counts = len(df[(df.CAZy_family == family) & (df.axial_equatorial == 'axial')])
    equatorial_counts = len(df[(df.CAZy_family == family) & (df.axial_equatorial == 'equatorial')])
    # family2counts[new_name] = {'axial_counts': axial_counts, 'equatorial_counts': equatorial_counts}
    family2counts[family] = {'axial_counts': axial_counts, 'equatorial_counts': equatorial_counts}
print(df[(df.CAZy_family == 'X614') & (df.axial_equatorial == 'axial')])
order = ['GTxx4', 'GTxx5', 'GTxx6', 'GTxx6', 'GTxx7', 'GTxx8', 'GTxx9', \
         'GTx10', 'GTx11', 'GTx12', 'GTx13', 'GTx14', 'GTx15', 'GTx16', 'GTx17']

# Save data
df = pd.DataFrame.from_dict(family2counts, orient='index')
df = df.reindex(order)
print(df)
df.to_csv('data/wzy/stereochemistry.tsv', sep='\t')

equatorial_counts_ordered = []
axial_counts_ordered = []
for family in order:
    equatorial_counts_ordered.append(family2counts[family]['equatorial_counts'])
    axial_counts_ordered.append(family2counts[family]['axial_counts'])

# Make plot
x = np.arange(len(order))
width = 0.4

fig, ax = plt.subplots(figsize=(9, 7))

ax.bar(order, axial_counts_ordered, width, label='Axial bonds')
ax.bar(order, equatorial_counts_ordered, width, bottom=axial_counts,
       label='Equatorial bonds')
print(axial_counts_ordered)
print(equatorial_counts_ordered)
plt.xticks(rotation = 90)

ax.set_ylabel('Count')
ax.set_xlabel('CAZy family')
ax.set_title('')
# ax.legend()

plt.savefig(f"data/wzy/stereochemistry-final-new.png", dpi=300)