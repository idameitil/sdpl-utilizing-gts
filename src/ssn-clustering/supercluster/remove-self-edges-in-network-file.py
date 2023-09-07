input_filename = 'data/wzy/ssn-clusterings/2309061613/superclusterings/2309061658/hmm_edges'
output_filename = 'data/wzy/ssn-clusterings/2309061613/superclusterings/2309061658/hmm_edges-nonself'

with open(input_filename) as infile:
    with open(output_filename, 'w') as outfile:
        for line in infile:
            if line.startswith('#'):
                outfile.write(line)
            else:
                cluster1, cluster2, score = line.strip().split()
                if cluster1 != cluster2:
                    outfile.write(line)