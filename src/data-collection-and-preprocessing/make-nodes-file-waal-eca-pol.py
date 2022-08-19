import pandas as pd
import sys
pd.options.mode.chained_assignment = None

def read_seeds(protein_family):

    seed_df = pd.read_csv(f"data/{protein_family}/{protein_family}.tsv", sep='\t', dtype=object)
    seed_df.drop('serotype', axis=1, inplace=True)
    seed_df = seed_df.rename(columns = {'genbank_taxon':'taxid', 'annotated':'seed', 'serotype_edited':'serotype'})
    columns_include = ['protein_accession', 'taxid', 'kingdom', 'phylum', 'class', \
        'order', 'family', 'genus', 'species', 'seq', 'serotype', 'pubmed', 'CSDB_record_ID', 'csdb_image_path']
    seed_df_small = seed_df[columns_include]
    seed_df_small['seed'] = '1'

    return seed_df_small

def read_hits(protein_family, seed_df):
    hits_df = pd.read_csv(f"data/{protein_family}/blast/unique-hits-enriched.tsv", sep='\t', dtype=object)
    columns_include = ['protein_accession', 'taxid', 'kingdom', 'phylum', 'class', \
        'order', 'family', 'genus', 'species', 'seq']
    hits_df_small = hits_df[columns_include]
    # Remove seeds from hits df
    hits_df_small = hits_df_small[~hits_df_small.protein_accession.isin(seed_df.protein_accession)]
    # Add empty columns for data that we have for the seeds
    empty_columns = ['pubmed', 'serotype', 'CSDB_record_ID', 'csdb_image_path']
    for column_name in empty_columns:
        hits_df_small[column_name] = ''
    # Add boolean seed column
    hits_df_small['seed'] = '0'
    return hits_df_small

def make_nodes_file(protein_family):
    seeds_df = read_seeds(protein_family)
    hits_df = read_hits(protein_family, seeds_df)
    combined_df = pd.concat([seeds_df, hits_df])
    output_filename = f"data/{protein_family}/seeds-and-hits.tsv"
    combined_df.to_csv(output_filename, index=False, sep='\t')

protein_family = sys.argv[1]
make_nodes_file(protein_family)