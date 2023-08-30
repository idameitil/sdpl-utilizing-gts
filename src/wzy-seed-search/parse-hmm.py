from Bio import SearchIO
import pandas as pd

def not_pd_null(value):
    return not pd.isnull(value)

# Read seeds tsv
seeds_tsv_filename = "data/wzy/wzy.tsv"
seeds_df = pd.read_csv(seeds_tsv_filename, sep='\t')

def get_hits(hmmsearch_results_filename):
    with open(hmmsearch_results_filename) as infile:
        output = SearchIO.parse(infile, format='hmmer3-text')
        data = []
        for query in output:
            for hit in query.hits:
                data.append({'query_id': hit.query_id, 'hmm_name': hit.id, 'evalue': hit.evalue, 'score':hit.bitscore})
                break   # get only best hmm match
    return pd.DataFrame(data)

# filename = 'data/wzy/seed-cazy-search/seeds_newhmm-cleaned.txt'
filename = 'data/wzy/seed-cazy-search/seeds_hmm_cazy_search-cleaned.txt'
df = get_hits(filename)

df.sort_values(['hmm_name', 'evalue']).to_csv('out_best_sorted.tsv', sep='\t', index=False)

df_significant = df[df.evalue < 1e-30]
families = ['X605', 'X606', 'X607', 'X608', 'X609', 'X610', 'X611', 'X612', 'X613', 'X614', 'X617']
for family in families:
    output_filename = f"data/wzy/seed-cazy-search/seeds-in-families/{family}.acc"
    with open(output_filename, 'w') as outfile:
        species_serotype_done = []
        for index, row in df_significant.iterrows():
            if row['hmm_name'].startswith(family):
                seeds_df_row = seeds_df[seeds_df.protein_accession == row.query_id]
                species = seeds_df_row.species.values
                serotype = seeds_df_row.serotype.values
                species_serotype = species + serotype
                if species_serotype not in species_serotype_done:
                    species_serotype_done.append(species_serotype)
                    if not_pd_null(seeds_df_row.CSDB_Linear_corrected.values):
                        outfile.write(f"{row.query_id}\n")

df.to_csv('data/wzy/seed-cazy-search/best_hmm_hits-new.tsv', sep='\t', index=False)