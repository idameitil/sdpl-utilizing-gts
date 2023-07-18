import os

clustername_to_size = {}

cluster_dir = "data/wzy/ssn-clusterings/2210171613/clusters"

clusters = [dir for dir in os.listdir(cluster_dir) if not dir.startswith('.')]
for clustername in clusters:
    size, id = clustername.split('_')
    name_without_leading_zeros = f"{int(size)}_{id}"
    clustername_to_size[name_without_leading_zeros] = int(size)

nodes_filename = "data/wzy/ssn-clusterings/2210171613/nodes-superclustering-network"
with open(nodes_filename, 'w') as outfile:
    outfile.write("name\tsize\n")
    for name in clustername_to_size:
        outfile.write(f"{name}\t{clustername_to_size[name]}\n")
