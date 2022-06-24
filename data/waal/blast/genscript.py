#! /usr/bin/python3
'''
Description:
	Master script for generating many individual bsub submission scripts.
	For use on the HPC.

	What this script does:
	(A) reads a FASTA inputfile as a list of records, then
	(B) for each fasta record, creates (as needed*)
		run/{ACC}/ = output directory that will contain job input and output.
		run/{ACC}/query.fa = fasta file for the individual record, input to blast.
		run/{ACC}/blast.sh = shell script for running this one blast job.
	where {ACC} is the fasta accession number.
	*If the output directory already exists, the fasta record is skipped.

Usage:
	First edit this script to contain the correct input FASTA file, and HPC parameters.
	Then:
		genscript.py > submit.sh
		sh submit.sh

Notes:
	The 'cache' output directory tested in this script is not used, and can be ignored or removed.
	The directory /work3/garryg/blast contains world-readable blast databases and executables, and
	/work3/garryg/bioP contains a library of Garry's Python modules and methods.
'''

RUN = 'run'
CACHE = 'cache'
GROOT = '/work3/garryg/'

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
#BSUB -o {RUN}/ACC/jobscript.out
#BSUB -e {RUN}/ACC/jobscript.err
# here follow the commands you want to execute 
export BLASTDB={GROOT}/blast/db
$BLASTDB/../current/bin/blastp -db nr -max_target_seqs 100000 -query {RUN}/ACC/query.fa -out {RUN}/ACC/blast.out
"""

inputfile = "waal.fasta"

import sys
sys.path.append(f"{GROOT}/bioP/lib")
from Fasta import read_fasta

result = read_fasta(inputfile)
sys.stderr.write(f"inputfile {inputfile}\n")
sys.stderr.write(f"type result {type(result)}\n")
sys.stderr.write(f"len result {len(result)}\n")

import os
import hashlib

count = 0
expect = 500

for item in result:

	def acc(fasta):
		return fasta['acc']
	def seq(fasta):
		return fasta['seq']
	def seq_md5(fasta):
		return hashlib.md5(seq(fasta).upper().encode('utf-8')).hexdigest()
	def output_directory(fasta):
		return f"{RUN}/{acc(fasta)}"
	def output_name(fasta):
		return f"{output_directory(fasta)}/blast.out"
	def cache_directory(fasta):
		return f"{CACHE}/{seq_md5(fasta)}"
	def cache_name(fasta):
		return f"{cache_directory(fasta)}/blast.out"
	def skippable(fasta):
		''' decide whether record can be skipped,
			based entirely on fasta elements: acc, des, and seq,
			or values derived therefrom.
		'''
		if os.path.isdir(output_directory(fasta)):
			return True
		else:
			sys.stderr.write(f"DIAG output_directory does not exist\n")
		if os.path.isfile(output_name(fasta)):
			return True
		else:
			sys.stderr.write(f"DIAG output {output_name(fasta)} does not exist\n")
		if os.path.isfile(cache_name(fasta)):
			return True
		else:
			sys.stderr.write(f"DIAG cache {cache_name(fasta)} does not exist\n")
		''' ADD MORE REASONS HERE '''
		return False
	def write_query(fasta):
		filename = f"{output_directory(fasta)}/query.fa"
		with open(filename, 'w') as fp:
			fp.write(f">{acc(fasta)} {seq_md5(fasta)}\n{seq(fasta)}\n")
		fp.close()
		sys.stderr.write(f"Wrote to {filename}\n")
	def write_script(fasta):
		filename = f"{output_directory(fasta)}/blast.sh"
		with open(filename, 'w') as fp:
			cmd = blast.replace('ACC', acc(fasta))
			fp.write(f"{cmd}\n")
		fp.close()
		sys.stderr.write(f"Wrote to {filename}\n")
	def prepare_submit_script(fasta):
		if not os.path.isdir(output_directory(fasta)):
			os.makedirs(output_directory(fasta))
		write_query(fasta)
		write_script(fasta)
		print(f"bsub < {output_directory(fasta)}/blast.sh")

	# finally look at the listed item
	if skippable(item):
		continue
	sys.stderr.write(f"NOT SKIPPABLE {count} {item}\n")
	count += 1
	if count >= expect:
		sys.stderr.write(f"COUNT {count} TERMINATION\n")
		break

	prepare_submit_script(item)
