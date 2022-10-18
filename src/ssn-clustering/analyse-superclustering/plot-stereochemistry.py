import sys
sys.path.append('src/ssn-clustering/')
from common import SSNClusterData
import numpy as np
import matplotlib.pyplot as plt

ssn_timestamp = sys.argv[1]
superclustering_timestamp = sys.argv[2]

# Get clustering data
clustering_data = SSNClusterData(ssn_timestamp, superclustering_timestamp, 
                                load_clusters=False, calculate_conserved=False, 
                                get_sugars=False,  get_sugars_superclusters=False,
                                calculate_conserved_superclusters=False)
superclusters = list(clustering_data.superclusters)

# Prepare plot data
labels = []
axial_counts = []
equatorial_counts = []
count = 0
for supercluster in superclusters:
    labels.append(supercluster['name'])
    axial_counts.append(supercluster['bond_counts']['axial_count'])
    equatorial_counts.append(supercluster['bond_counts']['equatorial_count'])
    count += 1
    if count == 30:
        break

# Make plot
x = np.arange(len(labels))
width = 0.4

fig, ax = plt.subplots(figsize=(10, 4))

ax.bar(labels, axial_counts, width, label='Axial bonds')
ax.bar(labels, equatorial_counts, width, bottom=axial_counts,
       label='Equatorial bonds')

ax.set_ylabel('Count')
ax.set_xlabel('Supercluster')
ax.set_title('')
ax.legend()

plt.savefig(f"data/wzy/ssn-clusterings/{ssn_timestamp}/superclusterings/{superclustering_timestamp}/stereochemistry.png")