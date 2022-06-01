import os
import sys

timestamp = sys.argv[1]

cluster_path = f"data/wzy/ssn-clusterings/{timestamp}/clusters"
for cluster in [f for f in os.listdir(cluster_path) if not f.startswith('.')]:
    logo_eps_path = f"{cluster_path}/{cluster}/sequences.logo.eps"
    logo_pdf_path = f"{cluster_path}/{cluster}/sequences.logo.pdf"
    command = f"ps2pdf {logo_eps_path} {logo_pdf_path}"
    print(command)
    os.system(command)