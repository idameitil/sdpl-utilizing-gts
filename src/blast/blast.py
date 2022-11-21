import sys
GROOT = '/work3/garryg/'
sys.path.append(f"{GROOT}/bioP/lib")
from Fasta import read_fasta
import os
import hashlib
sys.path.append('/work3/idamei/src/modules')
from write_jobscript import write_jobscript

enzyme_family = sys.argv[1]

blast_dir = f"/work3/idamei/{enzyme_family}/blast"

run_dir = f"{blast_dir}/run"
CACHE = 'cache'
submit_filename = f"{blast_dir}/submit.sh"
# Remove old jobs from submit file
open(submit_filename, 'w').close()

def seq_md5(fasta):
	return hashlib.md5(fasta['seq'].upper().encode('utf-8')).hexdigest()
def output_directory(fasta):
	return f"{run_dir}/{fasta['acc']}"
def output_name(fasta):
	return f"{output_directory(fasta)}/blast.out"
def query_fasta_filename(fasta):
	return f"{output_directory(fasta)}/query.fa"
def cache_directory(fasta):
	return f"{CACHE}/{seq_md5(fasta)}"
def cache_name(fasta):
	return f"{cache_directory(fasta)}/blast.out"
def skippable(fasta):
	if os.path.isdir(output_directory(fasta)):
		return True
	else:
		sys.stderr.write(f"output_directory does not exist\n")
	if os.path.isfile(output_name(fasta)):
		return True
	else:
		sys.stderr.write(f"output {output_name(fasta)} does not exist\n")
	if os.path.isfile(cache_name(fasta)):
		return True
	else:
		sys.stderr.write(f"cache {cache_name(fasta)} does not exist\n")
	return False
def write_query_fasta(fasta):
	with open(query_fasta_filename(fasta), 'w') as fp:
		fp.write(f">{fasta['acc']} {seq_md5(fasta)}\n{fasta['seq']}\n")
# def write_jobscript(fasta):
# 	filename = f"{output_directory(fasta)}/blast.sh"
# 	with open(filename, 'w') as fp:
# 		cmd = blast.replace('ACC', fasta['acc'])
# 		fp.write(f"{cmd}\n")
def prepare_submit(fasta):
	if not os.path.isdir(output_directory(fasta)):
		os.makedirs(output_directory(fasta))
	write_query_fasta(fasta)
	# write_jobscript(fasta)

	commands = f"""export BLASTDB={GROOT}/blast/db
$BLASTDB/../current/bin/blastp -db nr -max_target_seqs 100000 -query {query_fasta_filename(fasta)} -out {output_name(fasta)}
"""
	write_jobscript(script_path=f"{output_directory(fasta)}/blast.sh",
					jobname=f"blast_{fasta['acc']}", no_gb=20, no_hours=10,
					output_file=f"{run_dir}/{fasta['acc']}/jobscript.out",
					error_file=f"{run_dir}/{fasta['acc']}/jobscript.err",
					commands=commands)

	with open(submit_filename, 'a') as submit_file:
		submit_file.write(f"bsub < {output_directory(fasta)}/blast.sh")

# The string 'ACC' in this blast string will be substituted by a Fasta accession.
blast=f"""#! /bin/sh 
### General options 
### -- specify queue -- 
#BSUB -q hpc
### -- set the job Name -- 
#BSUB -J blast_ACC
### -- ask for number of cores (default: 1) -- 
#BSUB -n 1 
### -- specify that the cores must be on the same host -- 
#BSUB -R "span[hosts=1]"
### -- specify that we need 20GB of memory per core/slot -- 
#BSUB -R "rusage[mem=20GB]"
### -- specify that we want the job to get killed if it exceeds 3 GB per core/slot -- 
#BSUB -M 20GB
### -- set walltime limit: hh:mm -- 
#BSUB -W 24:00 
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
#BSUB -o {run_dir}/ACC/jobscript.out
#BSUB -e {run_dir}/ACC/jobscript.err
# here follow the commands you want to execute 
export BLASTDB={GROOT}/blast/db
$BLASTDB/../current/bin/blastp -db nr -max_target_seqs 100000 -query {run_dir}/ACC/query.fa -out {run_dir}/ACC/blast.out
"""

inputfile = f"{blast_dir}/{enzyme_family}.fasta"

result = read_fasta(inputfile)

count = 0
expect = 500

for item in result:

	if skippable(item):
		continue
	sys.stderr.write(f"NOT SKIPPABLE {count} {item}\n")
	count += 1
	if count >= expect:
		sys.stderr.write(f"COUNT {count} TERMINATION\n")
		break

	prepare_submit(item)