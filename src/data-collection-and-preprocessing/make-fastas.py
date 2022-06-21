import pandas as pd

files = [('data/wzx/wzx.tsv', 'data/wzx/wzx.fasta'), ('data/wzy/wzy.tsv', 'data/wzy/wzy.fasta'), \
    ('data/wzz/wzz.tsv', 'data/wzz/wzz.fasta'), ('data/waal/waal.tsv', 'data/waal/waal.fasta')]

for infilename, outfilename in files:
    tsv_file_df = pd.read_csv(infilename, sep='\t')
    outfile = open(outfilename, 'w')
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
    outfile.close()