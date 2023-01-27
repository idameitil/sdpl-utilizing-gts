import sys
sys.path.append("src/data-collection-and-preprocessing")
from common import get_taxon
import pandas as pd

def enrich_hits(protein_family):

    # Read unique-hits.csv
    hits_df = pd.read_csv(f"data/{protein_family}/genbank-search/hits.csv", sep=' ,', dtype=object, \
        engine='python', names = ['protein_accession', 'org', 'taxid', 'name', 'seq'])

    # Add taxonomy
    print('getting taxonomy')

    desired_ranks = ['phylum', 'class', 'order', 'family', 'genus', 'species']
    for rank in desired_ranks:
        hits_df[rank] = hits_df.taxid.apply(lambda x: get_taxon(x, rank))

    # Write to file
    hits_df.to_csv(f"data/{protein_family}/genbank-search/hits-enriched.tsv", sep = '\t', index=False) 

protein_family = sys.argv[1]
enrich_hits(protein_family)