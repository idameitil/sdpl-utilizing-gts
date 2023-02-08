import os
import sys

msa_dir = "data/hhblits_cazy_families/msa"

msa_filenames = [dir for dir in os.listdir(msa_dir) if not dir.startswith('.')]

for msa_filename in msa_filenames:
    command = f"hhblits -cpu 4 -i data/hhblits_cazy_families/msa/{msa_filename} \
        -d data/hhblits_cazy_families/hhblits_cazy_families -o data/hhblits_cazy_families/output/{msa_filename}.hhr -n 1"
    os.system(command)