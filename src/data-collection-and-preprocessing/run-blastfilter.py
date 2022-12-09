import sys
import os

enzyme_family = sys.argv[1]

blast_path = f"data/{enzyme_family}/blast/run"

accessions = [folder for folder in os.listdir(blast_path) if not folder.startswith('.')]

for accession in accessions:
    blast_output_filename = f"{blast_path}/{accession}/blast.out"
    json_filename = f"{blast_path}/{accession}/blast.js"
    command = f"blastfilter -js {blast_output_filename} > {blast_path}/{accession}/blast.js"
    s = os.system(command)
    if s != 0:
        print("Error in blastfilter")
        sys.exit()