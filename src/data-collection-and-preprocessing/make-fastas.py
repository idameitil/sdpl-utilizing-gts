import pandas as pd
import sys

def write_fasta(infilename, outfilename):
    tsv_file_df = pd.read_csv(infilename, sep='\t')
    with open(outfilename, 'w') as outfile:
        accessions_done = []
        for index, row in tsv_file_df.iterrows():
            accession = row['protein_accession']
            # Check for duplicates
            if accession in accessions_done:
                print('Error: Duplicate accessions:')
                print(infilename)
                print(accession)
            sequence = row['seq']
            # Save to file
            outfile.write(f">{accession}\n{sequence}\n")
            accessions_done.append(accession)

if __name__ == '__main__':
    files = [('data/wzx/wzx.tsv', 'data/wzx/wzx.fasta'), ('data/wzy/wzy.tsv', 'data/wzy/wzy.fasta'), \
    ('data/wzz/wzz.tsv', 'data/wzz/wzz.fasta'), ('data/waal/waal.tsv', 'data/waal/waal.fasta'), \
        ('data/eca-pol/eca-pol.tsv', 'data/eca-pol/eca-pol.fasta')]
    for infilename, outfilename in files:
        write_fasta(infilename, outfilename)
