def write_jobscript(script_path, jobname, no_gb, no_hours, output_file, error_file, commands, no_cores=1):
    jobscript = f"""#! /bin/sh 
### General options 
### -- specify queue -- 
#BSUB -q hpc
### -- set the job Name -- 
#BSUB -J {jobname}
### -- ask for number of cores (default: 1) -- 
#BSUB -n {no_cores}
### -- specify that the cores must be on the same host -- 
#BSUB -R "span[hosts=1]"
### -- specify that we need 5GB of memory per core/slot -- 
#BSUB -R "rusage[mem={no_gb}GB]"
### -- specify that we want the job to get killed if it exceeds 5 GB per core/slot -- 
#BSUB -M {no_gb}GB
### -- set walltime limit: hh:mm -- 
#BSUB -W {no_hours}:00 
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
#BSUB -o {output_file}
#BSUB -e {error_file}
# here follow the commands you want to execute 
{commands}
"""
    with open(script_path, 'w') as outfile:
        outfile.write(jobscript)

