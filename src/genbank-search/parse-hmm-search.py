from Bio import SearchIO
import pandas as pd
import sys

def get_hits(hmmsearch_results_filename):
    with open(hmmsearch_results_filename) as infile:
        output = SearchIO.parse(infile, format='hmmer3-text')
        for entry in output:
            data = []
            for hit in entry.hits:
                data.append({'acc': hit._id, 'evalue': hit.evalue, 'score':hit.bitscore})
    return pd.DataFrame(data)

enzyme_family = sys.argv[1]

if enzyme_family == 'waal':
    clade1_filename = "data/waal/genbank-search/clade1-genbank.out"
    clade2_filename = "data/waal/genbank-search/clade2-genbank.out"

    clade1_df = get_hits(clade1_filename)
    clade2_df = get_hits(clade2_filename)

    outer_merge = pd.merge(clade1_df, clade2_df, how='outer', on='acc', suffixes=['_clade1', '_clade2'])

    outer_merge.to_csv("data/waal/genbank-search/hits-evalue.tsv", sep='\t', index=False)

if enzyme_family == 'eca-pol':
    search_results_filename = "data/eca-pol/genbank-search/eca-pol-genbank-mafft.out"
    results_df = get_hits(search_results_filename)
    results_df.to_csv("data/eca-pol/genbank-search/hits-evalue.tsv", sep='\t', index=False)

if enzyme_family == 'wzy':
    superclusters = ["0118_1_30", "0128_1_29", "0134_4_6", "0141_1_28", "0144_2_14", "0260_4_5", "0284_3_9", "0342_13_2", "0540_8_3"]
    for supercluster in superclusters:
        search_results_filename = f"data/wzy/ssn-clusterings/2210171613/superclusterings/2210191051/superclusters/{supercluster}/{supercluster}.accs_pruned-mafft-genbank-search.out"
        results_df = get_hits(search_results_filename)
        results_df.to_csv(f"data/wzy/ssn-clusterings/2210171613/superclusterings/2210191051/superclusters/{supercluster}/hits-evalue.tsv", sep='\t', index=False)