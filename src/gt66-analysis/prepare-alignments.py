
hpc_directory = f'/work3/idamei/gt66/subfamilies'

jobscript=f"""#! /bin/sh 
### General options 
### -- specify queue -- 
#BSUB -q hpc
### -- set the job Name -- 
#BSUB -J SUBFAMILY
### -- ask for number of cores (default: 1) -- 
#BSUB -n 1 
### -- specify that the cores must be on the same host -- 
#BSUB -R "span[hosts=1]"
### -- specify that we need 5GB of memory per core/slot -- 
#BSUB -R "rusage[mem=5GB]"
### -- specify that we want the job to get killed if it exceeds 5 GB per core/slot -- 
#BSUB -M 5GB
### -- set walltime limit: hh:mm -- 
#BSUB -W 5:00 
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
#BSUB -o {hpc_directory}/SUBFAMILY/jobscript.out
#BSUB -e {hpc_directory}/SUBFAMILY/jobscript.err
# here follow the commands you want to execute 
/work3/idamei/bin/muscle5.1.linux_intel64 -ALIGN_METHOD {hpc_directory}/SUBFAMILY/sequences.fa -output {hpc_directory}/SUBFAMILY/sequences.afa
/work3/garryg/bioP/bin/malign.py -a {hpc_directory}/SUBFAMILY/sequences.afa -l 1000 > {hpc_directory}/SUBFAMILY/sequences.malign
python2 /work3/idamei/bin/seq2logo-2.1/Seq2Logo.py -f {hpc_directory}/SUBFAMILY/sequences.afa -m 0.0001 -b 0 -o {hpc_directory}/SUBFAMILY/sequences.logo  -p 640x1000 -l 30  -I 1
/work3/idamei/bin/FastTree {hpc_directory}/SUBFAMILY/sequences.afa > {hpc_directory}/SUBFAMILY/sequences.nwk
"""

subfamily_folder = "data/gt66/subfamilies"
submit_file = open(f"{subfamily_folder}/submit.sh", "w")
for i in range(1, 8):
    subfamily = f"gt66_{i}"
    jobscript_name = f"{subfamily_folder}/{subfamily}/jobscript.sh"
    outfile = open(jobscript_name, "w")
    fasta_file = f"{subfamily_folder}/{subfamily}/sequences.fa"
    num_lines = sum(1 for line in open(fasta_file))
    if num_lines < 400:
        align_method = "align"
    else:
        align_method = "super5"
    outfile.write(jobscript.replace("SUBFAMILY", subfamily).replace("ALIGN_METHOD", align_method))
    jobscript_path_hpc = f"{hpc_directory}/{subfamily}/jobscript.sh"
    submit_file.write(f"bsub < {jobscript_path_hpc}\n")