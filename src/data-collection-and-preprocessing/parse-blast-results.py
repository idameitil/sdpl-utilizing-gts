import os
import pandas as pd
import sys

blast_run_path = "data/wzy/blast/run/"
directories = os.listdir(blast_run_path)

hit2evalue = dict() # All hits
alignment_hits = set() # The hits that are actually in Genbank
for accession in directories:
    blast_file = open(blast_run_path + accession + "/blast.out")
    two_lines_before_list_section = False
    list_section = False
    alignment_section = True
    for line in blast_file:
        # Two lines before list section
        if line.startswith('Sequences producing significant alignments:'):
            two_lines_before_list_section = True
        # One line before list section
        elif two_lines_before_list_section:
            if line.strip() == '':
                two_lines_before_list_section = False
                list_section = True
        # List section
        elif list_section:
            if line.strip() == '':
                list_section = False
                alignment_section = True
            else:
                splitted_line = line.split()
                hit_accession = splitted_line[0]
                e_value = float(splitted_line[-1])
                # Save hit
                if hit_accession not in hit2evalue:
                    hit2evalue[hit_accession] = e_value
                else:
                    # Save e-value if it's smaller than the current
                    if e_value < hit2evalue[hit_accession]:
                        hit2evalue[hit_accession] = e_value
        # Alignment section
        elif alignment_section:
            if line.startswith('>'):
                alignment_accession = line.split()[0][1:]
                alignment_hits.add(alignment_accession)

# Write file with unique hits and their best e-value
hit2evalue_series = pd.Series(hit2evalue)
condition = hit2evalue_series.index.isin(alignment_hits)
hit2evalue_series[condition].to_csv("data/wzy/blast/unique-hits.tsv", sep = '\t', header=False)