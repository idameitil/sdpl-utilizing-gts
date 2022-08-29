from Bio import SearchIO
import pandas as pd

def get_hits(hmmsearch_results_filename):
    with open(hmmsearch_results_filename) as infile:
        output = SearchIO.parse(infile, format='hmmer3-text')
        for entry in output:
            data = []
            for hit in entry.hits:
                data.append({'acc': hit._id, 'evalue': hit.evalue})
    return pd.DataFrame(data)

clade1_filename = "data/waal/genbank-search/clade1-genbank.out"
clade2_filename = "data/waal/genbank-search/clade2-genbank.out"

clade1_df = get_hits(clade1_filename)
clade2_df = get_hits(clade2_filename)

a_1 = clade1_df[(clade1_df.evalue > 1e-15) & (clade1_df.evalue < 1e-5)]

outer_merge = pd.merge(clade1_df, clade2_df, how='outer', on='acc', suffixes=['_clade1', '_clade2'])

a = outer_merge[((outer_merge.evalue_clade1 > 1e-15) & (outer_merge.evalue_clade1 < 1e-5) & (outer_merge.evalue_clade2 > 1e-15)) |
    ((outer_merge.evalue_clade2 > 1e-15) & (outer_merge.evalue_clade2 < 1e-5) & (outer_merge.evalue_clade1 > 1e-15))]

outer_merge.to_csv("data/waal/genbank-search/hits-evalue.tsv", sep='\t', index=False)