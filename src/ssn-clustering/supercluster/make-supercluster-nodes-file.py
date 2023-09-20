import sys

ssn_timestamp = sys.argv[1]
superclustering_timestamp = sys.argv[2]

input_filename = f'data/wzy/ssn-clusterings/{ssn_timestamp}/superclusterings/{superclustering_timestamp}/clusters-in-superclusters.tsv'
output_filename = f'data/wzy/ssn-clusterings/{ssn_timestamp}/superclusterings/{superclustering_timestamp}/nodes'

family2supercluster_fullname = {'GTxx4': '1076_38_1', 'GTxx7': '0540_8_2', 'GTx13': '0277_8_3', \
                       'GTx11': '0260_4_4', 'GTxx6': '0081_4_7', 'GTxx8': '0155_4_6', \
                        'GTx16': '0134_4_5', 'GTxx5': '0092_3_10', 'GTx15': '0282_3_9', \
                            'GTx17': '0065_2_15', 'GTx14': '0144_2_13', 'GTxx9': '0118_1_30', \
                                'GTx12': '0128_1_29', 'GTx10': '0141_1_28'}
family2supercluster = {'GTxx4': '1', 'GTxx7': '2', 'GTx13': '3', 'GTx11': '4', 'GTxx6': '7',\
                        'GTxx8': '6', 'GTx16': '5', 'GTxx5': '10', 'GTx15': '9', 'GTx17': '15', \
                            'GTx14': '13', 'GTxx9': '30', 'GTx12': '29', 'GTx10': '28'}

supercluster2family = {v: k for k, v in family2supercluster.items()}

with open(input_filename) as infile:
    with open(output_filename, 'w') as outfile:
        outfile.write(f"name\tsize\tCAZy_family\n")
        for line in infile:
            ssn_cluster_name = line.split()[0]
            supercluster_id = line.split()[1]
            size, id = ssn_cluster_name.split('_')
            if supercluster_id in supercluster2family:
                CAZy_family = supercluster2family[supercluster_id]
            else:
                CAZy_family = 'NA'
            new_name = f"{int(size)}_{id}"
            outfile.write(f"{new_name}\t{int(size)}\t{CAZy_family}\n")