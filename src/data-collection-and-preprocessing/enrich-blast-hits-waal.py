import pandas as pd
import sys
from common import get_taxon, get_desired_sugars_df
import numpy as np

github_url = 'https://raw.githubusercontent.com/idameitil/waal_polymerases/main/csdb/snfg/3'

# Read unique-hits.csv
unique_hits_df = pd.read_csv("data/waal/blast/unique-hits.csv", sep=' ,', dtype=object, \
    engine='python', names = ['protein_accession', 'org', 'taxid', 'name', 'seq'])

# Take only the ones from unique-hits.tsv (as unique-hits.csv contains identical sequences)
non_identical_df = pd.read_csv("data/waal/blast/unique-hits.tsv", sep='\t', dtype=object, names=['acc', 'evalue'])
unique_hits_df = unique_hits_df[unique_hits_df.protein_accession.isin(non_identical_df.acc)]

# Add taxonomy
print('getting taxonomy')

desired_ranks = ['kingdom', 'phylum', 'class', 'order', 'family', 'genus', 'species']
# desired_ranks = ['species']
for rank in desired_ranks:
    unique_hits_df[rank] = unique_hits_df.taxid.apply(lambda x: get_taxon(x, rank))

# Write to file
unique_hits_df.to_csv("data/waal/blast/unique-hits-enriched.tsv", sep = '\t', index=False) 