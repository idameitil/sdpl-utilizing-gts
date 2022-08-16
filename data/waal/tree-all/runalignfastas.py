#! /usr/bin/python3

# Generate N*(N+1)/2 jobs to submit for doing pairwise chunkNN.fa x chunkNN.fa

N = 10

# Usage: genscript.py > submit.sh

# then 'sh submit.sh'

single = """#! /bin/sh 
### General options 
### -- specify queue -- 
#BSUB -q hpc
### -- set the job Name -- 
#BSUB -J Alfa_AA
### -- ask for number of cores (default: 1) -- 
#BSUB -n 4 
### -- specify that the cores must be on the same host -- 
#BSUB -R "span[hosts=1]"
### -- specify that we need 2GB of memory per core/slot -- 
#BSUB -R "rusage[mem=2GB]"
### -- specify that we want the job to get killed if it exceeds 3 GB per core/slot -- 
#BSUB -M 3GB
### -- set walltime limit: hh:mm -- 
#BSUB -W 24:00 
### -- set the email address -- 
# please uncomment the following line and put in your e-mail address,
# if you want to receive e-mail notifications on a non-default address
#BSUB -u garryg@dtu.dk
### -- send notification at start -- 
#BSUB -B 
### -- send notification at completion -- 
#BSUB -N 
### -- Specify the output and error file. %J is the job-id -- 
### -- -o and -e mean append, -oo and -eo mean overwrite -- 
#BSUB -o run/alignfastas_AA_AA.out 
#BSUB -e run/alignfastas_AA_AA.err 
# here follow the commands you want to execute 
export BIA=/work3/garryg/bioC
$BIA/bin/x86_64/alignfastas chunkAA.fa
"""

pairwise = """#! /bin/sh 
### General options 
### -- specify queue -- 
#BSUB -q hpc
### -- set the job Name -- 
#BSUB -J Alfa_AA_BB
### -- ask for number of cores (default: 1) -- 
#BSUB -n 4 
### -- specify that the cores must be on the same host -- 
#BSUB -R "span[hosts=1]"
### -- specify that we need 2GB of memory per core/slot -- 
#BSUB -R "rusage[mem=2GB]"
### -- specify that we want the job to get killed if it exceeds 3 GB per core/slot -- 
#BSUB -M 3GB
### -- set walltime limit: hh:mm -- 
#BSUB -W 24:00 
### -- set the email address -- 
# please uncomment the following line and put in your e-mail address,
# if you want to receive e-mail notifications on a non-default address
#BSUB -u garryg@dtu.dk
### -- send notification at start -- 
#BSUB -B 
### -- send notification at completion -- 
#BSUB -N 
### -- Specify the output and error file. %J is the job-id -- 
### -- -o and -e mean append, -oo and -eo mean overwrite -- 
#BSUB -o run/alignfastas_AA_BB.out 
#BSUB -e run/alignfastas_AA_BB.err 
# here follow the commands you want to execute 
export BIA=/work3/garryg/bioC
$BIA/bin/x86_64/alignfastas -inter chunkAA.fa chunkBB.fa
"""

import re

for i in range(0, N):
	# 'diagonal' elements of alignment matrix
	cmd = single.replace('AA', '%02d' % i)
	script = "run/alignfastas_%02d_%02d.sh" % ( i, i )
	with open(script, 'w') as fp:
		fp.write(cmd)
	print(f"bsub < {script}")
	# off-diagonal elements
	for j in range(i+1, N):
		cmd = pairwise.replace('AA', '%02d' % i).replace('BB', '%02d' % j)
		script = "run/alignfastas_%02d_%02d.sh" % ( i, j )
		with open(script, 'w') as fp:
			fp.write(cmd)
		print(f"bsub < {script}")
