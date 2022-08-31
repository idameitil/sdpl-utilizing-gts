import sys
sys.path.append("src")
from modules.write_jobscript import write_jobscript
import os

timestamp = sys.argv[1]

hpc_directory = f'/work3/idamei/wzy/ssn-clusterings/{timestamp}/clusters'

clusterdir = f"data/wzy/ssn-clusterings/{timestamp}/clusters"
submit_script = ""
clusters = [f for f in os.listdir(clusterdir) if not f.startswith('.')]
for cluster in clusters:
    
    fasta_file = f"{clusterdir}/{cluster}/sequences.fa"
    num_lines = sum(1 for line in open(fasta_file, 'r'))
    if num_lines < 400:
        align_method = "align"
    else:
        align_method = "super5"
    
    commands = f"""/work3/idamei/bin/muscle5.1.linux_intel64 -{align_method} {hpc_directory}/{cluster}/sequences.fa -output {hpc_directory}/{cluster}/sequences.afa
/work3/garryg/bioP/bin/malign.py -a {hpc_directory}/{cluster}/sequences.afa -s {hpc_directory}/{cluster}/seeds.txt -l 1000 > {hpc_directory}/{cluster}/sequences.malign
python2 /work3/idamei/bin/seq2logo-2.1/Seq2Logo.py -f {hpc_directory}/{cluster}/sequences.afa -m 0.0001 -b 0 -o {hpc_directory}/{cluster}/sequences.logo  -p 640x1000 -l 30  -I 1
/work3/idamei/bin/FastTree {hpc_directory}/{cluster}/sequences.afa > {hpc_directory}/{cluster}/sequences.nwk"""

    jobscript_name = f"{clusterdir}/{cluster}/jobscript.sh"
    write_jobscript(script_path=jobscript_name, jobname=cluster, no_gb=5, no_hours=10, 
        output_file=f"{hpc_directory}/{cluster}/jobscript.out", 
        error_file=f"{hpc_directory}/{cluster}/jobscript.err", 
        commands=commands)
    
    jobscript_path_hpc = f"{hpc_directory}/{cluster}/jobscript.sh"
    submit_script += f"bsub < {jobscript_path_hpc}\n"

with open(f"data/wzy/ssn-clusterings/{timestamp}/submit.sh", "w") as submit_file:
    submit_file.write(submit_script)