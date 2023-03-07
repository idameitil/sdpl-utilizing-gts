import sys, copy
sys.path.append('src/ssn-clustering/')
from common import SSNClusterData, read_MSA_file, get_conserved_residues, get_specific_positions_conserved_residues
import json

make_images = True

# Load views
views_filename = "src/pymol-visualization/views.json"
with open(views_filename) as infile:
    views = json.load(infile)

### O-LIG ###
load_ligase_string = f"""
fetch 7tpg
select chain_B, chain B
hide cartoon, !chain_B
color 0xeeeeee, chain_B
select "cons_7tpg", resi 265 and chain_B or resi 191 and chain_B or resi 313 and chain_B
show licorice, cons_7tpg
color atomic, (cons_7tpg and not elem C)
@src/pymol-visualization/nicify.pml
"""
script = load_ligase_string

### ECA-POL ###
# Get conserved residues
threshold = 0.99

alignment_filename = "data/eca-pol/MSA_CAZy_family/clade1-pruned-including-AF-mafft.fa"
fasta_dict = read_MSA_file(alignment_filename)
conserved_residues = get_conserved_residues(fasta_dict, threshold=threshold, include_aliphatic=False)
positions = get_specific_positions_conserved_residues('ACH50550.1', conserved_residues, fasta_dict)

# Make script string
script += f"""
load data/eca-pol/alphafold/ACH50550.1/ranked_0.pdb, ECA-Pol_ACH50550.1
color 0xeeeeee, ECA-Pol_ACH50550.1
"""
for conserved_residue in positions:
    pos = conserved_residue['pos']
    script += f'label n. CA and resi {pos} and ECA-Pol_ACH50550.1, "%s-%s" % (resn, resi)\n'
temp_string = f"select cons_ECA-Pol_ACH50550.1, "
for conserved_residue in positions:
    pos = conserved_residue['pos']
    temp_string += f"resi {pos} and ECA-Pol_ACH50550.1 or "
script += temp_string[:-4] + '\n'
script += f"""show licorice, cons_ECA-Pol_ACH50550.1
color atomic, (cons_ECA-Pol_ACH50550.1 and not elem C)
cealign 7tpg, ECA-Pol_ACH50550.1
"""

### RodA ###
threshold = 0.9

alignment_filename = "data/roda/list3-with_6BAR-mafft.fa"
fasta_dict = read_MSA_file(alignment_filename)
conserved_residues = get_conserved_residues(fasta_dict, threshold=threshold, include_aliphatic=False)
positions = get_specific_positions_conserved_residues('6BAR_1', conserved_residues, fasta_dict)
script += f"""fetch 6BAR
color 0xeeeeee, 6BAR
"""
for conserved_residue in positions:
    pos = conserved_residue['pos']
    script += f'label n. CA and resi {pos} and 6BAR, "%s-%s" % (resn, resi)\n'
temp_string = f"select cons_6BAR, "
for conserved_residue in positions:
    pos = conserved_residue['pos']
    temp_string += f"resi {pos} and 6BAR or "
script += temp_string[:-4] + '\n'
script += f"""show licorice, cons_6BAR
color atomic, (cons_6BAR and not elem C)
cealign 7tpg, 6BAR\n
"""

### O-POL ###
ssn_timestamp = '2210171613'
superclustering_timestamp = '2210191051'

# Get clustering data
clustering_data = SSNClusterData(ssn_clustering_id=ssn_timestamp, 
    superclustering_id=superclustering_timestamp, calculate_conserved = False,
    get_sugars=False, get_sugars_superclusters=False, load_clusters=False, 
    load_superclusters=True, calculate_conserved_superclusters=True)
superclusters = list(clustering_data.superclusters)

def load_model_string(object_name, pdb, color, align_object_name):
    string = f"""load {pdb}, {object_name}
    color {color}, {object_name}
    cealign {align_object_name}, {object_name}
    """
    return string

def show_conserved_residues_string(selection_name):
    string = f"""show licorice, {selection_name}
    color atomic, ({selection_name} and not elem C)
    """
    return string

def save_images_string(pymol_object_name):
    string = f"""{views["0.95"][pymol_object_name]['zoom_in']}
    disable
    enable {pymol_object_name}
    remove hydrogens
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/zoom_in_labels/{pymol_object_name}_labels.png
    hide labels
    deselect
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/zoom_in/{pymol_object_name}.png
    {views["0.95"][pymol_object_name]['zoom_out']}
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/zoom_out/{pymol_object_name}_zoom_out.png
    """
    return string

