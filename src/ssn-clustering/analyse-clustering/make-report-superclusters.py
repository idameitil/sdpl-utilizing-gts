
from common import SSNClusterData
import sys

timestamp = sys.argv[1]

# Get clustering data
clustering_data = SSNClusterData(timestamp, load_clusters=False)
superclusters = list(clustering_data.superclusters)

# Write report
resultsdir = f"data/wzy/ssn-clusterings/{timestamp}"
with open(f"{resultsdir}/superclusters_report.md", "w") as outfile:
    outfile.write(f"# Report of superclusters of ssn-clustering run {timestamp}\n")
    # outfile.write(f"## Metadata\n{clustering_data.metadata}\n")
    # outfile.write(f"## Info\n{clustering_data.info}\n")
    # outfile.write(f"[File with accessions in each cluster]({clustering_data.cluster_table_url})\n\n")
    # outfile.write(f"Number of different taxons before and after expansion:\
    #     \n\n{clustering_data.taxons_before_after_table.to_markdown()}\n\n")

    outfile.write("## Navigation by cluster size\n")
    for supercluster in superclusters:
        if supercluster['size'] < 20:
            continue
        navigation_url = f"#cluster-{supercluster['name']}"
        outfile.write(f"[{supercluster['name']}({supercluster['size']})]({navigation_url})  ")
    outfile.write('\n\n')

    outfile.write('## Navigation by cluster name\n')
    for supercluster in sorted(superclusters, key=lambda x: int(x['name'])):
        if supercluster['size'] < 20:
            continue
        navigation_url = f"#supercluster-{supercluster['name']}"
        outfile.write(f"[{supercluster['name']}({supercluster['size']})]({navigation_url})  ")
    outfile.write('\n\n')

    outfile.write('## Superclusters\n\n')
    for supercluster in superclusters:
        if supercluster['size'] < 20:
            continue
        outfile.write(f"### Supercluster {supercluster['name']}\n\n")
        outfile.write(f"Total number of members in cluster: {supercluster['size']}\n\n")
        # outfile.write(f"Average length of proteins in cluster: {supercluster['average_length']}\n\n")
        outfile.write(f"#### Conserved (non-aliphatic) residues:\n\n{supercluster['conserved_residues_string']}\n\n")
        # outfile.write(f"#### Number of TMs:\n\n{supercluster['TM_count_string']}\n\n")
        # outfile.write(f"#### Seeds in supercluster:\n\n{supercluster['seeds_table'].to_markdown(index=False)}\n\n")
        # outfile.write(f"[MSA fasta]({supercluster['afa_url']})\n\n")
        # outfile.write(f"[Malign view]({supercluster['malign_url']})\n\n")
        # outfile.write(f"[Fasta of members]({supercluster['fasta_url']})\n\n")
        # outfile.write(f"[Logoplot]({supercluster['logo_url']})\n\n")
        # outfile.write(f"[Phylogenetic tree]({supercluster['tree_url']})\n\n")
        # outfile.write(f"[Hits in supercluster]({supercluster['hits_table_url']})\n\n")
        outfile.write("#### Sugars in supercluster:\n\n")
        sugars_seeds = [sugar_id for sugar_id in supercluster['sugars'] if not supercluster['sugars'][sugar_id]['is_only_blast']]
        for sugar_id in sugars_seeds:
            my_list = [f"{protein['accession']} ({protein['species']} {protein['serotype']})" for protein in supercluster['sugars'][sugar_id]['proteins']]
            outfile.write(f"{', '.join(my_list)}\n\n")
            outfile.write(f"![]({supercluster['sugars'][sugar_id]['image']})")
            outfile.write(f"{sugar_id}\n\n")
        if len(sugars_seeds) == 0:
            outfile.write("None\n\n")
        sugars_only_blast_hits = [sugar_id for sugar_id in supercluster['sugars'] if supercluster['sugars'][sugar_id]['is_only_blast']]
        outfile.write("#### Additional sugars from blast hits:\n\n")
        for sugar_id in sugars_only_blast_hits:
            my_list = [f"{protein['accession']} ({protein['species']} {protein['serotype']})" for protein in supercluster['sugars'][sugar_id]['proteins']]
            outfile.write(f"{', '.join(my_list)}\n\n")
            outfile.write(f"![]({supercluster['sugars'][sugar_id]['image']})")
            outfile.write(f"{sugar_id}\n\n")
        if len(sugars_only_blast_hits) == 0:
            outfile.write("None\n\n")
        # outfile.write("#### Alphafold models:\n\n")
        # for acc in supercluster['alphafold_models']:
        #     outfile.write(f"[{acc}]({supercluster['alphafold_models'][acc]['url']})\n\n")
        # if len(supercluster['alphafold_models']) == 0:
        #     outfile.write("None\n\n")
        outfile.write(f"#### Taxonomy:\n\n{supercluster['taxonomy_table'].to_markdown(index=False)}\n\n")
        outfile.write(f"[top](#report-of-ssn-clustering-run-{timestamp})\n\n")