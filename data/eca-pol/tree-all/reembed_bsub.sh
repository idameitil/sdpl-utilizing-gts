#! /bin/sh 
### General options 
### -- specify queue -- 
#BSUB -q hpc
### -- set the job Name -- 
#BSUB -J reembed
### -- ask for number of cores (default: 1) -- 
#BSUB -n 1 
### -- specify that the cores must be on the same host -- 
#BSUB -R "span[hosts=1]"
### -- specify that we need 10GB of memory per core/slot -- 
#BSUB -R "rusage[mem=10GB]"
### -- specify that we want the job to get killed if it exceeds 20GB per core/slot -- 
#BSUB -M 20GB
### -- set walltime limit: hh:mm -- 
#BSUB -W 48:00 
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
#BSUB -o reembed_bsub.out
#BSUB -e reembed_bsub.err 
# here follow the commands you want to execute 
export BIA=/work3/garryg/bioC
$BIA/bin/x86_64/reembed -o my.tree my.dmx
