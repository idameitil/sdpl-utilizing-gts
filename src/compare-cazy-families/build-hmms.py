import os
import sys

msa_dir = "data/hhblits_cazy_families/msas-family-names"
hmm_dir = "data/hhblits_cazy_families/hmms-family-names"

if not os.path.isdir(hmm_dir):
    os.makedirs(hmm_dir)

families = [msa_filename.replace('.fa', '') for msa_filename in os.listdir(msa_dir) if not msa_filename.startswith('.')]

for family in families:
    command = f"hmmbuild  -n {family} {hmm_dir}/{family}.hmm {msa_dir}/{family}.fa"
    os.system(command)