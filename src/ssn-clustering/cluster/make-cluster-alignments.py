import sys
import os
import multiprocessing as mp

ssn_timestamp = sys.argv[1]
clusterdir = f"data/wzy/ssn-clusterings/{ssn_timestamp}/clusters"

def run_mafft(cluster):
    input_filename = f"{clusterdir}/{cluster}/sequences.fa"
    output_filename = f"{clusterdir}/{cluster}/sequences.afa"
    print('Start:', cluster)
    command = f"mafft --maxiterate 1000 --localpair --leavegappyregion {input_filename} > {output_filename} 2>/dev/null"
    os.system(command)
    print('End:', cluster)

if __name__ == '__main__':
    pool = mp.Pool(2)
    clusters = [f for f in os.listdir(clusterdir) if not f.startswith('.')]
    pool.map(run_mafft, [cluster for cluster in sorted(clusters, reverse=True)], chunksize=1)
    pool.close()