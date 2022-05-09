import os
import sys

timestamp = sys.argv[1]
chunk_number = 200

work_dir = f"/work3/idamei/ssn-clusterings/{timestamp}"
# Make blastdb
#os.system("export BLASTDB=/work3/garryg/blast/db")
os.system(f"$BLASTDB/../current/bin/makeblastdb -in {work_dir}/unique-hits.fasta -dbtype prot -parse_seqids")

# Chunkfastas
os.system(f"chunkfasta -c {chunk_number} unique-hits.fasta > chunkfasta.out")

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
$BLASTDB/../current/bin/blastp -db {work_dir}/unique-hits.fasta -query {work_dir}/run/CHUNK/sequences.fa -max_target_seqs 100000 -out {work_dir}/run/CHUNK/blast.out"""

submit_file = open(f"{work_dir}/submit.sh", 'w')
for i in range(chunk_number):
    chunk_name = f"chunk{str(i).zfill(3)}"
    fasta_path = f"{chunk_name}.fa"
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
