#! /bin/sh 
### General options 
### -- specify queue -- 
#BSUB -q hpc
### -- set the job Name -- 
#BSUB -J 0002_171
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
#BSUB -o /work3/idamei/ssn-clusterings/clustering/2205111339/clusters/0002_171/jobscript.out
#BSUB -e /work3/idamei/ssn-clusterings/clustering/2205111339/clusters/0002_171/jobscript.err
# here follow the commands you want to execute 
/work3/idamei/bin/muscle5.1.linux_intel64 -align /work3/idamei/ssn-clusterings/clustering/2205111339/clusters/0002_171/sequences.fa -output /work3/idamei/ssn-clusterings/clustering/2205111339/clusters/0002_171/sequences.afa
/work3/garryg/bioP/bin/malign.py -a /work3/idamei/ssn-clusterings/clustering/2205111339/clusters/0002_171/sequences.afa > /work3/idamei/ssn-clusterings/clustering/2205111339/clusters/0002_171/sequences.malign
python2 /work3/idamei/bin/seq2logo-2.1/Seq2Logo.py -f /work3/idamei/ssn-clusterings/clustering/2205111339/clusters/0002_171/sequences.afa -o /work3/idamei/ssn-clusterings/clustering/2205111339/clusters/0002_171/sequences.logo
