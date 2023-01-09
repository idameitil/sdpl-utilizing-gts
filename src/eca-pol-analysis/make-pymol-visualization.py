
import sys
sys.path.append("src/ssn-clustering")
from common import read_MSA_file, get_conserved_residues, get_specific_positions_conserved_residues

threshold = float(sys.argv[1])

# Get conserved residues
alignment_filename = "data/eca-pol/seeds-and-hits1e-60-cdhit99_mafft_maxit1000.fa"
fasta_dict = read_MSA_file(alignment_filename)
conserved_residues = get_conserved_residues(fasta_dict, threshold=threshold)
positions = get_specific_positions_conserved_residues('ACH50550.1', conserved_residues, fasta_dict)

# Write pymol script
load_model_string = f"""
load data/eca-pol/alphafold/ACH50550.1/ranked_0.pdb, ACH50550.1
color 0xeeeeee, ACH50550.1
"""
show_conserved_residues_string = f"""show licorice, cons
color atomic, cons\n
"""
script_string = load_model_string
for conserved_residue in positions:
    pos = conserved_residue['pos']
    script_string += f'label n. CA and resi {pos} and ACH50550.1, "%s-%s" % (resn, resi)\n'
temp_string = f"select cons, "
for conserved_residue in positions:
    pos = conserved_residue['pos']
    temp_string += f"resi {pos} and ACH50550.1 or "
script_string += temp_string[:-4] + '\n'
script_string += show_conserved_residues_string + '\n'
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

pymol_script_path = f"data/eca-pol/MSA_CAZy_family/pymol-visualization-{threshold}.pml"
with open (pymol_script_path, 'w') as outfile:
    outfile.write(script_string)