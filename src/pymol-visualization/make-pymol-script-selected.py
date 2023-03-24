import sys, copy
sys.path.append('src/ssn-clustering/')
from common import SSNClusterData, read_MSA_file, get_conserved_residues, get_specific_positions_conserved_residues
import json

make_images = True

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

def pymol_object_name(supercluster_name, acc):
    if supercluster_name in retaining:
        stereochemistry = 'r'
    elif supercluster_name in inverting:
        stereochemistry = 'i'
    return f"{superclustername2cazyname[supercluster_name]}_{stereochemistry}_{acc}"

# Load conserved residue
conserved_residues_filename = 'data/compare-architectures/conserved_manual.json'
with open(conserved_residues_filename) as infile:
    conserved_residues = json.load(infile)

object_names = []

script = "@src/pymol-visualization/nicify.pml\n"

### O-LIG ###
load_ligase_string = f"""
fetch 7tpg, 615_i_7TPG_O-Lig
select chain_B, chain B
hide cartoon, !chain_B
color 0xeeeeee, chain_B
"""
script += load_ligase_string
script += show_conserved_string(conserved_residues['WP_011517284.1'], "615_i_7TPG_O-Lig")
object_names.append("615_i_7TPG_O-Lig")

### ECA-POL ###

# Make script string
script += f"""
load data/eca-pol/alphafold/ACH50550.1/ranked_0.pdb, 586_r_ACH50550.1
color 0xeeeeee, 586_r_ACH50550.1
"""
script += show_conserved_string(conserved_residues['ACH50550.1'], "586_r_ACH50550.1")
object_names.append("586_r_ACH50550.1")

### RodA ###
threshold = 0.96

script += f"""load /Users/idamei/phd/data/roda/alphafold/AF-Q5SIX3-F1-model_v4.pdb, 571_i_AF-6BAR
color 0xeeeeee, 571_i_AF-6BAR
"""
script += show_conserved_string(conserved_residues['6bar'], "571_i_AF-6BAR")
object_names.append("571_i_AF-6BAR")

### O-POL ###
ssn_timestamp = '2210171613'
superclustering_timestamp = '2210191051'

# Get clustering data
clustering_data = SSNClusterData(ssn_clustering_id=ssn_timestamp, 
    superclustering_id=superclustering_timestamp, calculate_conserved = False,
    get_sugars=False, get_sugars_superclusters=False, load_clusters=False, 
    load_superclusters=True, calculate_conserved_superclusters=False)
superclusters = list(clustering_data.superclusters)

inv_group = ["615_i_7TPG_O-Lig", "571_i_AF-6BAR", "614_i_AAM27615.1", "609_i_CAI34254.1", "607_i_CAI34124.1", "613_i_CAI34369.1", "605_i_BAQ02088.1"]
ret_group1 = ["612_r_ADC54950.1", "611_r_AAA97573.1", "606_r_AAT77177.1", "610_r_AHB32411.1"]
ret_group2 = ["586_r_ACH50550.1", "608_r_CAI32772.1"]

CAZy_families = ['0260_4_5', '0144_2_14', '0141_1_28', '0134_4_6', '0118_1_30', '0128_1_29', '0284_3_9', '0342_13_2', '0540_8_3', '0171_6_4', '1085_39_1']
retaining = ['14', '6', '29', '9', '2']
inverting = ['5', '28', '30', '3', '4', '1']
superclustername2cazyname = {'5': '605', '14': '606', '28':'607', '6':'608', '30':'609', '29':'610', '9':'611', '2':'612', '3':'613', '4':'614', '1':'617'}

for supercluster in superclusters:
    if supercluster['supercluster_id'] not in CAZy_families:
        continue
    number = 0
    for acc in list(supercluster['alphafold_models'].keys()):
        if acc not in conserved_residues:
            continue
        model_path = supercluster['alphafold_models'][acc]['filepath']
        script += load_model_string(object_name=pymol_object_name(supercluster['name'], acc), pdb=model_path, color='0xeeeeee')
        script += show_conserved_string(conserved_residues[acc], pymol_object_name(supercluster['name'], acc))
        object_names.append(pymol_object_name(supercluster['name'], acc))

# Align
for object_name in object_names:
    if object_name in inv_group or object_name == "617_i_AHB32861.1":
        align_object = "607_i_CAI34124.1"
    elif object_name in ret_group1:
        align_object = "606_r_AAT77177.1"
    elif object_name in ret_group2:
        align_object = "608_r_CAI32772.1"
    script += f"cealign {align_object}, {object_name}\n"

# Save images
if make_images:
    for object_name in object_names:
        script += save_images_string(pymol_object_name=object_name)

# Nicify
script += "@src/pymol-visualization/nicify.pml\n"

### WRITE TO FILE ###
if make_images:
    pymol_script_path = f"data/pymol-visualizations/pymol-script-selected-make-images.pml"
else:
    pymol_script_path = f"data/pymol-visualizations/pymol-script-selected.pml"
with open (pymol_script_path, 'w') as outfile:
    outfile.write(script)