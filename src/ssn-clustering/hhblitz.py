import os
import sys

timestamp = sys.argv[1]

clusters = [dir for dir in os.listdir(f"data/wzy/ssn-clusterings/{timestamp}/clusters") if not dir.startswith('.')]

for cluster in clusters:
    command = f"hhblits -cpu 4 -i data/wzy/ssn-clusterings/{timestamp}/clusters/{cluster}/sequences.afa \
        -d data/wzy/ssn-clusterings/{timestamp}/hhsearchdb -o data/wzy/ssn-clusterings/{timestamp}/clusters/{cluster}/{cluster}.hhr -n 1"
    os.system(command)