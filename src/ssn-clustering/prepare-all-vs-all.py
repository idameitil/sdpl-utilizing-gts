import os
import sys
import shutil

timestamp = sys.argv[1]
chunk_number = 200

work_dir = f"/work3/idamei/ssn-clusterings/{timestamp}"

# Make fasta with unique hits and seeds

unique_hits_file = open(f'{work_dir}/unique-hits-short-headers.fasta')
accessions_hits = set()
for line in unique_hits_file:
    if line.startswith('>'):
        accessions_hits.add(line.split(' ')[0][1:])
        
shutil.copy(f'{work_dir}/unique-hits-short-headers.fasta', f'{work_dir}/seeds-and-unique-hits.fasta')
seeds_and_unique_hits_file = open(f'{work_dir}/seeds-and-unique-hits.fasta', 'a')
seed_fasta = open(f'{work_dir}/wzy.fasta')
for line in seed_fasta:
    if line.startswith('>'):
        accession = line.strip()[1:]
        if accession not in accessions_hits:
            new = True
            seeds_and_unique_hits_file.write(line)
        else:
            new = False
    else:
        if new:
            seeds_and_unique_hits_file.write(line)
seeds_and_unique_hits_file.close()

# Make blastdb
command = f"$BLASTDB/../current/bin/makeblastdb -in {work_dir}/seeds-and-unique-hits.fasta -dbtype prot -parse_seqids"
s = os.system(command)
if s != 0:
    raise Exception(f'Failure in os.system {command}.')

# Chunkfastas
command = f"chunkfasta -c {chunk_number} -f {work_dir}/chunk%03d.fa {work_dir}/seeds-and-unique-hits.fasta > {work_dir}/chunkfasta.out"
s = os.system(command)
if s != 0:
    raise Exception(f'Failure in os.system {command}.')

# Make run folder with jobscripts
if not os.path.isdir(f"{work_dir}/run"):
    os.makedirs(f"{work_dir}/run/")

jobscript = f"""#! /bin/sh 
### General options 
### -- specify queue -- 
#BSUB -q hpc
### -- set the job Name -- 
#BSUB -J CHUNK
### -- ask for number of cores (default: 1) -- 
#BSUB -n 1 
### -- specify that the cores must be on the same host -- 
#BSUB -R "span[hosts=1]"
### -- specify that we need 2GB of memory per core/slot -- 
#BSUB -R "rusage[mem=20GB]"
### -- specify that we want the job to get killed if it exceeds 3 GB per core/slot -- 
#BSUB -M 20GB
### -- set walltime limit: hh:mm -- 
#BSUB -W 72:00 
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
#BSUB -o {work_dir}/run/CHUNK/jobscript.out
#BSUB -e {work_dir}/run/CHUNK/jobscript.err
# here follow the commands you want to execute 
export BLASTDB=/work3/garryg/blast/db
$BLASTDB/../current/bin/blastp -db {work_dir}/seeds-and-unique-hits.fasta -query {work_dir}/run/CHUNK/sequences.fa -max_target_seqs 100000 -out {work_dir}/run/CHUNK/blast.out"""

submit_file = open(f"{work_dir}/submit.sh", 'w')
for i in range(chunk_number):
    chunk_name = f"chunk{str(i).zfill(3)}"
    fasta_path = f"{work_dir}/{chunk_name}.fa"
    outdir = f"{work_dir}/run/{chunk_name}/"
    if not os.path.isdir(outdir):
        os.makedirs(outdir)
    os.system(f"mv {fasta_path} {outdir}sequences.fa")
    jobscript_path = f"{work_dir}/run/{chunk_name}/jobscript.sh"
    outfile = open(jobscript_path, "w")
    outfile.write(jobscript.replace("CHUNK", chunk_name))
    outfile.close()
    submit_file.write(f"bsub < {jobscript_path}\n")
submit_file.close()
