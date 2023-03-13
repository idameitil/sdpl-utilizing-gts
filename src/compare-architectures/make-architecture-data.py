import sys, os
import pandas as pd
sys.path.append("src/ssn-clustering")
from common import read_MSA_file, get_conserved_residues, get_specific_positions_conserved_residues

threshold = 0.96

entries = [
           {'acc': '6bar', 'family': 'X571'},
           {'acc': 'WP_011517284.1', 'family': 'X615'},
        #    {'acc': 'WP_011517284.1', 'family': 'X615_A'},
        #    {'acc': 'CAR61594.1', 'family': 'X615_C'},
           {'acc': 'ACD37165.1', 'family': 'X614'},
           {'acc': 'CAI34254.1', 'family': 'X609'},
           {'acc': 'CAI34124.1', 'family': 'X607'},
           {'acc': 'CAI33309.1', 'family': 'X613'},
           {'acc': 'BAQ02088.1', 'family': 'X605'},
           {'acc': 'AHB32215.1', 'family': 'X617'}, 
           {'acc': 'AHB32411.1', 'family': 'X610'},
           {'acc': 'BAQ00653.1', 'family': 'X612'},
           {'acc': 'CBN82200.1', 'family': 'X606'},
           {'acc': 'CDF66396.1', 'family': 'X611'},
           {'acc': 'AHB32490.1', 'family': 'X608'},
           {'acc': 'ACH50550.1', 'family': 'X586'},
           ]

# Get conserved
for i in range(len(entries)):
    entry = entries[i]
    if entry['family'] == 'X586':
        alignment_filename = f"data/hhblits_cazy_families/msas-family-names/{entry['family']}-with-model.fa"
    elif entry['family'] == 'X571':
        alignment_filename = f"data/roda/list4-with-6bar-pruned-mafft.fa"
        # entries[i]['conserved_positions'] = {255: 'D'}
        # continue
    else:
        alignment_filename = f"data/hhblits_cazy_families/msas-family-names/{entry['family']}.fa"
    fasta_dict = read_MSA_file(alignment_filename)
    conserved_residues = get_conserved_residues(fasta_dict, threshold=threshold, include_aliphatic=False)
    positions = get_specific_positions_conserved_residues(entry['acc'], conserved_residues, fasta_dict)
    entries[i]['conserved_positions'] = {position['pos']: position['AA'] for position in positions}

# Write conserved file
outfilename = f"data/compare-architectures/conserved_{threshold}.js"
with open(outfilename, 'w') as outfile:
    outfile.write("const conservedResidues = {\n")
    for entry in entries:
        outfile.write(f"\t'{entry['family']}, {entry['acc']}': {entry['conserved_positions']},\n")
    outfile.write('}')

# Get architecture strings
table_folder = "data/compare-architectures/architecture-tables"
type2symbol = {'t': '=', 'i': '_', 'o': '-', 'h': 'h'}
for i in range(len(entries)):
    entry = entries[i]
    table_filename = f"{table_folder}/{entry['acc']}.csv"
    df = pd.read_csv(table_filename, sep=',')
    architecture_string = ''
    previous = 0
    for index, row in df.iterrows():
        length = int(row.end) - previous
        architecture_string += type2symbol[row.type] * length
        previous = int(row.end)
    entries[i]['architecture_string'] = architecture_string
    entries[i]['length'] = int(row.end)

# Write architecture file
outfilename = f"data/compare-architectures/architecture.js"
with open(outfilename, 'w') as outfile:
    outfile.write("const architectures = {\n")
    for entry in entries:
        outfile.write(f"\t'{entry['family']}, {entry['acc']}': '{entry['architecture_string']}',\n")
    outfile.write('}')

# Write length file
outfilename = f"data/compare-architectures/lengths.js"
with open(outfilename, 'w') as outfile:
    outfile.write("const lengths = {\n")
    max_length = 0
    for entry in entries:
        outfile.write(f"\t'{entry['family']}, {entry['acc']}': {entry['length']},\n")
        if entry['length'] > max_length:
            max_length = entry['length']
    outfile.write(f"\t'max': {max_length}\n")
    outfile.write('}')

# accessions_filename = "data/garry-figure/family-representatives.tsv"
# df = pd.read_csv(accessions_filename, sep='\t', names=['family', 'accession'])
# threshold = 0.95

# def replacer(s, newstring, index, nofail=False):
#     # raise an error if index is outside of the string
#     if not nofail and index not in range(len(s)):
#         raise ValueError("index outside given string")

#     # if not erroring, but the index is still not in the correct range..
#     if index < 0:  # add it to the beginning
#         return newstring + s
#     if index > len(s):  # add it to the end
#         return s + newstring

#     # insert the new string between "slices" of the original
#     return s[:index] + newstring + s[index + 1:]

# outfilename = "data/garry-figure/conserved.out"
# with open(outfilename, 'w') as outfile:
#     for index, row in df.iterrows():
#         outfile.write(row.family + '\n')
#         outfile.write(row.accession + '\n')
#         alignment_filename = f"data/hhblits_cazy_families/msas-family-names/{row.family}.fa"
#         fasta_dict = read_MSA_file(alignment_filename)
#         conserved_residues = get_conserved_residues(fasta_dict, threshold=threshold)
#         positions = get_specific_positions_conserved_residues(row.accession, conserved_residues, fasta_dict)

#         for position in positions:
#             strings[row.accession] = replacer(s = strings[row.accession], newstring = position['AA'], index = position['pos'])


# family2acc = {'X608': 'ADT75640.1',
# 'X611': 'AAM27728.1',
# 'X606': 'CBN82200.1',
# 'X605': 'BAQ00795.1',
# 'X617':	'CAI34008.1',
# 'X612':	'CAI33631.1',
# 'X609':	'CAI34254.1',
# 'X614':	'AAZ85713.1',
# 'X613':	'CAI34369.1',
# 'X610':	'AHB32411.1',
# 'X607':	'CAI34680.1',
# 'X586':	'AAA92024.1',
# 'X615':	'AAO71288.1'}

# inverting = ['X615', 'X617', 'X609', 'X613', 'X605', 'X607', 'X614']
# retaining = ['X586', 'X610', 'X606', 'X608', 'X611', 'X612']

# outfilename_inverting = "data/garry-figure/inverting"
# with open(outfilename_inverting, 'w') as outfile:
#     for family in inverting:
#         acc = family2acc[family]
#         outfile.write(f"{family}, {acc}\n")
#         outfile.write(strings[acc] + '\n')

# outfilename_retaining = "data/garry-figure/retaining"
# with open(outfilename_retaining, 'w') as outfile:
#     for family in retaining:
#         acc = family2acc[family]
#         outfile.write(f"{family}, {acc}\n")
#         outfile.write(strings[acc] + '\n')