import os
import sys

timestamp = sys.argv[1]
clusters = [dir for dir in os.listdir(f"data/wzy/ssn-clusterings/{timestamp}/clusters") if not dir.startswith('.')]

for cluster in clusters:
    command = f"hmmbuild  -n {cluster} data/wzy/ssn-clusterings/{timestamp}/clusters/{cluster}/{cluster}.hmm data/wzy/ssn-clusterings/{timestamp}/clusters/{cluster}/sequences.afa"
    os.system(command)