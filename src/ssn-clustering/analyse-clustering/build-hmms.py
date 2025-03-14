import os
import sys

timestamp = sys.argv[1]

cluster_dir = f"data/wzy/ssn-clusterings/{timestamp}/clusters"

clusters = [dir for dir in os.listdir(cluster_dir) if not dir.startswith('.')]

for cluster in clusters:
    command = f"hmmbuild  -n {cluster} {cluster_dir}/{cluster}/{cluster}.hmm {cluster_dir}/{cluster}/sequences.afa"
    os.system(command)