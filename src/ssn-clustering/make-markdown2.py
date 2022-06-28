
from common2 import SSNClusterData
import sys
import pandas as pd

timestamp = sys.argv[1]

# Get clustering data
clustering_data = SSNClusterData(timestamp)
clusters = list(clustering_data.clusters)

# Write report
resultsdir = f"data/wzy/ssn-clusterings/{timestamp}"
outfile = open(f"{resultsdir}/report2.md", "w")
outfile.write(f"# Report of ssn-clustering run {timestamp}\n")

## Metadata
outfile.write('## Metadata\n')
outfile.write(clustering_data.metadata + '\n')

## Info
outfile.write('## Info\n')
outfile.write(clustering_data.info + '\n')

## Cluster table
outfile.write(f"[File with accessions in each cluster]({clustering_data.cluster_table_url})\n\n")

## Taxons before/after 
outfile.write("Number of different taxons before and after expansion:\n\n")
outfile.write(f"{clustering_data.taxons_before_after_table.to_markdown()}\n\n")

## Navigation
outfile.write('## Navigation by cluster size\n')
for cluster in clusters:
    navigation_url = f"#cluster-{cluster['name']}"
    outfile.write(f"[{cluster['name']}({cluster['size']})]({navigation_url})  ")
outfile.write('\n\n')

outfile.write('## Navigation by cluster name\n')
for cluster in sorted(clusters, key=lambda x: int(x['name'])):
    navigation_url = f"#cluster-{cluster['name']}"
    outfile.write(f"[{cluster['name']}({cluster['size']})]({navigation_url})  ")
outfile.write('\n\n')

## Clusters
outfile.write('## Clusters\n')

for cluster in clusters:
    outfile.write(f"### Cluster {cluster['name']}\n")
    outfile.write(f"Total number of members in cluster: {cluster['size']}\n\n")
    outfile.write(f"#### Conserved resiudes: {cluster['conserved_residues']}\n")
    outfile.write('\n\n')
    outfile.write(f"#### Seeds in cluster:\n\n")
    outfile.write(cluster['seeds_table'].to_markdown(index=False)+'\n\n')
    outfile.write(f"[MSA fasta]({cluster['afa_url']})\n\n")
    outfile.write(f"[Malign view]({cluster['malign_url']})\n\n")
    outfile.write(f"[Fasta of members]({cluster['fasta_url']})\n\n")
    outfile.write(f"[Logoplot]({cluster['logo_url']})\n\n")
    outfile.write(f"[Phylogenetic tree]({cluster['tree_url']})\n\n")
    outfile.write(f"[Hits in cluster]({cluster['hits_table_url']})\n\n")
    outfile.write("#### Sugars in cluster:\n\n")
    for sugar in cluster['sugars']:
        outfile.write(f"![]({sugar})\n\n")
    outfile.write("#### Alphafold models:\n\n")
    for acc in cluster['alphafold_models']:
        outfile.write(f"[{acc}]({cluster['alphafold_models'][acc]})\n\n")
    outfile.write(f"#### Taxonomy:\n\n")
    outfile.write(cluster['taxonomy_table'].to_markdown(index=False) + '\n\n')
    outfile.write(f"[top](#navigation)\n")
    outfile.write('\n')

outfile.close()