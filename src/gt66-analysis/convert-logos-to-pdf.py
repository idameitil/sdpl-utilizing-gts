import os
import sys

subfamily_path = f"data/gt66/subfamilies"
for i in range(1, 8):
    subfamily = f"gt66_{i}"
    logo_eps_path = f"{subfamily_path}/{subfamily}/sequences.logo.eps"
    logo_pdf_path = f"{subfamily_path}/{subfamily}/sequences.logo.pdf"
    command = f"ps2pdf -dEPSCrop {logo_eps_path} {logo_pdf_path}"
    os.system(command)