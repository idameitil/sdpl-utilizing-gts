import sys

ssn_timestamp = sys.argv[1]
superclustering_timestamp = sys.argv[2]

input_filename = f'data/wzy/ssn-clusterings/{ssn_timestamp}/superclusterings/{superclustering_timestamp}/clusters-in-superclusters.tsv'
output_filename = f'data/wzy/ssn-clusterings/{ssn_timestamp}/superclusterings/{superclustering_timestamp}/nodes'

with open(input_filename) as infile:
    with open(output_filename, 'w') as outfile:
        outfile.write(f"name\tsize\n")
        for line in infile:
            superclustername = line.split()[0]
            print(superclustername)
            size, id = superclustername.split('_')
            new_name = f"{int(size)}_{id}"
            outfile.write(f"{new_name}\t{int(size)}\n")