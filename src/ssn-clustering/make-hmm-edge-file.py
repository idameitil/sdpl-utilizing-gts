import os
import sys
from common import SSNClusterData

def parse_hhr(hhr_filename, query_cluster_name, threshold):
    hits = {}
    with open(hhr_filename, 'r') as infile:
        flag = False
        for line in infile:
            if flag:
                if line.strip() == '':
                    flag = False
                    continue
                splitted_line = line.strip().split()
                no = splitted_line[0]
                evalue = float(splitted_line[3])
                score = float(splitted_line[5])
                hit_accession = splitted_line[1]
                if no == '1':
                    continue
                hit_cluster_name = clustering_data.cluster_dict[hit_accession]
                if evalue < threshold:
                    hits[(query_cluster_name, hit_cluster_name)] = evalue
            elif line.startswith(' No Hit'):
                flag = True
    return hits

timestamp = sys.argv[1]

# Get clustering data
clustering_data = SSNClusterData(timestamp)
clusters = list(clustering_data.clusters)

threshold = 1e-15

hits_all = {}
cluster_id = {}
for cluster in clusters:
    cluster_id[cluster['name']] = f"{str(cluster['size'])}_{cluster['name']}"
    hits = parse_hhr(cluster['hhr_filename'], cluster['name'], threshold)
    for (query_cluster_name, hit_cluster_name) in hits:
        if (query_cluster_name, hit_cluster_name) in hits_all:
            hits_all[(query_cluster_name, hit_cluster_name)] = hits[(query_cluster_name, hit_cluster_name)]
        else:
            hits_all[(query_cluster_name, hit_cluster_name)] = hits[(query_cluster_name, hit_cluster_name)]

outfilename = f"data/wzy/ssn-clusterings/{timestamp}/hmm_edges_evalue{threshold}"
with open(outfilename, 'w') as outfile:
    outfile.write("# cluster1\t\cluster2\tevalue\n")
    for (cluster1, cluster2) in hits_all:
        evalue = hits_all[(cluster1, cluster2)]
        outfile.write(f"{cluster_id[cluster1]}\t{cluster_id[cluster2]}\t{evalue}\n")