# Make script string
CAZy_families = ['0260_4_5', '0144_2_14', '0141_1_28', '0134_4_6', '0118_1_30', '0128_1_29', '0284_3_9', '0342_13_2', '0540_8_3', '0171_6_4', '1085_39_1']
retaining = ['14', '6', '29', '9', '2']
inverting = ['5', '28', '30', '3', '4', '1']
stereochemistry = {'14':'ret', '6':'ret', '29':'ret', '9':'ret', '2':'ret', '5':'inv', '28':'inv', '30':'inv', '3':'inv', '4':'inv', '1':'inv'}

for supercluster in superclusters:
    if supercluster['supercluster_id'] not in CAZy_families:
        continue
    number = 0
    for acc in list(supercluster['alphafold_models'].keys()):
        if number == 5:
            break
        if acc not in supercluster['conserved_positions_af_models']:
            continue
        model_path = supercluster['alphafold_models'][acc]['filepath']
        pymol_object_name = f'{supercluster["name"]}_{stereochemistry[supercluster["name"]]}_{acc}'
        # Align
        if number == 0:
            first_model_object_name = copy.deepcopy(pymol_object_name)
            first_model = False
            if stereochemistry[supercluster['name']] == 'inv':
                align_object = '6bar'
            elif stereochemistry[supercluster['name']] == 'ret':
                align_object = 'ECA-Pol_ACH50550.1'
            script += load_model_string(object_name=pymol_object_name, pdb=model_path, color='0xeeeeee', align_object_name=align_object)
        else:
            script += load_model_string(object_name=pymol_object_name, pdb=model_path, color='0xeeeeee', align_object_name=first_model_object_name)
        positions = supercluster['conserved_positions_af_models'][acc]
        # Conserved residues
        pymol_selection_name = f"cons_{pymol_object_name}"
        for conserved_residue in positions:
            pos = conserved_residue['pos']
            freq = round(conserved_residue['freq']*100)
            # script += f'label n. CA and resi {pos} and {pymol_object_name}, "%s-%s ({freq}%%)" % (resn, resi)\n'
            script += f'label n. CA and resi {pos} and {pymol_object_name}, "%s" % (resn)\n'
        temp_string = f"select {pymol_selection_name}, "
        for conserved_residue in positions:
            pos = conserved_residue['pos']
            temp_string += f"resi {pos} and {pymol_object_name} or "
        script += temp_string[:-4] + '\n'
        script += show_conserved_residues_string(selection_name=pymol_selection_name)
        # Save images
        if pymol_object_name in views['0.95'] and make_images:
            script += save_images_string(pymol_object_name=pymol_object_name)
        number += 1

# Nicify
script += "@src/pymol-visualization/nicify.pml\n"

# # Figure with three from same cluster
# script += f"""disable
# enable 1_inv_AHB32215.1 1_inv_CAI34008.1 1_inv_ACH97162.1
# hide labels
# {views["0.95"]['three_from_one_family']['zoom_out']}
# ray
# png /Users/idamei/phd/data/pymol-visualizations/figures/three_from_one_family_zoom_out.png
# {views["0.95"]['three_from_one_family']['zoom_in']}
# ray
# png /Users/idamei/phd/data/pymol-visualizations/figures/three_from_one_family.png
# show labels
# ray
# png /Users/idamei/phd/data/pymol-visualizations/figures/three_from_one_family_labels.png
# """

if make_images:
    # Figure with three from same cluster - different view
    script += f"""disable
    enable 1_inv_AHB32215.1 1_inv_CAI34008.1 1_inv_ACH97162.1
    color atomic, cons_1_inv_AHB32215.1
    color atomic, cons_1_inv_CAI34008.1
    color atomic, cons_1_inv_ACH97162.1
    hide labels
    {views["0.95"]['three_from_one_family2']['zoom_out']}
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/three_from_one_family_zoom_out2.png
    {views["0.95"]['three_from_one_family2']['zoom_in']}
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/three_from_one_family2.png
    show labels
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/three_from_one_family_labels2.png
    """

### WRITE TO FILE ###
if make_images:
    pymol_script_path = f"data/pymol-visualizations/pymol-script-make-images.pml"
else:
    pymol_script_path = f"data/pymol-visualizations/pymol-script.pml"
with open (pymol_script_path, 'w') as outfile:
    outfile.write(script)