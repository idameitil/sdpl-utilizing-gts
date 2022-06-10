from Bio import SeqIO
import pandas as pd
import sys
import os

timestamp = sys.argv[1]

string1 = f"""set cartoon_side_chain_helper, on
fetch 7tpg
select chain_H, chain H
select chain_L, chain L
select chain_B, chain B
hide cartoon, chain_H
hide cartoon, chain_L
color teal, chain_B
select "arg_7tpg", resi 242 and chain_B or resi 265 and chain_B or resi 191 and chain_B or resi 139 and chain_B
show licorice, arg_7tpg
color atomic, arg_7tpg
center
set_view (\
     0.129056588,   -0.914879322,   -0.382540226,\
    -0.931019366,    0.021019539,   -0.364364743,\
     0.341392726,    0.403177291,   -0.849059284,\
     0.000000000,    0.000000000, -203.904266357,\
   134.720489502,  144.012847900,  140.640121460,\
   160.759674072,  247.048858643,  -20.000000000 )"""

string2 = f"""
load PDB, CLUSTER_ACC
color silver, CLUSTER_ACC"""

string4 = f"""show licorice, cons_ACC
color atomic, cons_ACC
cealign 7tpg, CLUSTER_ACC
"""


def get_conserved_residues(df):
    """Gets conserved residues from MSA"""
    AAs_ignore = ['-', 'G', 'A', 'V', 'C', 'P', 'L', 'I', 'M', 'W', 'F']
    length = len(df)
    count_sequences = df.shape[1]
    conserved_residues = dict()
    for position in range(length):
        most_frequent_AA = df.iloc[position].mode().values
        if len(most_frequent_AA) == 1:
            count_most_frequent_AA = df.iloc[position].value_counts().max()
            freq_most_frequent_AA = (count_most_frequent_AA / count_sequences)
            if freq_most_frequent_AA > 0.97 and most_frequent_AA not in AAs_ignore:
                conserved_residues[position] = (most_frequent_AA[0], freq_most_frequent_AA)
    return conserved_residues

def get_specific_positions(accession):
    """Gets positions of conserved residues in a specific protein"""
    count = 0
    positions = dict()
    for index, AA in df[accession].iteritems():
        if AA != '-':
            count += 1
        if index in conserved_residues:
            positions[count] = conserved_residues[index]
    return positions

# Get list of all alphafold models
alphafold_dir = "data/wzy/alphafold"
selected_experiments = ["2201200806-polymerases_AlphaFold_batch1", "2202060002-wzy_100", "2205031317-wzy", "2205031317-wzy_missing"]
accession2path = dict()
for experiment in selected_experiments:
    path = f"{alphafold_dir}/{experiment}/af_out"
    models = [f for f in os.listdir(path) if not f.startswith('.')]
    for model in models:
        accession2path[model] = f"{path}/{model}/ranked_0.pdb"

# Banned alphafold models
banned_AF_models = ["EHX11459.1"]

# Main
cluster_dir = f"data/wzy/ssn-clusterings/{timestamp}/clusters"
clusters = [f for f in os.listdir(cluster_dir) if not f.startswith('.')]
# Pymol script
pymol_script_path = f"data/wzy/ssn-clusterings/{timestamp}/pymol-visualization.pml"
outfile = open(pymol_script_path, 'w')
outfile.write(string1 + '\n')
for cluster in clusters:
    cluster_size = int(cluster.split('_')[0])
    if cluster_size < 100:
        continue
    # Read fasta
    MSA_file = f"{cluster_dir}/{cluster}/sequences.afa"
    fasta_sequences = SeqIO.parse(open(MSA_file), 'fasta')
    data = dict()
    for fasta in fasta_sequences:
        data[fasta.id] = [char for char in str(fasta.seq)]
    df = pd.DataFrame(data)
    # Get conserved
    conserved_residues = get_conserved_residues(df)
    alphafold_accessions = [acc for acc in df.columns if acc in accession2path]
    # Get positions in alphafold models
    for alphafold_accession in alphafold_accessions:
        if alphafold_accession in banned_AF_models:
            continue
        positions = get_specific_positions(alphafold_accession)
        outfile.write(string2.replace("ACC", alphafold_accession).replace("PDB", accession2path[alphafold_accession]).replace("CLUSTER", cluster) + '\n')
        
        string3 = f"select cons_{alphafold_accession}, "
        for position in positions:
            string3 += f"resi {position} and {cluster}_{alphafold_accession} or "
        for position in positions:
            outfile.write(f'label n. CA and resi {position} and {cluster}_{alphafold_accession}, "%s-%s" % (resn, resi)\n')
        string3 = string3[:-4]
        outfile.write(string3 + '\n')

        outfile.write(string4.replace("ACC", alphafold_accession).replace("CLUSTER", cluster) + '\n')
        break # if we've found one successful AF model, we don't want to include more
outfile.write("set label_position,(1,1,1)\n")
outfile.write("set label_color,black\n")
outfile.write("center \n")
outfile.write("disable \n")
outfile.write("bg_color white \n")
outfile.close()