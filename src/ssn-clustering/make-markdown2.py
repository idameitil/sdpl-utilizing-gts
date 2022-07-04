
from common2 import SSNClusterData
import sys

timestamp = sys.argv[1]

# Get clustering data
clustering_data = SSNClusterData(timestamp)
clusters = list(clustering_data.clusters)

# Write report
resultsdir = f"data/wzy/ssn-clusterings/{timestamp}"
with open(f"{resultsdir}/report2.md", "w") as outfile:
    outfile.write(f"# Report of ssn-clustering run {timestamp}\n")
    outfile.write(f"## Metadata\n{clustering_data.metadata}\n")
    outfile.write(f"## Info\n{clustering_data.info}\n")
    outfile.write(f"[File with accessions in each cluster]({clustering_data.cluster_table_url})\n\n")
    outfile.write(f"Number of different taxons before and after expansion:\
        \n\n{clustering_data.taxons_before_after_table.to_markdown()}\n\n")

    outfile.write("## Navigation by cluster size\n")
    for cluster in clusters:
        navigation_url = f"#cluster-{cluster['name']}"
        outfile.write(f"[{cluster['name']}({cluster['size']})]({navigation_url})  ")
    outfile.write('\n\n')

    outfile.write('## Navigation by cluster name\n')
    for cluster in sorted(clusters, key=lambda x: int(x['name'])):
        navigation_url = f"#cluster-{cluster['name']}"
        outfile.write(f"[{cluster['name']}({cluster['size']})]({navigation_url})  ")
    outfile.write('\n\n')

    outfile.write('## Clusters\n\n')
    for cluster in clusters:
        outfile.write(f"### Cluster {cluster['name']}\n\n")
        outfile.write(f"Total number of members in cluster: {cluster['size']}\n\n")
        outfile.write(f"#### Conserved (non-aliphatic) residues:\n\n{cluster['conserved_residues']}\n\n")
        outfile.write(f"#### Seeds in cluster:\n\n{cluster['seeds_table'].to_markdown(index=False)}\n\n")
        outfile.write(f"[MSA fasta]({cluster['afa_url']})\n\n")
        outfile.write(f"[Malign view]({cluster['malign_url']})\n\n")
        outfile.write(f"[Fasta of members]({cluster['fasta_url']})\n\n")
        outfile.write(f"[Logoplot]({cluster['logo_url']})\n\n")
        outfile.write(f"[Phylogenetic tree]({cluster['tree_url']})\n\n")
        outfile.write(f"[Hits in cluster]({cluster['hits_table_url']})\n\n")
        outfile.write("#### Sugars in cluster:\n\n")
        sugars_seeds = [sugar_id for sugar_id in cluster['sugars'] if not cluster['sugars'][sugar_id]['is_only_blast']]
        for sugar_id in sugars_seeds:
            my_list = [f"{protein['accession']} ({protein['species']} {protein['serotype']})" for protein in cluster['sugars'][sugar_id]['proteins']]
            outfile.write(f"{', '.join(my_list)}\n\n")
            outfile.write(f"![]({cluster['sugars'][sugar_id]['image']})")
            outfile.write(f"{sugar_id}\n\n")
        outfile.write("#### Sugars for blast hits only (may be incorrect):\n\n")
        sugars_only_blast_hits = [sugar_id for sugar_id in cluster['sugars'] if cluster['sugars'][sugar_id]['is_only_blast']]
        for sugar_id in sugars_only_blast_hits:
            my_list = [f"{protein['accession']} ({protein['species']} {protein['serotype']})" for protein in cluster['sugars'][sugar_id]['proteins']]
            outfile.write(f"{', '.join(my_list)}\n\n")
            outfile.write(f"![]({cluster['sugars'][sugar_id]['image']})")
            outfile.write(f"{sugar_id}\n\n")
        outfile.write("#### Alphafold models:\n\n")
        for acc in cluster['alphafold_models']:
            outfile.write(f"[{acc}]({cluster['alphafold_models'][acc]})\n\n")
        outfile.write(f"#### Taxonomy:\n\n{cluster['taxonomy_table'].to_markdown(index=False)}\n\n")
        outfile.write(f"[top](#report-of-ssn-clustering-run-{timestamp})\n\n")