import sys
sys.path.append('src/ssn-clustering/')
from common import SSNClusterData

clustering_data_110 = SSNClusterData('2206101141', calculate_conserved=False)
clustering_data_150 = SSNClusterData('2206071430', calculate_conserved=False)
clustering_data_200 = SSNClusterData('2206071111', calculate_conserved=False)

print(f"Loading 2206101141")
clusters_110 = list(clustering_data_110.clusters)
print("Loading 2206071537")
clusters_150 = list(clustering_data_150.clusters)
print("Loading 2206071111")
clusters_200 = list(clustering_data_200.clusters)

clusters_list = [clusters_110, clusters_150, clusters_200]
clusterings_list = [clustering_data_110, clustering_data_150, clustering_data_200]

def get_child_clusters(index, cluster):
    child_clusters = set()
    for accession in cluster['accessions']:
        if accession in clusterings_list[index + 1].cluster_dict:
            child_cluster = clusterings_list[index + 1].cluster_dict[accession]
            child_clusters.add(child_cluster)
    return child_clusters

def get_cluster(index, name):
    return next((item for item in clusters_list[index] if item['name'] == name), None)

with open("data/wzy/ssn-clusterings/2206101141/comparative-report.md", 'w') as outfile:
    for cluster in clusters_list[0]:
        outfile.write(f"## Cluster {cluster['name']}\n\n")
        # Get subclusters
        subcluster_names = get_child_clusters(0, cluster)
        # Subclusters
        for subcluster_name in subcluster_names:
            subcluster = get_cluster(1, subcluster_name)
            if len(subcluster['sugars']) > 0:
                outfile.write(f"### Subcluster {subcluster_name}\n\n")
            # Get subsubclusters
            subsubcluster_names = get_child_clusters(1, subcluster)
            # Subsubclusters
            for subsubcluster_name in subsubcluster_names:
                subsubcluster = get_cluster(2, subsubcluster_name)
                if len(subsubcluster['sugars']) > 0:
                    outfile.write(f"#### Subsubcluster {subsubcluster_name}\n\n")
                    for sugar_id in subsubcluster['sugars']:
                        outfile.write(f"![]({subsubcluster['sugars'][sugar_id]['image']})\n\n")