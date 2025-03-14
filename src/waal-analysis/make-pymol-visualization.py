
import sys
sys.path.append("src/ssn-clustering")
from common import read_MSA_file, get_conserved_residues, get_specific_positions_conserved_residues

threshold = float(sys.argv[1])

### CLADE 2 ###
# Get conserved residues
alignment_filename = "data/waal/final_family/ligase-mafft.fa"
fasta_dict = read_MSA_file(alignment_filename)
conserved_residues = get_conserved_residues(fasta_dict, threshold=threshold)
positions = get_specific_positions_conserved_residues('WP_011517284.1', conserved_residues, fasta_dict)
print(conserved_residues)

# Write pymol script
load_model_string = f"""
fetch 7tpg
select chain_H, chain H
select chain_L, chain L
select chain_B, chain B
hide cartoon, chain_H
hide cartoon, chain_L
color 0xeeeeee, 7tpg
"""
show_conserved_residues_string = f"""show licorice, cons
color atomic, cons\n
"""
script_string = load_model_string
for conserved_residue in positions:
    pos = conserved_residue['pos']
    script_string += f'label n. CA and resi {pos} and 7tpg, "%s-%s" % (resn, resi)\n'
temp_string = f"select cons, "
for conserved_residue in positions:
    pos = conserved_residue['pos']
    temp_string += f"resi {pos} and 7tpg or "
script_string += temp_string[:-4] + '\n'
script_string += show_conserved_residues_string + '\n'

# ### CLADE 1 ###
# # Get conserved residues
# alignment_filename = "data/waal/final_family/ligase-mafft.fa"
# fasta_dict = read_MSA_file(alignment_filename)
# conserved_residues = get_conserved_residues(fasta_dict, threshold=0.95)
# positions = get_specific_positions_conserved_residues('P26471.1', conserved_residues, fasta_dict)
# print(conserved_residues)

# # Write pymol script
# load_model_string = f"""
# load /Users/idamei/phd/data/waal/alphafold/AF-P26471-F1-model_v3.pdb, P26471.1
# color wheat, P26471.1
# """
# show_conserved_residues_string = f"""show licorice, cons
# color atomic, cons\n
# """
# script_string += load_model_string
# for position in positions:
#     script_string += f'label n. CA and resi {position} and P26471.1, "%s-%s" % (resn, resi)\n'
# temp_string = f"select cons, "
# for position in positions:
#     temp_string += f"resi {position} and P26471.1 or "
# script_string += temp_string[:-4] + '\n'
# script_string += show_conserved_residues_string + '\n'
# script_string += "cealign 7tpg, P26471.1\n"

script_string += f"""set label_position,(1,1,1)
set label_color,black
center
bg_color white
set float_labels, on
set label_size, 20
set label_font_id, 7
remove hydrogens
set cartoon_side_chain_helper, on
set ray_trace_mode, 0
"""

pymol_script_path = f"data/waal/final_family/pymol-visualization-{threshold}.pml"
with open (pymol_script_path, 'w') as outfile:
    outfile.write(script_string)