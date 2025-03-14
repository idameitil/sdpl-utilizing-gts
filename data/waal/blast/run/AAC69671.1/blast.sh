#! /bin/sh 
### General options 
### -- specify queue -- 
#BSUB -q hpc
### -- set the job Name -- 
#BSUB -J blast_AAC69671.1
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
#BSUB -o run/AAC69671.1/jobscript.out
#BSUB -e run/AAC69671.1/jobscript.err
# here follow the commands you want to execute 
export BLASTDB=/work3/garryg//blast/db
$BLASTDB/../current/bin/blastp -db nr -max_target_seqs 100000 -query run/AAC69671.1/query.fa -out run/AAC69671.1/blast.out

