import os
import multiprocessing as mp

run_dir = f"data/wzy/all-vs-all-blast/run"

def parse_blast_file(blast_filename):
    """Parses a blast file and appends protein pairs to network list"""
    
    print(f"Parsing {chunk}")
    done = []
    header_hit_list = False
    hit_list_section = False
    results = []
    with open(blast_filename, 'r') as infile:
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
                        results.append({'query_accession': query_accession, 'target_accession': target_accession, 'score': score, 'e_value': e_value})
    return results

if __name__ == '__main__':

    chunks = [f for f in os.listdir(run_dir) if not f.startswith('.')]

    outfilename = f"data/wzy/all-vs-all-blast/network2"
    with open(outfilename, 'w') as outfile:
        outfile.write("source\ttarget\tscore\tevalue\n")
        count = 0
        for chunk in chunks:
            count += 1
            print(count)
            blast_filename = f"{run_dir}/{chunk}/blast.out"
            results = parse_blast_file(blast_filename)
            for line in results:
                outfile.write(f"{line['query_accession']}\t{line['target_accession']}\t{line['score']}\t{line['e_value']}\n")