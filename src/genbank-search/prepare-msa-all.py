import sys
sys.path.append("src")
from modules.write_jobscript import write_jobscript

enzyme_family = sys.argv[1]

hpc_directory = f"/work3/idamei/{enzyme_family}/MSA_CAZy_family"
local_directory = f"data/{enzyme_family}/MSA_CAZy_family"

if enzyme_family == 'waal':
    filename_core = "hits-6e-23-cdhit99"
elif enzyme_family == 'eca-pol':
    filename_core = "hits-1e-40-cdhit99"

commands = f"""/work3/idamei/bin/muscle5.1.linux_intel64 -super5 {hpc_directory}/{filename_core}.fa -output {hpc_directory}/{filename_core}.afa
/work3/idamei/bin/FastTree {hpc_directory}/{filename_core}.afa > {hpc_directory}/{filename_core}.nwk
python2 /work3/idamei/bin/seq2logo-2.1/Seq2Logo.py -f {hpc_directory}/{filename_core}.afa -m 0.0001 -b 0 -o {hpc_directory}/{filename_core}.logo  -p 640x1000 -l 30  -I 1
"""

jobscript_name = f"{local_directory}/jobscript.sh"
write_jobscript(script_path=jobscript_name, jobname=f"MSA_{enzyme_family}", no_gb=5, no_hours=10, 
    output_file=f"{hpc_directory}/jobscript.out", 
    error_file=f"{hpc_directory}/jobscript.err", 
    commands=commands)