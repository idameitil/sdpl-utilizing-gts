
import sys
import pandas as pd
sys.path.append("src/ssn-clustering")
from common import read_MSA_file, get_conserved_residues, get_specific_positions_conserved_residues

accessions_filename = "data/garry-figure/family-representatives.tsv"

df = pd.read_csv(accessions_filename, sep='\t', names=['family', 'accession'])

threshold = 0.95

outfilename = "data/garry-figure/conserved.out"
with open(outfilename, 'w') as outfile:
    for index, row in df.iterrows():
        outfile.write(row.family + '\n')
        outfile.write(row.accession + '\n')
        alignment_filename = f"data/hhblits_cazy_families/msas-family-names/{row.family}.fa"
        fasta_dict = read_MSA_file(alignment_filename)
        conserved_residues = get_conserved_residues(fasta_dict, threshold=threshold)
        positions = get_specific_positions_conserved_residues(row.accession, conserved_residues, fasta_dict)
        outfile.write(str(positions))
        outfile.write('\n')