import sys
sys.path.append('src/ssn-clustering/')
from common import SSNClusterData, read_MSA_file, get_conserved_residues, get_specific_positions_conserved_residues

### O-LIG ###
load_ligase_string = f"""
fetch 7tpg
select chain_B, chain B
hide cartoon, !chain_B
color grey, chain_B
select "cons_7tpg", resi 265 and chain_B or resi 191 and chain_B or resi 313 and chain_B
show licorice, cons_7tpg
color atomic, cons_7tpg
set_view (\
     0.129056588,   -0.914879322,   -0.382540226,\
    -0.931019366,    0.021019539,   -0.364364743,\
     0.341392726,    0.403177291,   -0.849059284,\
     0.000000000,    0.000000000, -203.904266357,\
   134.720489502,  144.012847900,  140.640121460,\
   160.759674072,  247.048858643,  -20.000000000 )\n
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

load_model_string_template = f"""
load PDB, CLUSTER_ACC
color COLOR, CLUSTER_ACC
cealign ALIGN, CLUSTER_ACC\n
"""
show_conserved_residues_string_template = f"""show licorice, cons_ACC
color atomic, cons_ACC\n
"""
colors = ['teal', 'orange', 'green', 'br6', 'red']

# Make script string
script = load_ligase_string

CAZy_families = ['0260_4_5', '0144_2_14', '0141_1_28', '0134_4_6', '0118_1_30', '0128_1_29', '0284_3_9', '0342_13_2', '0540_8_3', '0171_6_4', '1085_39_1']

for supercluster in superclusters:
    if supercluster['supercluster_id'] in CAZy_families:
        supercluster['supercluster_id']
    else:
        continue
    number = 0
    for acc in list(supercluster['alphafold_models'].keys()):
        if number == 5:
            break
        if acc not in supercluster['conserved_positions_af_models']:
            continue
        model_path = supercluster['alphafold_models'][acc]['filepath']
        if number == 0:
            first_model_name = f"{supercluster['name']}_{acc}"
            first_model = False
            script += load_model_string_template.replace("ACC", acc).replace("PDB", model_path).replace("CLUSTER", supercluster['name'])\
                .replace("ALIGN", "7tpg").replace('COLOR', '0xeeeeee')
        else:
            script += load_model_string_template.replace("ACC", acc).replace("PDB", model_path).replace("CLUSTER", supercluster['name'])\
                .replace("ALIGN", first_model_name).replace('COLOR', '0xeeeeee')
        positions = supercluster['conserved_positions_af_models'][acc]
        for conserved_residue in positions:
            pos = conserved_residue['pos']
            freq = round(conserved_residue['freq']*100)
            script += f'label n. CA and resi {pos} and {supercluster["name"]}_{acc}, "%s" % (resn)\n'
            # script += f'label n. CA and resi {pos} and {supercluster["name"]}_{acc}, "%s-%s" % (resn, resi)\n'
            script += f'label n. CA and resi {pos} and {supercluster["name"]}_{acc}, "%s-%s ({freq}%%)" % (resn, resi)\n'
        temp_string = f"select cons_{acc}, "
        for conserved_residue in positions:
            pos = conserved_residue['pos']
            temp_string += f"resi {pos} and {supercluster['name']}_{acc} or "
        script += temp_string[:-4] + '\n'
        script += show_conserved_residues_string_template.replace("ACC", acc).replace("CLUSTER", supercluster['name']) + '\n'
        number += 1

### ECA-POL ###
# Get conserved residues
threshold = 0.99

alignment_filename = "data/eca-pol/MSA_CAZy_family/clade1-pruned-including-AF-mafft.fa"
fasta_dict = read_MSA_file(alignment_filename)
conserved_residues = get_conserved_residues(fasta_dict, threshold=threshold, include_aliphatic=True)
positions = get_specific_positions_conserved_residues('ACH50550.1', conserved_residues, fasta_dict)

# Make script string
script += f"""
load data/eca-pol/alphafold/ACH50550.1/ranked_0.pdb, ECA-Pol_ACH50550.1
color 0xeeeeee, ECA-Pol_ACH50550.1
"""
for conserved_residue in positions:
    pos = conserved_residue['pos']
    script += f'label n. CA and resi {pos} and ECA-Pol_ACH50550.1, "%s-%s" % (resn, resi)\n'
temp_string = f"select cons_ACH50550.1, "
for conserved_residue in positions:
    pos = conserved_residue['pos']
    temp_string += f"resi {pos} and ECA-Pol_ACH50550.1 or "
script += temp_string[:-4] + '\n'
script += f"""show licorice, cons_ACH50550.1
color atomic, cons_ACH50550.1
cealign 6_AHB32490.1, ECA-Pol_ACH50550.1\n
"""

# Nicify
script += "@src/pymol_visualization/nicify.pml"

### WRITE TO FILE ###
pymol_script_path = f"data/pymol-visualizations/all.pml"
with open (pymol_script_path, 'w') as outfile:
    outfile.write(script)