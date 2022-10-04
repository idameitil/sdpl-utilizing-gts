import os
import sys

ssn_timestamp = sys.argv[1]
supercluster_timestamp = sys.argv[2]
supercluster_threshold = float(sys.argv[3])

def write_metadata():
    with open(f"{outdir}/metadata.txt", "w") as outfile:
        outfile.write(f"Supercluster threshold: score {supercluster_threshold}\n")

# Make outdir
topdir = f"data/wzy/ssn-clusterings/{ssn_timestamp}/superclusterings"
if not os.path.isdir(topdir):
    os.makedirs(topdir)
outdir = f"{topdir}/{supercluster_timestamp}"
if not os.path.isdir(outdir):
    os.makedirs(outdir)

write_metadata()