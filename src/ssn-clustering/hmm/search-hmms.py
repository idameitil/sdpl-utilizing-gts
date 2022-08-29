import os
import sys

timestamp = sys.argv[1]

clusters = [dir for dir in os.listdir(f"data/wzy/ssn-clusterings/{timestamp}/clusters") if not dir.startswith('.')]
clusters.sort()
clusters.reverse()

count = 0
for cluster in clusters:
    count += 1
    print(count, cluster)
    hmmsearch_dir = f"data/wzy/ssn-clusterings/{timestamp}/clusters/{cluster}/hmmsearch"
    if not os.path.isdir(hmmsearch_dir):
        os.makedirs(hmmsearch_dir)
    for cluster2 in clusters:
        if cluster2 == cluster:
            continue
        command = f"hmmsearch data/wzy/ssn-clusterings/{timestamp}/clusters/{cluster}/sequences.hmm data/wzy/ssn-clusterings/{timestamp}/clusters/{cluster2}/sequences.fa > data/wzy/ssn-clusterings/{timestamp}/clusters/{cluster}/hmmsearch/{cluster2}.out"
        os.system(command)