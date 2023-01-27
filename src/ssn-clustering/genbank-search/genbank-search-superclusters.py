import sys
sys.path.append("src")
from modules.write_jobscript import write_jobscript

# superclusters = ["0221_4", "0118_1_30", "0128_1_29", "0134_4_6", "0141_1_28", "0144_2_14", "0260_4_5", "0284_3_9", "0342_13_2", "0540_8_3"]
superclusters = ['0221_4']

local_dir = f"data/wzy/ssn-clusterings/2210171613/superclusterings/2210191051/"

with open(f"{local_dir}/submit-genbank-search.sh", 'w') as submit_file:

    for supercluster in superclusters:
        hpc_dir = f"/work3/idamei/wzy/ssn-clusterings/2210171613/superclusterings/2210191051/superclusters/{supercluster}"

        commands = f"""/work3/idamei/bin/bin/hmmsearch {hpc_dir}/{supercluster}.accs_pruned-mafft.hmm /work3/garryg/blast/db-/genbank.fa > {hpc_dir}/{supercluster}.accs_pruned-mafft-genbank-search.out"""

        jobscript_local_path = f"{local_dir}/superclusters/{supercluster}/jobscript-genbank-search.sh"
        write_jobscript(script_path=jobscript_local_path, jobname=supercluster, no_gb=20, no_hours=4, 
            output_file=f"{hpc_dir}/jobscript-genbank-search.out", 
            error_file=f"{hpc_dir}/jobscript-genbank-search.err", 
            commands=commands)

        jobscript_hpc_path = f"{hpc_dir}/jobscript-genbank-search.sh"
        submit_file.write(f"bsub < {jobscript_hpc_path}\n")
