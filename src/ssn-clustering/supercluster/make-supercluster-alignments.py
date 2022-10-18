import sys
import os
import multiprocessing as mp

ssn_timestamp = sys.argv[1]
supercluster_timestamp = sys.argv[2]
superclusterdir = f"data/wzy/ssn-clusterings/{ssn_timestamp}/superclusterings/{supercluster_timestamp}/superclusters"

def run_mafft(supercluster):
    input_filename = f"{superclusterdir}/{supercluster}/sequences.fa"
    output_filename = f"{superclusterdir}/{supercluster}/sequences.afa"
    print('Start:', supercluster)
    command = f"mafft --maxiterate 1000 --localpair --leavegappyregion {input_filename} > {output_filename} 2>/dev/null"
    os.system(command)
    print('End:', supercluster)

if __name__ == '__main__':
    pool = mp.Pool(2)
    superclusters = [f for f in os.listdir(superclusterdir) if not f.startswith('.')]
    pool.map(run_mafft, [supercluster for supercluster in sorted(superclusters, reverse=True)], chunksize=1)
    pool.close()