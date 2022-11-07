import sys
sys.path.append('src/ssn-clustering/')
from common import SSNClusterData

timestamp = sys.argv[1]

# Get clustering data
clustering_data = SSNClusterData(timestamp, get_sugars=False, load_superclusters=False)
clusters = list(clustering_data.clusters)

load_ligase_string = f"""set cartoon_side_chain_helper, on
fetch 7tpg
select chain_H, chain H
select chain_L, chain L
select chain_B, chain B
hide cartoon, chain_H
hide cartoon, chain_L
color grey, chain_B
select "cons_7tpg", resi 265 and chain_B or resi 191 and chain_B or resi 313 and chain_B
show licorice, cons_7tpg
color atomic, cons_7tpg
center
set_view (\
     0.129056588,   -0.914879322,   -0.382540226,\
    -0.931019366,    0.021019539,   -0.364364743,\
     0.341392726,    0.403177291,   -0.849059284,\
     0.000000000,    0.000000000, -203.904266357,\
   134.720489502,  144.012847900,  140.640121460,\
   160.759674072,  247.048858643,  -20.000000000 )\n
"""

load_model_string = f"""
load PDB, CLUSTER_ACC
color COLOR, CLUSTER_ACC
cealign ALIGN, CLUSTER_ACC\n
"""

show_conserved_residues_string = f"""show licorice, cons_ACC
color atomic, cons_ACC\n
"""

colors = ['teal', 'orange', 'green', 'br6']

script_string = load_ligase_string
for cluster in clusters:
    if cluster['size'] < 50:
        continue
    number = 0
    for acc in cluster['alphafold_models']:
        model_path = cluster['alphafold_models'][acc]['filepath']
        if number == 0:
            first_model_name = f"{cluster['name']}_{acc}"
            first_model = False
            script_string += load_model_string.replace("ACC", acc).replace("PDB", model_path).replace("CLUSTER", cluster['name'])\
                .replace("ALIGN", "7tpg").replace('COLOR', colors[number])
        else:
            script_string += load_model_string.replace("ACC", acc).replace("PDB", model_path).replace("CLUSTER", cluster['name'])\
                .replace("ALIGN", first_model_name).replace('COLOR', colors[number])
        positions = cluster['conserved_positions_af_models'][acc]
        for position in positions:
            script_string += f'label n. CA and resi {position} and {cluster["name"]}_{acc}, "%s-%s" % (resn, resi)\n'
        temp_string = f"select cons_{acc}, "
        for position in positions:
            temp_string += f"resi {position} and {cluster['name']}_{acc} or "
        script_string += temp_string[:-4] + '\n'
        script_string += show_conserved_residues_string.replace("ACC", acc).replace("CLUSTER", cluster['name']) + '\n'
        number += 1
script_string += "set label_position,(1,1,1)\n"
script_string += "set label_color,black\n"
script_string += "center \n"
script_string += "disable \n"
script_string += "bg_color white \n"

pymol_script_path = f"data/wzy/ssn-clusterings/{timestamp}/pymol-visualization.pml"
with open (pymol_script_path, 'w') as outfile:
    outfile.write(script_string)