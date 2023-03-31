import sys, os
import json

make_images = False

color_scheme = 'blue'

if color_scheme == 'grey':
    cartoon_color = '0xeeeeee'
    licorice_color = 'gray60'
elif color_scheme == 'blue':
    cartoon_color = 'palecyan'
    licorice_color = 'teal'
elif color_scheme == 'pink':
    cartoon_color = 'lightpink'
    licorice_color = 'pink'
elif color_scheme == 'orange':
    cartoon_color = 'lightorange'
    licorice_color = 'orange'

def show_conserved_string(conserved_positions, object_name):
    string = ""
    for position in conserved_positions:
        string += f'label n. CA and resi {position} and {object_name}, "%s" % (resn)\n'
    temp_string = f"select cons_{object_name}, "
    for position in conserved_positions:
        temp_string += f"resi {position} and {object_name} or "
    string += temp_string[:-4] + '\n'
    string += f"""show licorice, cons_{object_name}
    color atomic, (cons_{object_name} and not elem C)
    """
    return string

def save_images_string(pymol_object_name):
    if pymol_object_name in inv_group:
        string = "@src/pymol-visualization/view-607.pml\n"
    elif pymol_object_name == "617_i_AHB32861.1":
        string = "@src/pymol-visualization/view-617.pml\n"
    elif pymol_object_name in ret_group1:
        string = "@src/pymol-visualization/view-606.pml\n"
    elif pymol_object_name in ret_group2:
        string = "@src/pymol-visualization/view-608.pml\n"
    string += f"""disable
    enable {pymol_object_name}
    set cartoon_color, {cartoon_color}
    remove hydrogens
    hide labels
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures_selected/{pymol_object_name}.png
    show labels
    deselect
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures_selected/{pymol_object_name}_labels.png
    """
    return string

def load_model_string(object_name, pdb, color):
    string = f"""load {pdb}, {object_name}
    color {color}, {object_name}
    """
    return string

def pymol_object_name(family_name, acc):
    if family_name in retaining:
        stereochemistry = 'r'
    elif family_name in inverting:
        stereochemistry = 'i'
    return f"{family_name.replace('X', '')}_{stereochemistry}_{acc}"

# Load conserved residue
conserved_residues_filename = 'data/compare-architectures/conserved_manual.json'
with open(conserved_residues_filename) as infile:
    conserved_residues = json.load(infile)

object_names = []

script = "@src/pymol-visualization/nicify.pml\n"

### O-LIG ###
script += f"""
fetch 7tpg, 615_i_7TPG_O-Lig
hide cartoon, !chain B
color {licorice_color}, 615_i_7TPG_O-Lig
"""
script += show_conserved_string(conserved_residues['WP_011517284.1'], "615_i_7TPG_O-Lig")
object_names.append("615_i_7TPG_O-Lig")

### ECA-POL ###
script += f"""
load data/eca-pol/alphafold/ACH50550.1/ranked_0.pdb, 586_r_ACH50550.1
color {licorice_color}, 586_r_ACH50550.1
"""
script += show_conserved_string(conserved_residues['ACH50550.1'], "586_r_ACH50550.1")
object_names.append("586_r_ACH50550.1")

### RodA ###
script += f"""load /Users/idamei/phd/data/roda/alphafold/AF-Q5SIX3-F1-model_v4.pdb, 571_i_AF-6BAR
color {licorice_color}, 571_i_AF-6BAR
"""
script += show_conserved_string(conserved_residues['6bar'], "571_i_AF-6BAR")
object_names.append("571_i_AF-6BAR")

### O-POL ###
retaining = ['X606', 'X608', 'X610', 'X611', 'X612']
inverting = ['X605', 'X607', 'X609', 'X613', 'X614', 'X617']

inv_group = ["615_i_7TPG_O-Lig", "571_i_AF-6BAR", "614_i_AAM27615.1", "609_i_CAI34254.1", "607_i_CAI34124.1", "613_i_CAI34369.1", "605_i_BAQ02088.1"]
ret_group1 = ["612_r_ADC54950.1", "611_r_AAA97573.1", "606_r_AAT77177.1", "610_r_AHB32411.1"]
ret_group2 = ["586_r_ACH50550.1", "608_r_CAI32772.1"]

acc2family = {'AAM27615.1': 'X614', 'CAI34254.1': 'X609', 'CAI34124.1': 'X607', 'CAI34369.1': 'X613',
              'BAQ02088.1': 'X605', 'AHB32861.1': 'X617', 'AHB32411.1': 'X610', 'ADC54950.1': 'X612',
              'AAT77177.1': 'X606', 'AAA97573.1': 'X611', 'CAI32772.1': 'X608', 'ACH50550.1': 'X586'}

for acc in conserved_residues:
    if acc in ['6bar', 'WP_011517284.1', 'ACH50550.1']:
        continue
    model_path = f"data/wzy/alphafold/{acc}/ranked_0.pdb"
    family = acc2family[acc]
    script += load_model_string(object_name=pymol_object_name(family, acc), pdb=model_path, color=licorice_color)
    script += show_conserved_string(conserved_residues[acc], pymol_object_name(family, acc))
    object_names.append(pymol_object_name(family, acc))

### ALIGN ###
for object_name in object_names:
    if object_name in inv_group or object_name == "617_i_AHB32861.1":
        align_object = "607_i_CAI34124.1"
    elif object_name in ret_group1:
        align_object = "606_r_AAT77177.1"
    elif object_name in ret_group2:
        align_object = "608_r_CAI32772.1"
    script += f"cealign {align_object}, {object_name}\n"

### SAVE IMAGES ###
if make_images:
    for object_name in object_names:
        script += save_images_string(pymol_object_name=object_name)

# Nicify
script += "@src/pymol-visualization/nicify.pml\n"
# script += f"set cartoon_color, {cartoon_color}"

### WRITE TO FILE ###
if make_images:
    pymol_script_path = f"data/pymol-visualizations/pymol-script-selected-make-images.pml"
else:
    pymol_script_path = f"data/pymol-visualizations/pymol-script-selected.pml"
with open (pymol_script_path, 'w') as outfile:
    outfile.write(script)