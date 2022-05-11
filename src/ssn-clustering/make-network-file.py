import os
import sys

timestamp = sys.argv[1]

def parse_blast_file(blast_file, outfile):
    """Parses a blast file and appends protein pairs to network list"""

    done = []
    header_hit_list = False
    hit_list_section = False
    infile = open(blast_file)
    for line in infile:
        # Query accession line
        if line.startswith("Query="):
            query_accession = line.strip().split(' ')[1]
            done.append(query_accession)
        # Two lines before hit list section
        elif line.startswith('Sequences producing significant alignments:'):
            header_hit_list = True
        # One line before hit list section
        elif header_hit_list:
            if line.strip() == '':
                header_hit_list = False
                hit_list_section = True
        # Hit list section
        elif hit_list_section:
            # End of hit list section
            if line.strip() == '':
                hit_list_section = False
            # Hits
            else:
                splitted_line = line.split()
                target_accession = splitted_line[0].split(' ')[0]
                score = splitted_line[-2]
                e_value = splitted_line[-1]
                if target_accession not in done:
                    outfile.write(f"{query_accession}\t{target_accession}\t{score}\t{e_value}\n")
    infile.close()

# Prepare outfile
outfilename = f"data/wzy/ssn-clusterings/all-vs-all-blast/{timestamp}/network"
outfile = open(outfilename, "w")
outfile.write("source\ttarget\tscore\tevalue\n")

# Parse blast files and write to outfile
run_dir = f"data/wzy/ssn-clusterings/all-vs-all-blast/{timestamp}/run"
chunks = [f for f in os.listdir(run_dir) if not f.startswith('.')]
count = 0
for chunk in chunks:
    count += 1
    print(f'Parsing blast output for chunk {count} out of {len(chunks)}')
    blast_file = f"{run_dir}/{chunk}/blast.out"
    parse_blast_file(blast_file, outfile)
outfile.close()