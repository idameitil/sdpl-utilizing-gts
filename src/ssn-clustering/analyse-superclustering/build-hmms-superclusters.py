import os
import sys

ssn_timestamp = sys.argv[1]
superclustering_timestamp = sys.argv[2]

cluster_dir = f"data/wzy/ssn-clusterings/{ssn_timestamp}/superclusterings/{superclustering_timestamp}/superclusters"

clusters = [dir for dir in os.listdir(cluster_dir) if not dir.startswith('.')]

for cluster in clusters:
    command = f"hmmbuild  -n {cluster} {cluster_dir}/{cluster}/{cluster}.hmm {cluster_dir}/{cluster}/sequences.afa"
    os.system(command)