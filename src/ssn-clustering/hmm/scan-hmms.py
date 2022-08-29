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
    command = f"hmmscan data/wzy/ssn-clusterings/{timestamp}/hmmdb data/wzy/ssn-clusterings/{timestamp}/clusters/{cluster}/sequences.fa > data/wzy/ssn-clusterings/{timestamp}/clusters/{cluster}/hmmscan.out"
    os.system(command)