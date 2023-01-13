#! /bin/sh 
### General options 
### -- specify queue -- 
#BSUB -q hpc
### -- set the job Name -- 
#BSUB -J 0221_4
### -- ask for number of cores (default: 1) -- 
#BSUB -n 1
### -- specify that the cores must be on the same host -- 
#BSUB -R "span[hosts=1]"
### -- specify that we need 5GB of memory per core/slot -- 
#BSUB -R "rusage[mem=20GB]"
### -- specify that we want the job to get killed if it exceeds 5 GB per core/slot -- 
#BSUB -M 20GB
### -- set walltime limit: hh:mm -- 
#BSUB -W 4:00 
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
#BSUB -o /work3/idamei/wzy/ssn-clusterings/2210171613/superclusterings/2210191051/superclusters/0221_4/jobscript-genbank-search.out
#BSUB -e /work3/idamei/wzy/ssn-clusterings/2210171613/superclusterings/2210191051/superclusters/0221_4/jobscript-genbank-search.err
# here follow the commands you want to execute 
/work3/idamei/bin/bin/hmmsearch /work3/idamei/wzy/ssn-clusterings/2210171613/superclusterings/2210191051/superclusters/0221_4/0221_4.accs_pruned-mafft.hmm /work3/garryg/blast/db-/genbank.fa > /work3/idamei/wzy/ssn-clusterings/2210171613/superclusterings/2210191051/superclusters/0221_4/0221_4.accs_pruned-mafft-genbank-search.out
