from Bio.PDB import PDBParser
from Bio.PDB.DSSP import DSSP
import os, sys

p = PDBParser()

def get_SS_string(dssp_object):
    SS_string = 'type,end\n'
    previous = ''
    for residue in dssp_object:
        SS_translation = {'H': 'h', 'B': 'l', 'E': 's', 'G': 'h', 'I': 'h', 'T': 'l', 'S': 'l', '-': 'l'}
        simplified_secondary_structure = SS_translation[residue[2]]
        position = residue[0]
        if simplified_secondary_structure == previous:
            continue
        if previous == 'h':
            SS_string += f"h,{position-1}\n"
        elif previous == 's':
            SS_string += f"s,{position-1}\n"
        elif previous == 'l':
            SS_string += f"l,{position-1}\n"
        previous = simplified_secondary_structure
    return SS_string

# Wzy
accessions = ['AHB32215.1', 'AHB32334.1', 'AHB32861.1', 'CAI34008.1', 'ACH97162.1', 'CAI33309.1', 'CAI34369.1', 'AIG62747.1', 'BAQ00653.1', 'ADC54950.1', 'AAZ85718.1', 'CDF66396.1', 'AAA97573.1', 'AAC45857.1', 'BAQ00795.1', 'BAQ01659.1', 'BAQ02088.1', 'ACA24754.1', 'ACD37165.1', 'AAM27615.1', 'CBN82200.1', 'AAT77177.1', 'CAI34124.1', 'AHB32490.1', 'CAI32772.1', 'AHB32411.1', 'CAI34254.1', 'CAI34198.1', 'CAI34217.1']
for acc in accessions:
    model_path = f"data/wzy/alphafold/{acc}/ranked_0.pdb"
    structure = p.get_structure(acc, model_path)
    model = structure[0]
    dssp = DSSP(model, model_path)
    string = get_SS_string(dssp)
    outfilename = f"data/compare-architectures/architecture-tables-dssp/{acc}.csv"
    with open(outfilename, 'w') as outfile:
        outfile.write(string)

# RodA
model_path = f"data/roda/alphafold/AF-Q5SIX3-F1-model_v4.pdb"
structure = p.get_structure("6bar", model_path)
model = structure[0]
dssp = DSSP(model, model_path)
string = get_SS_string(dssp)
outfilename = f"data/compare-architectures/architecture-tables-dssp/6bar.csv"
with open(outfilename, 'w') as outfile:
    outfile.write(string)

# O-Lig
model_path = f"data/waal/alphafold/CAR61594.1/CAR61594.1_O-antigen_ligase__Salmonella_enterica_subsp._enterica_serovar_Paratyphi_A_str._AKU_12601__relaxed_rank_1_model_5.pdb"
structure = p.get_structure("CAR61594.1", model_path)
model = structure[0]
dssp = DSSP(model, model_path)
string = get_SS_string(dssp)
outfilename = f"data/compare-architectures/architecture-tables-dssp/CAR61594.1.csv"
with open(outfilename, 'w') as outfile:
    outfile.write(string)

model_path = "data/waal/7tpg.pdb"
structure = p.get_structure("WP_011517284.1", model_path)
model = structure[0]
dssp = DSSP(model, model_path)
string = get_SS_string(dssp)
outfilename = f"data/compare-architectures/architecture-tables-dssp/WP_011517284.1.csv"
with open(outfilename, 'w') as outfile:
    outfile.write(string)

# ECA-Pol
model_path = "data/eca-pol/alphafold/ACH50550.1/ranked_0.pdb"
structure = p.get_structure("ACH50550.1", model_path)
model = structure[0]
dssp = DSSP(model, model_path)
string = get_SS_string(dssp)
outfilename = f"data/compare-architectures/architecture-tables-dssp/ACH50550.1.csv"
with open(outfilename, 'w') as outfile:
    outfile.write(string)