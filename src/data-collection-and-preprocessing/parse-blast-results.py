import os
import pandas as pd
import sys

def parse_blast_file(blast_file_path):
    """ Parses a blast text output file. 
    Returns dict of accessions and their evalues for the hits that are in Genbank.
    """
    blast_file = open(blast_file_path)
    
    acc2evalue_all = dict() # All hits
    alignment_hit_accessions = set() # The hits that are actually in Genbank

    two_lines_before_list_section = False
    list_section = False
    alignment_section = False

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
            # End of list section
            if line.strip() == '':
                list_section = False
                alignment_section = True
            # Save hit
            else:
                splitted_line = line.split()
                hit_accession = splitted_line[0]
                e_value = float(splitted_line[-1])
                acc2evalue_all[hit_accession] = e_value
        # Alignment section
        elif alignment_section:
            if line.startswith('>'):
                alignment_accession = line.split()[0][1:]
                alignment_hit_accessions.add(alignment_accession)
    # Get hit2evalue dict for the hits that are in Genbank
    acc2evalue_genbank = {key:value for (key, value) in acc2evalue_all.items() if key in alignment_hit_accessions}

    return acc2evalue_genbank

protein_family = sys.argv[1]

blast_run_path = f"data/{protein_family}/blast/run/"
db_file = f"data/{protein_family}/{protein_family}.tsv"

db_df = pd.read_csv(db_file, sep='\t')
accessions_to_include = list(db_df.protein_accession)

acc2evalue_best = dict()
for accession in accessions_to_include:
    blast_file_path = blast_run_path + accession + "/blast.out"
    acc2evalue = parse_blast_file(blast_file_path)
    # Add to acc2evalue_best
    for acc in acc2evalue:
        if acc not in acc2evalue_best:
            acc2evalue_best[acc] = acc2evalue[acc]
        else:
            if acc2evalue[acc] < acc2evalue_best[acc]:
                acc2evalue_best[acc] = acc2evalue[acc]

# Write file with unique hits and their best e-value
output_filename = f"data/{protein_family}/blast/unique-hits.tsv"
pd.Series(acc2evalue_best).to_csv(output_filename, sep = '\t', header=False)