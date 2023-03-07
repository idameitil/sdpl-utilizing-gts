import sys, os, json
import pandas as pd

json_filename = "data/wada/blast.js"

hits = {}

with open(json_filename, 'r') as infile:
    blast_hits = []
    for line in infile:
        if line.startswith('#'):
            continue
        blast_hit = json.loads(line.strip())
        acc = blast_hit['name2']
        evalue = blast_hit['evalue']
        hits[acc] = evalue

df = pd.DataFrame(hits.items())
output_filename = f"data/wada/hits.tsv"

df.to_csv(output_filename, sep = '\t', header=False, index=False)