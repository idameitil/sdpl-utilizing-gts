# To be run on the HPC
import os
import sys
sys.path.append("/work3/idamei")
from modules.write_jobscript import write_jobscript

input_fasta = sys.argv[1]
enzyme_family = sys.argv[2]

chunk_number = 200

hpc_directory = f"/work3/idamei/{enzyme_family}/all-vs-all-blast"
if not os.path.isdir(hpc_directory):
    os.makedirs(hpc_directory)

# Make blastdb
command = f"$BLASTDB/../current/bin/makeblastdb -in {input_fasta} -dbtype prot -parse_seqids"
s = os.system(command)
if s != 0:
    raise Exception(f'Failure in os.system {command}.')

# Chunkfastas
command = f"chunkfasta -c {chunk_number} -f {hpc_directory}/chunk%03d.fa {input_fasta} > {hpc_directory}/chunkfasta.out"
s = os.system(command)
if s != 0:
    raise Exception(f'Failure in os.system {command}.')

if not os.path.isdir(f"{hpc_directory}/run"):
    os.makedirs(f"{hpc_directory}/run/")

# Write jobscript
with open(f"{hpc_directory}/submit.sh", 'w') as submit_file:
    for i in range(chunk_number):
        chunk_name = f"chunk{str(i).zfill(3)}"
        fasta_path = f"{hpc_directory}/{chunk_name}.fa"
        outdir = f"{hpc_directory}/run/{chunk_name}/"
        if not os.path.isdir(outdir):
            os.makedirs(outdir)
        os.system(f"mv {fasta_path} {outdir}sequences.fa")

        commands = f"""export BLASTDB=/work3/garryg/blast/db
    $BLASTDB/../current/bin/blastp -db {input_fasta} -query {hpc_directory}/run/{chunk_name}/sequences.fa -max_target_seqs 100000 -out {hpc_directory}/run/{chunk_name}/blast.out"""

        jobscript_name = f"{hpc_directory}/run/{chunk_name}/jobscript.sh"
        write_jobscript(script_path=jobscript_name, jobname=chunk_name, no_gb=20, no_hours=72, 
            output_file=f"{hpc_directory}/run/{chunk_name}/jobscript.out", 
            error_file=f"{hpc_directory}/run/{chunk_name}/jobscript.err", 
            commands=commands)

        submit_file.write(f"bsub < {jobscript_name}\n")
