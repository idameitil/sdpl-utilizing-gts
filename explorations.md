## GT66 analysis

### Complete family analysis
`data/gt66/GT66.fasta` was received from Bernard.

To filter based on length and allowed characters, run `python src/data-collection-and-preprocessing/filter-gt66.py`.

To run CD-HIT: `cd-hit -i data/gt66/GT66-filtered.fasta -o data/gt66/GT66-filtered-cdhit99.fasta -c 0.99`.

Then transfer to the HPC: `scp data/gt66/GT66-filtered-cdhit99.fasta idamei@transfer.gbar.dtu.dk:/work3/idamei/gt66/`.

To make the MSA, run on the HPC `qrsh` and `muscle -super5 /work3/idamei/gt66/GT66-filtered-cdhit99.fasta -output /work3/idamei/gt66/GT66-filtered-cdhit99.afa`

To make the logoplot, run on the HPC (still with qrsh) `python2 /work3/idamei/bin/seq2logo-2.1/Seq2Logo.py -f /work3/idamei/gt66/GT66-filtered-cdhit99.afa -m 0.0001 -b 0 -o /work3/idamei/gt66/logo/GT66-filtered-cdhit99.logo  -p 640x1000 -l 30  -I 1`

`scp idamei@transfer.gbar.dtu.dk:/work3/idamei/gt66/GT66-filtered-cdhit99.afa data/gt66/`

`scp -r idamei@transfer.gbar.dtu.dk:/work3/idamei/gt66/logo data/gt66/`

Convert logos to pdf: `ps2pdf -dEPSCrop data/gt66/logo/GT66-filtered-cdhit99.logo.eps data/gt66/GT66.logo.pdf`

### Subfamily analysis
To prepare for alignments and logoplots, run: `python src/gt66-analysis/prepare-alignments.py`

Then copy to the HPC: `scp -r data/gt66/subfamilies idamei@transfer.gbar.dtu.dk:/work3/idamei/gt66/`

On the HPC, run `sh /work3/idamei/gt66/subfamilies/submit.sh`

When all jobs are finished, download the results: `scp -r idamei@transfer.gbar.dtu.dk:/work3/idamei/gt66/subfamilies data/gt66/`

Then convert the logos to pdf: `python src/gt66-analysis/convert-logos-to-pdf.py`