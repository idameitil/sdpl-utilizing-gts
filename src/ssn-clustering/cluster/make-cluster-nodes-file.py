import sys

ssn_timestamp = sys.argv[1]
superclustering_timestamp = sys.argv[2]

clusters_tsv = f'data/wzy/ssn-clusterings/{ssn_timestamp}/clusters.tsv'
superclusters_tsv = f'data/wzy/ssn-clusterings/{ssn_timestamp}/superclusterings/{superclustering_timestamp}/clusters-in-superclusters.tsv'
output_filename = f'data/wzy/ssn-clusterings/{ssn_timestamp}/superclusterings/{superclustering_timestamp}/nodes-ssn'

family2supercluster_fullname = {'GTxx4': '1076_38_1', 'GTxx7': '0540_8_2', 'GTx13': '0277_8_3', \
                       'GTx11': '0260_4_4', 'GTxx6': '0081_4_7', 'GTxx8': '0155_4_6', \
                        'GTx16': '0134_4_5', 'GTxx5': '0092_3_10', 'GTx15': '0282_3_9', \
                            'GTx17': '0065_2_15', 'GTx14': '0144_2_13', 'GTxx9': '0118_1_30', \
                                'GTx12': '0128_1_29', 'GTx10': '0141_1_28'}
family2supercluster = {'GTxx4': '1', 'GTxx7': '2', 'GTx13': '3', 'GTx11': '4', 'GTxx6': '7',\
                        'GTxx8': '6', 'GTx16': '5', 'GTxx5': '10', 'GTx15': '9', 'GTx17': '15', \
                            'GTx14': '13', 'GTxx9': '30', 'GTx12': '29', 'GTx10': '28'}

supercluster2family = {v: k for k, v in family2supercluster.items()}

ssn2supercluster = {}
with open(superclusters_tsv, 'r') as superclusters_file:
    for line in superclusters_file:
        ssn_cluster_id = line.split()[0].split('_')[1]
        supercluster_id = line.split()[1]
        ssn2supercluster[ssn_cluster_id] = supercluster_id

with open(clusters_tsv) as clusters_file:
    with open(output_filename, 'w') as outfile:
        outfile.write(f"name\tCAZy_family\n")
        for line in clusters_file:
            acc = line.split()[0]
            ssn_cluster_id = line.split()[1]
            if ssn2supercluster[ssn_cluster_id] in supercluster2family:
                CAZy_family = supercluster2family[ssn2supercluster[ssn_cluster_id]]
            else:
                CAZy_family = 'NA'
            outfile.write(f"{acc}\t{CAZy_family}\n")