import sys, os
import json

make_images = False

def show_conserved_string(conserved_positions, object_name):
    string = ""
    for position in conserved_positions:
        string += f'label n. CA and resi {position} and {object_name}, "%s-%s" % (resn, resi)\n'
    temp_string = f"select cons_{object_name}, "
    for position in conserved_positions:
        temp_string += f"resi {position} and {object_name} or "
    string += temp_string[:-4] + '\n'
    string += f"show licorice, cons_{object_name}"
    return string

def save_images_string(pair):
    view = f"@data/pymol-visualizations/views-individual-pairwise/{pair['view']}.pml\n"
    string = f"""\ndisable
    {view}
    enable {pair['sequences'][0]}
    enable {pair['sequences'][1]}
    remove hydrogens
    hide labels
    ray
    png /Users/idamei/phd/data/pymol-visualizations/pairwise_alignments/{pair['sequences'][0]}_{pair['sequences'][1]}.png
    """
    return string

def load_model_string(object_name, pdb):
    string = f"""
    load {pdb}, {object_name}
"""
    return string

def pymol_object_name(family_name, acc):
    return f"{family_name.replace('X', '')}_{acc}"

# Load conserved residue
conserved_residues_filename = 'data/compare-architectures/conserved_manual.json'
with open(conserved_residues_filename) as infile:
    conserved_residues = json.load(infile)

object_names = []

script = "@src/pymol-visualization/nicify.pml\n"

### O-LIG ###
script += f"""
fetch 7tpg, 615_7TPG_O-Lig
hide cartoon, !chain B
"""
script += show_conserved_string(conserved_residues['7TPG'], "615_7TPG_O-Lig")
object_names.append("615_7TPG_O-Lig")

### ECA-POL ###
script += f"""
load data/eca-pol/alphafold/ACH50550.1/ranked_0.pdb, 586_ACH50550.1
"""
script += show_conserved_string(conserved_residues['ACH50550.1'], "586_ACH50550.1")
object_names.append("586_ACH50550.1")

### RodA ###
script += f"""
load /Users/idamei/phd/data/roda/alphafold/AF-Q5SIX3-F1-model_v4.pdb, 571_AF-6BAR
"""
script += show_conserved_string(conserved_residues['6BAR'], "571_AF-6BAR")
object_names.append("571_AF-6BAR")

### O-POL ###
acc2family = {'AAM27615.1': 'X614', 'CAI34254.1': 'X609', 'CAI34124.1': 'X607', 'CAI34369.1': 'X613',
              'BAQ02088.1': 'X605', 'AHB32861.1': 'X617', 'AHB32411.1': 'X610', 'CAI32823.1': 'X612',
              'AAT77177.1': 'X606', 'AAM27801.1': 'X611', 'CAI32772.1': 'X608', 'ACH50550.1': 'X586',
              'BAQ02224.1': 'X633', 'BAQ01641.1': 'X631', 'CAI33412.1': 'X632', 'ADI43271.1': 'X634'}

for acc in conserved_residues:
    if acc in ['6BAR', '7TPG', 'ACH50550.1']:
        continue
    model_path = f"data/wzy/alphafold/{acc}/ranked_0.pdb"
    family = acc2family[acc]
    script += load_model_string(object_name=pymol_object_name(family, acc), pdb=model_path)
    script += show_conserved_string(conserved_residues[acc], pymol_object_name(family, acc))
    object_names.append(pymol_object_name(family, acc))

### ALIGN ###
script += f"""\nsuper 615_7TPG_O-Lig, 613_CAI34369.1
cealign 615_7TPG_O-Lig, 614_AAM27615.1
cealign 614_AAM27615.1, 609_CAI34254.1
super 607_CAI34124.1, 609_CAI34254.1
cealign 607_CAI34124.1, 605_BAQ02088.1

cealign 605_BAQ02088.1, 633_BAQ02224.1

cealign 633_BAQ02224.1, 610_AHB32411.1
super 612_CAI32823.1, 610_AHB32411.1
super 606_AAT77177.1, 612_CAI32823.1
cealign 606_AAT77177.1, 611_AAM27801.1
cealign 611_AAM27801.1, 608_CAI32772.1
cealign 608_CAI32772.1, 586_ACH50550.1

super 617_AHB32861.1, 586_ACH50550.1

cealign 617_AHB32861.1, 631_BAQ01641.1
cealign 631_BAQ01641.1, 634_ADI43271.1
"""

pairs = [{'sequences': ('613_CAI34369.1', '615_7TPG_O-Lig'), 'view': 'view1'},
         {'sequences': ('615_7TPG_O-Lig', '614_AAM27615.1'), 'view': 'view1'},
         {'sequences': ('614_AAM27615.1', '609_CAI34254.1'), 'view': 'view1'},
         {'sequences': ('609_CAI34254.1', '607_CAI34124.1'), 'view': 'view1'},
         {'sequences': ('607_CAI34124.1', '605_BAQ02088.1'), 'view': 'view2'},
         {'sequences': ('633_BAQ02224.1', '610_AHB32411.1'), 'view': 'view3'},
         {'sequences': ('610_AHB32411.1', '612_CAI32823.1'), 'view': 'view4'},
         {'sequences': ('612_CAI32823.1', '606_AAT77177.1'), 'view': 'view5'},
         {'sequences': ('606_AAT77177.1', '611_AAM27801.1'), 'view': 'view6'},
         {'sequences': ('611_AAM27801.1', '608_CAI32772.1'), 'view': 'view7'},
         {'sequences': ('608_CAI32772.1', '586_ACH50550.1'), 'view': 'view8'},
         {'sequences': ('617_AHB32861.1', '631_BAQ01641.1'), 'view': 'view9'},
         {'sequences': ('631_BAQ01641.1', '634_ADI43271.1'), 'view': 'view9'}
         ]

for pair in pairs:
    script += save_images_string(pair)

# Nicify
script += "@src/pymol-visualization/nicify.pml\n"

### WRITE TO FILE ###
if make_images:
    pymol_script_path = f"data/pymol-visualizations/pymol-script-selected-make-images.pml"
else:
    pymol_script_path = f"data/pymol-visualizations/pymol-script-pairwise.pml"
with open (pymol_script_path, 'w') as outfile:
    outfile.write(script)