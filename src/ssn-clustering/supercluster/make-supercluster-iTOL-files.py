import sys
import random

ssn_timestamp = sys.argv[1]
superclusters_timestamp = sys.argv[2]

results_dir = f"data/wzy/ssn-clusterings/{ssn_timestamp}/superclusterings/{superclusters_timestamp}"

def make_cluster_color_file(acc2cluster, cluster2color):
    outfilename = f"{results_dir}/supercluster_iTOL_color.txt"
    with open(outfilename, "w") as file:
        header = f"DATASET_COLORSTRIP\nSEPARATOR COMMA\nDATASET_LABEL,supercluster_colors\nCOLOR,#ff0000\nDATA\n"
        file.write(header)
        for acc in acc2cluster:
            cluster = acc2cluster[acc]
            file.write(f"{acc},{cluster2color[cluster]},{cluster}\n")

def make_arrow_file(acc2cluster, cluster2color, cluster2firstacc):
    outfilename = f"{results_dir}/supercluster_iTOL_arrow.txt"
    with open(outfilename, "w") as file:
        header = f"DATASET_CONNECTION\nSEPARATOR COMMA\nDATASET_LABEL,supercluster_arrows\nCOLOR,#ff0ff0\nALIGN_TO_LABELS,1\nCENTER_CURVES,1\nCENTER_CURVES,1\nDATA\n"
        file.write(header)
        for acc in acc2cluster:
            cluster = acc2cluster[acc]
            if acc == cluster2firstacc[cluster]:
                pass
            else:
                file.write(f"{cluster2firstacc[cluster]},{acc},2,{cluster2color[cluster]},dashed,{cluster}\n")               

input_filename = f"{results_dir}/superclusters.tsv"
acc2cluster = {}
cluster2color = {}
cluster2firstacc = {}
with open(input_filename) as infile:
    for line in infile:
        acc, cluster = line.split()
        acc2cluster[acc] = cluster
        cluster = acc2cluster[acc]
        if cluster not in cluster2color:
            color = '#' + "%06x" % random.randint(0, 0xFFFFFF)
            cluster2color[cluster] = color
            cluster2firstacc[cluster] = acc

make_cluster_color_file(acc2cluster, cluster2color)
make_arrow_file(acc2cluster, cluster2color, cluster2firstacc)
