from Bio import SeqIO
import sys
import pandas as pd
import re

def get_serotype(seq_record):
    serotype = 'NA'
    # Loop over the features
    for feature in seq_record.features:
        # look in source feature
        if feature.type == "source":
            if feature.qualifiers.get("serotype", []) != []:
                serotype = feature.qualifiers.get("serotype", [])[0]
            elif feature.qualifiers.get("serovar", []) != []:
                serotype = feature.qualifiers.get("serovar", [])[0]
            elif feature.qualifiers.get("serogroup", []) != []:
                serotype = feature.qualifiers.get("serogroup", [])[0]
            elif feature.qualifiers.get("note", []) != []:
                if feature.qualifiers.get("note", [])[0].startswith('type:'):
                    serotype = feature.qualifiers.get("note", [])[0].replace('type: ', '')
                elif feature.qualifiers.get("note", [])[0].startswith('serogroup'):
                    serotype = feature.qualifiers.get("note", [])[0].replace('serogroup: ', '').replace('serogroup:', '')
            source_feature = feature
    if len(serotype) > 20:
        serotype = 'NA'
    return serotype, source_feature

seed_df = pd.read_csv("data/wzy/wzy.tsv", sep = '\t', dtype=object)

path = "data/wzy/blast-full-genbank/1e-15"

files = ['hitsaa.gp', 'hitsab.gp', 'hitsac.gp', 'hitsad.gp', 'hitsae.gp', 'hitsaf.gp', 'hitsag.gp']
outfile = open("data/wzy/blast-full-genbank/1e-15/hits-serotypes.tsv", 'w')

outfile.write("protein_accession\tserotype\n")

not_include = ['non typeable', 'not available']

for file in files:
    for gb_record in SeqIO.parse(open(f"{path}/{file}", "r"), "genbank"):
        accession = gb_record.id
        serotype, source_feature = get_serotype(gb_record)
        if re.match('^(O\d+):', serotype) is not None:
            serotype = re.match('^(O\d+):', serotype).group(1)
        if accession not in list(seed_df.protein_accession) and serotype != 'NA' and serotype not in not_include:
            outfile.write(f"{accession}\t{serotype}\n")
outfile.close()

