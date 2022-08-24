import os
import sys
import shutil

timestamp = sys.argv[1]

clusters = [dir for dir in os.listdir(f"data/wzy/ssn-clusterings/{timestamp}/clusters") if not dir.startswith('.')]

db_path = f"data/wzy/ssn-clusterings/{timestamp}/msa"
if not os.path.isdir(db_path):
    os.makedirs(db_path)

for cluster in clusters:

    src = f"data/wzy/ssn-clusterings/{timestamp}/clusters/{cluster}/sequences.afa"
    dest = f"{db_path}/{cluster}.afa"
    shutil.copyfile(src, dest)
