import sys

ssn_timestamp = sys.argv[1]
superclustering_timestamp = sys.argv[2]

input_filename = f'data/wzy/ssn-clusterings/{ssn_timestamp}/superclusterings/{superclustering_timestamp}/hmm_edges'
output_filename = f'data/wzy/ssn-clusterings/{ssn_timestamp}/superclusterings/{superclustering_timestamp}/hmm_edges-nonself'

with open(input_filename) as infile:
    with open(output_filename, 'w') as outfile:
        for line in infile:
            if len(line.strip().split()) == 1:
                outfile.write(line)
            else:
                cluster1, cluster2, score = line.strip().split()
                if cluster1 != cluster2:
                    outfile.write(line)