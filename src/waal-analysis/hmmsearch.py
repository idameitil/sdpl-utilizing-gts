import os

clades = [dir for dir in os.listdir("data/waal/clades") if not dir.startswith('.')]

clades_hmm = ["clade1", "clade2-1", "clade2-2"]

for clade in clades:
    for hmm_clade in clades_hmm:
        command = f"hmmsearch data/waal/clades/{hmm_clade}/{hmm_clade}.hmm data/waal/clades/{clade}/{clade}.fasta > data/waal/hmmsearch/{hmm_clade}_{clade}.out"
        os.system(command)