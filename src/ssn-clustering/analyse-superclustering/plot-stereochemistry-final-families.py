import sys
sys.path.append('src/ssn-clustering/')
from common import SSNClusterData
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

df = pd.read_csv("data/wzy/final-family-membership-mod.csv", sep='\t')
families = sorted(pd.unique(df.CAZy_family).tolist())

axial_counts = []
equatorial_counts = []
for family in families:
    axial_counts.append(len(df[(df.CAZy_family == family) & (df.axial_equatorial == 'axial')]))
    equatorial_counts.append(len(df[(df.CAZy_family == family) & (df.axial_equatorial == 'equatorial')]))

# Make plot
x = np.arange(len(families))
width = 0.4

fig, ax = plt.subplots(figsize=(7, 4))

ax.bar(families, axial_counts, width, label='Axial bonds')
ax.bar(families, equatorial_counts, width, bottom=axial_counts,
       label='Equatorial bonds')

ax.set_ylabel('Count')
ax.set_xlabel('CAZy family')
ax.set_title('')
ax.legend()

plt.savefig(f"data/wzy/stereochemistry-final.png", dpi=300)