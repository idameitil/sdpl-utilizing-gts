import sys
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

df = pd.read_csv("data/wzy/wzy-with-CAZy-family.tsv", sep='\t')
families = sorted(pd.unique(df.CAZy_family.astype(str)).tolist())
families.remove('nan')

family2counts = {}
old2newnames = {'GTxx4': 'GT122', 'GTxx5': 'GT123', 'GTxx6': 'GT124',
         'GTxx7': 'GT125', 'GTxx8': 'GT126', 'GTxx9': 'GT127', 'GTx10': 'GT128', 'GTx11': 'GT129',
         'GTx12': 'GT130', 'GTx13': 'GT131', 'GTx14': 'GT132', 'GTx15': 'GT133', 'GTx16': 'GT134', 'GTx17': 'GT135'}
for family in families:
    new_name = old2newnames[family]
    axial_counts = len(df[(df.CAZy_family == family) & (df.axial_equatorial == 'axial')])
    equatorial_counts = len(df[(df.CAZy_family == family) & (df.axial_equatorial == 'equatorial')])
    family2counts[new_name] = {'axial_counts': axial_counts, 'equatorial_counts': equatorial_counts}
    # family2counts[family] = {'axial_counts': axial_counts, 'equatorial_counts': equatorial_counts}
order = ['GT122', 'GT123', 'GT124', 'GT125', 'GT126', 'GT127', \
         'GT128', 'GT129', 'GT130', 'GT131', 'GT132', 'GT133', 'GT134', 'GT135']

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