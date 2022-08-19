from Bio import SeqIO

seed_fasta = "data/waal/waal.fasta"
seed_sequences = SeqIO.parse(open(seed_fasta), 'fasta')

hits_include_fasta = "data/waal/blast/unique-hits-short-headers-1e-15-filtered-cdhit99.fasta"
hit_sequences = SeqIO.parse(open(hits_include_fasta), 'fasta')

banned_filename = "data/waal/banned"
with open(banned_filename, 'r') as banned_file:
    banned = set()
    for line in banned_file:
        banned.add(line.strip())

outdir = "data/waal/MSA-logo"

out_fasta_filename = f"{outdir}/seeds-and-hits.fasta"
with open(out_fasta_filename, 'w') as outfile:
    accessions_done = set()
    lengths = []
    for entry in hit_sequences:
        if entry.id not in banned:
            outfile.write(f">{entry.id}\n{entry.seq}\n")
            accessions_done.add(entry.id)
    for entry in seed_sequences:
        if entry.id not in accessions_done:
            outfile.write(f">{entry.id}\n{entry.seq}\n")

hpc_directory = f'/work3/idamei/waal/MSA-logo'

jobscript_string = f"""#! /bin/sh 
### General options 
### -- specify queue -- 
#BSUB -q hpc
### -- set the job Name -- 
#BSUB -J waal-MSA-logo
### -- ask for number of cores (default: 1) -- 
#BSUB -n 1 
### -- specify that the cores must be on the same host -- 
#BSUB -R "span[hosts=1]"
### -- specify that we need 5GB of memory per core/slot -- 
#BSUB -R "rusage[mem=5GB]"
### -- specify that we want the job to get killed if it exceeds 5 GB per core/slot -- 
#BSUB -M 5GB
### -- set walltime limit: hh:mm -- 
#BSUB -W 10:00 
### -- set the email address -- 
# please uncomment the following line and put in your e-mail address,
# if you want to receive e-mail notifications on a non-default address
#BSUB -u idamei@dtu.dk
### -- send notification at start -- 
#BSUB -B 
### -- send notification at completion -- 
#BSUB -N 
### -- Specify the output and error file. %J is the job-id -- 
### -- -o and -e mean append, -oo and -eo mean overwrite -- 
#BSUB -o {hpc_directory}/MSA-logo.out
#BSUB -e {hpc_directory}/MSA-logo.out
# here follow the commands you want to execute 
/work3/idamei/bin/muscle5.1.linux_intel64 -super5 {hpc_directory}/seeds-and-hits.fasta -output {hpc_directory}/seeds-and-hits.afa
/work3/garryg/bioP/bin/malign.py -a {hpc_directory}/seeds-and-hits.afa -l 1000 > {hpc_directory}/seeds-and-hits.malign
python2 /work3/idamei/bin/seq2logo-2.1/Seq2Logo.py -f {hpc_directory}/seeds-and-hits.afa -m 0.0001 -b 0 -o {hpc_directory}/seeds-and-hits.logo  -p 640x1000 -l 30  -I 1
/work3/idamei/bin/FastTree {hpc_directory}/seeds-and-hits.afa > {hpc_directory}/seeds-and-hits.nwk
"""

jobscript_name = f"{outdir}/MSA-logo.sh"
with open(jobscript_name, 'w') as outfile:
    outfile.write(jobscript_string)