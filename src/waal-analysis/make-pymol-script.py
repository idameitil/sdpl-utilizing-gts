import sys
sys.path.insert(0, 'src/ssn-clustering')
import common2

fasta_dict = common2.read_MSA_file("data/waal/MSA-logo/seeds-and-hits.afa")
conserved_residues = common2.get_conserved_residues(fasta_dict, 0.95)
structure_name = 'WP_011517284.1'
positions = common2.get_specific_positions_conserved_residues(structure_name, conserved_residues, fasta_dict)

load_model_string = f"""
fetch 7TPG
select chain_B, chain B
select chain_L, chain L
hide cartoon, chain_L
select chain_H, chain H
hide cartoon, chain_H
"""

show_conserved_residues_string = f"""show licorice, cons_ACC
color atomic, cons_ACC\n
"""

script = load_model_string

for position in positions:
    script += f'label n. CA and resi {position} and chain_B, "%s-%s" % (resn, resi)\n'
temp_string = f"select cons_7TPG, "
for position in positions:
    temp_string += f"resi {position} and 7TPG and chain_B or "
script += temp_string[:-4] + '\n'
script += show_conserved_residues_string.replace("ACC", '7TPG') + '\n'

script += "set label_position,(1,1,1)\n"
script += "set label_color,black\n"
script += "center \n"
script += "bg_color white \n"

pymol_script_path = f"src/waal-analysis/pymol-visualization.pml"
with open (pymol_script_path, 'w') as outfile:
    outfile.write(script)