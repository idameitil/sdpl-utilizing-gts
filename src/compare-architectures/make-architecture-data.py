import sys, os
import pandas as pd
sys.path.append("src/ssn-clustering")
from common import read_MSA_file, get_conserved_residues, get_specific_positions_conserved_residues
import json

threshold = 0.99

def get_name(entry):
    if entry['family'] == 'GTxx1':
        name = f"{entry['family']}, RodA, {entry['acc']}"
    elif entry['family'] == 'GTxx3' or entry['family'][0:4] == 'GTxx3':
        name = f"{entry['family']}, O-Lig, {entry['acc']}"
    elif entry['family'] == 'GTxx2':
        name = f"{entry['family']}, ECA-Pol, {entry['acc']}"
    else:
        name = f"{entry['family']}, BP-Pol, {entry['acc']}"
    return name

# Selected with family conservation
entries = [
    [
    {'acc': '6BAR', 'family': 'GTxx1'}
    ],
    [
    {'acc': 'CAI34369.1', 'family': 'GTxx7'},
    {'acc': '7TPG', 'family': 'GTxx3'},
    {'acc': 'AAM27615.1', 'family': 'GTxx8'},
    {'acc': 'CAI34254.1', 'family': 'GTxx9'},
    {'acc': 'CAI34124.1', 'family': 'GTx10'},
    {'acc': 'BAQ02088.1', 'family': 'GTx11'}
    ],
    [
    {'acc': 'BAQ02224.1', 'family': 'GTx17'},
    {'acc': 'AHB32411.1', 'family': 'GTx12'},
    {'acc': 'CAI32823.1', 'family': 'GTx13'},
    {'acc': 'AAT77177.1', 'family': 'GTx14'},
    {'acc': 'AAM27801.1', 'family': 'GTx15'},
    {'acc': 'CAI32772.1', 'family': 'GTx16'},
    {'acc': 'ACH50550.1', 'family': 'GTxx2'}
    ],
    [
    {'acc': 'AHB32861.1', 'family': 'GTxx4'},
    {'acc': 'BAQ01641.1', 'family': 'GTxx5'},
    {'acc': 'ADI43271.1', 'family': 'GTxx6'}
    ]
]

# Get architecture strings
table_folder = "data/compare-architectures/architecture-tables-dssp-with-tm"
for i in range(len(entries)):
    for j in range(len(entries[i])):
        entry = entries[i][j]
        table_filename = f"{table_folder}/{entry['acc']}.csv"
        df = pd.read_csv(table_filename, sep=',')
        architecture_string = ''
        previous = 0
        for index, row in df.iterrows():
            length = int(row.end) - previous
            architecture_string += row.type * length
            previous = int(row.end)
        entries[i][j]['architecture_string'] = architecture_string
        entries[i][j]['length'] = int(row.end)

# Write architecture file
outfilename = f"data/compare-architectures/architecture.js"
with open(outfilename, 'w') as outfile:
    outfile.write("const architectures = [\n")
    for i in range(len(entries)):
        outfile.write("\t{\n")
        for j in range(len(entries[i])):
            entry = entries[i][j]
            outfile.write(f"\t'{get_name(entry)}': '{entry['architecture_string']}'")
            if j < len(entries[i]) - 1:
                outfile.write(",\n")
            else:
                outfile.write("\n")
        outfile.write("\t},\n")
    outfile.write('];')

# Write length file
outfilename = f"data/compare-architectures/lengths.js"
with open(outfilename, 'w') as outfile:
    outfile.write("const lengths = {\n")
    max_length = 0
    for i in range(len(entries)):
        for j in range(len(entries[i])):
            entry = entries[i][j]
            outfile.write(f"\t'{get_name(entry)}': {entry['length']},\n")
            if entry['length'] > max_length:
                max_length = entry['length']
    outfile.write("};\n")
    outfile.write(f"const max_length = {max_length};\n")