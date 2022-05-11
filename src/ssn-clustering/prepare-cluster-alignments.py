import os
import sys

timestamp = sys.argv[1]

hpc_directory = f'/work3/idamei/ssn-clusterings/clustering/{timestamp}/clusters'

jobscript=f"""#! /bin/sh 
### General options 
### -- specify queue -- 
#BSUB -q hpc
### -- set the job Name -- 
#BSUB -J CLUSTER
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
#BSUB -o {hpc_directory}/CLUSTER/jobscript.out
#BSUB -e {hpc_directory}/CLUSTER/jobscript.err
# here follow the commands you want to execute 
/work3/idamei/bin/muscle5.1.linux_intel64 -align {hpc_directory}/CLUSTER/sequences.fa -output {hpc_directory}/CLUSTER/sequences.afa
/work3/garryg/bioP/bin/malign.py -a {hpc_directory}/CLUSTER/sequences.afa > {hpc_directory}/CLUSTER/sequences.malign
python2 /work3/idamei/bin/seq2logo-2.1/Seq2Logo.py -f {hpc_directory}/CLUSTER/sequences.afa -o {hpc_directory}/CLUSTER/sequences.logo
"""

clusterdir = f"data/wzy/ssn-clusterings/clustering/{timestamp}/clusters"
clusters = os.listdir(clusterdir)
submit_file = open(f"data/wzy/ssn-clusterings/clustering/{timestamp}/submit.sh", "w")
for cluster in clusters:
    jobscript_name = f"{clusterdir}/{cluster}/jobscript.sh"
    outfile = open(jobscript_name, "w")
    outfile.write(jobscript.replace("CLUSTER", cluster))
    jobscript_path_hpc = f"{hpc_directory}/{cluster}/jobscript.sh"
    submit_file.write(f"bsub < {jobscript_path_hpc}\n")