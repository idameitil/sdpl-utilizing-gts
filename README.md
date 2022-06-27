# Analysis of O-antigen synthesis enzymes

## Collecting data and preprocessing

Manually curated Wzys from papers are added to `data/selected-wzys.tsv`.

The DNA records for the Wzys were downloaded manually using NCBI batch entry (https://www.ncbi.nlm.nih.gov/sites/batchentrez) (Click “Send to:”, "Complete Record", "GenBank (full)"). They are stored in `data/selected_OAGCs.gb` (Some are O-antigen gene clusters, some are whole genome sequences). This file is too big to store in GitHub, and is just stored locally.

### Enriching Wzy table with sugars and taxonomy
To enrich the selected wzys with csdb sugars and taxonomy run `python src/data-collection-and-preprocessing/enrich-wzys.py`

This will create the file `data/wzy/wzy.tsv`

### Downloading CSDB images
In order to download new CSDB images, run `python src/data-collection-and-preprocessing/download-csdb-images.py`

### Retrieving Wzxs, Wzzs and WaaLs
To retrieve the Wzx, Wzz and Waal entries run `python src/data-collection-and-preprocessing/retrieve-wzx-wzz-and-waal.py`

This will create the files `data/wzx/wzx.tsv`, `data/wzz/wzz.tsv` and `data/waal/waal.tsv`

### Making fasta files
To generate fasta files run `python3 src/data-collection-and-preprocessing/make-fastas.py`

This will create the files `data/wzx.fasta`, `data/wzy.fasta` and `data/wzz.fasta`

### Expanding with Blast
Copy fasta file with entries that need to be blasted to `/work3/idamei/wzy/blast/` on the HPC.

On the HPC: `cd /work3/idamei/wzy/blast`

Change inputfile to the name of the fasta in: `genscript.py`

Then run `genscript.py > submit.sh`

Check the generated folders in `run`and then run `sh submit.sh`

When all jobs have finished, download the data: `scp -r idamei@transfer.gbar.dtu.dk:/work3/idamei/wzy/blast data/wzy/`

For Wzx, Wzz and WaaL, it is the same procedure, just `/work3/idamei/waal/blast/`

### Parsing Blast results
To parse the blast expansion output files run `python3 src/data-collection-and-preprocessing/parse-blast-results.py [protein-family]`. Where `protein-family` is `wzy`, `wzx`, `wzz`, or `waal`.

This will create the file `data/[protein-family]/blast/unique-hits.tsv` which contains a list of the hit accessions and their best e-values.

### Retrieving Blast hit data
To retrieve the sequence and taxid for the blast hits, run:
`scp data/wzy/blast/unique-hits.tsv idamei@transfer.gbar.dtu.dk:/work3/idamei/wzy/blast/`

Then, on the HPC run:
`qrsh`

`blastdbcmd -db nr -entry_batch /work3/idamei/wzy/blast/unique-hits.tsv > /work3/idamei/wzy/blast/unique-hits.fasta`

`blastdbcmd -db nr -entry_batch /work3/idamei/wzy/blast/unique-hits.tsv -outfmt "%a ,%L ,%T ,%t ,%s" > /work3/idamei/wzy/blast/unique-hits.csv` 

Then locally run:
`scp idamei@transfer.gbar.dtu.dk:/work3/idamei/wzy/blast/unique-hits.fasta data/wzy/blast/`

`scp idamei@transfer.gbar.dtu.dk:/work3/idamei/wzy/blast/unique-hits.csv data/wzy/blast/`

`data/wzy/blast/unique-hits.fasta` is a fasta file with exactly the entries in `data/wzy/blast/unique-hits.tsv`.

`data/wzy/blast/unique-hits.csv` is a csv file containing taxids along with other info. It also includes identical sequences and therefore has more lines than `data/wzy/blast/unique-hits.tsv`.

To generate fasta with short headers, run: `sed 's/ >.*$//' data/wzy/blast/unique-hits.fasta > data/wzy/blast/unique-hits-short-headers.fasta`

### Make nodes file
Run `python src/data-collection-and-preprocessing/make-nodes-file.py`. 

This will generate the file `data/wzy/seeds-and-hits.tsv`.

### Filtering and redundancy reducing Blast hits
To filter blast hits by length and perform redundancy reduction with cd-hit run: `python3 src/data-collection-and-preprocessing/filter-blast-hits.py`.

This will create the files `data/wzy/blast/unique-hits-min320max600.fasta` and `data/wzy/blast/unique-hits-min320max600-cdhit99.fasta`.

### Retrieving blast hit serotypes
The list of accessions for 1e-15 is split into files of 1000 lines each by running `split data/wzy/ssn-clusterings/2206101141/included_accessions.txt data/wzy/blast-full-genbank/1e-15/hits`

Each file is uploaded to NCBI batch entry and the gp files are downloaded and saved in `data/wzy/blast-full-genbank/1e-15`. 

To retrieve serotypes for the blast hits (the ones where available), run `python src/data-collection-and-preprocessing/get-serotypes.py`. This will create the file `data/wzy/blast-full-genbank/1e-15/hits-serotypes.tsv`.

Then, to enrich with sugar data, run `python src/data-collection-and-preprocessing/enrich-blast-hits.py`. This will create the file `data/wzy/blast-full-genbank/1e-15/hits-enriched.tsv`.

## All-vs-all blast

Locally run `sh src/all-vs-all-blast/all-vs-all.sh`

On the HPC run `python3 /work3/idamei/wzy/all-vs-all-blast/prepare-all-vs-all.py`

And `sh /work3/idamei/all-vs-all-blast/submit.sh`

When all jobs are finished, run: 
`qrsh`

`tar -czvf /work3/idamei/wzy/all-vs-all-blast.tar.gz /work3/idamei/wzy/all-vs-all-blast`

Then locally delete the old run: `rm -r data/wzy/all-vs-all-blast`
And download the new one: `scp -r idamei@transfer.gbar.dtu.dk:/work3/idamei/wzy/all-vs-all-blast.tar.gz data/wzy/all-vs-all-blast`
Unpack it and move to `data/wzy/all-vs-all-blast/`.
This file is too big to store in GitHub, so is only stored locally.

### Make network file
To make the network file run `python3 src/ssn-clustering/make-network-file.py`.

This will create the file `data/wzy/all-vs-all-blast/network`.

## SSN clustering

Fragment sequences are manually added to the file `data/wzy/blast/banned`.

To get the clusters in the SSN, run `sh src/ssn-clustering/cluster.sh [timestamp] [expansion-threshold] [ssn-threshold]`. (expansion-threshold is written as '1e-30')

This will create the folder `data/wzy/ssn-clusterings/[timestamp]` which contains a folder `clusters` with fasta files for all the clusters and jobscripts for making MSAs, a `metadata.txt`, `info.txt`, `clusters.tsv`, `included.txt`, `network`, and `submit.sh`. Then, it copies all this to the HPC.

On the HPC, run `sh /work3/idamei/wzy/ssn-clusterings/[timestamp]/submit.sh`.

When all jobs are finished (check with bstat), run locally: `sh src/ssn-clustering/cluster2.sh [timestamp]`

Push changes.

To visualize alphafold models with conserved residues, run: `pymol data/wzy/ssn-clusterings/[timestamp]/pymol-visualization.pml`.

## Phylogenetic trees

### Make iTOL label files
To make iTOL label files, run `python src/phylogenetic-trees/make-itol-label-files.py`. This will create label files in the folder `data/wzy/phylogenetic-trees/itol-label-files`.

The MUSCLE tree is generated at: `https://www.ebi.ac.uk/Tools/msa/muscle/` by uploading `data/wzy/wzy.fasta`. This tree is saved as `data/wzy/phylogenetic-trees/trees/muscle-tree.nwk`.

## Pymol visualization

### Ligase alignment
To align Wzy alphafold models from different clusters with the O-antigen ligase (WaaL) and compare conserved arginines, run `pymol src/pymol-visualization/ligase-alignment.pml`.

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

## WaaL

### Parse blast results
To parse the blast results, run: `python src/data-collection-and-preprocessing/parse-blast-results.py waal`

### Get blast hit data
Then transfer the file to the HPC: `scp data/waal/blast/unique-hits.tsv idamei@transfer.gbar.dtu.dk:/work3/idamei/waal/blast/`

To get the blast data, run on the HPC: `qrsh`

`blastdbcmd -db nr -entry_batch /work3/idamei/waal/blast/unique-hits.tsv > /work3/idamei/waal/blast/unique-hits.fasta`

`blastdbcmd -db nr -entry_batch /work3/idamei/waal/blast/unique-hits.tsv -outfmt "%a ,%L ,%T ,%t ,%s" > /work3/idamei/waal/blast/unique-hits.csv` 

Then locally run:
`scp idamei@transfer.gbar.dtu.dk:/work3/idamei/waal/blast/unique-hits.fasta data/waal/blast/`

`scp idamei@transfer.gbar.dtu.dk:/work3/idamei/waal/blast/unique-hits.csv data/waal/blast/`

To generate fasta with short headers, run: `sed 's/ >.*$//' data/waal/blast/unique-hits.fasta > data/waal/blast/unique-hits-short-headers.fasta`

### Filter and redundancy reduce
`python src/waal-analysis/filter-waal-blast-hits.py`

`cd-hit -i data/waal/MSA/waal_hits_1e-15_filtered.fasta -o data/waal/MSA/waal_hits_1e-15_filtered-cdhit99.fasta -c 0.99`

### Make MSA and logo
`scp data/waal/MSA/waal_hits_1e-15_filtered-cdhit99.fasta idamei@transfer.gbar.dtu.dk:/work3/idamei/waal/MSA/`

To make the MSA, run on the HPC: `qrsh` and `muscle -super5 /work3/idamei/waal/MSA/waal_hits_1e-15_filtered-cdhit99.fasta -output /work3/idamei/waal/MSA/waal_hits_1e-15_filtered-cdhit99.afa`.

To make the logo, run on the HPC: `python2 /work3/idamei/bin/seq2logo-2.1/Seq2Logo.py -f /work3/idamei/waal/MSA/waal_hits_1e-15_filtered-cdhit99.afa -m 0.0001 -b 0 -o /work3/idamei/waal/logo/waal_hits_1e-15_filtered-cdhit99.logo  -p 640x1000 -l 30  -I 1`.

To download the results, run `scp -r idamei@transfer.gbar.dtu.dk:/work3/idamei/waal/logo data/waal` and `scp idamei@transfer.gbar.dtu.dk:/work3/idamei/waal/MSA/waal_hits_1e-15_filtered-cdhit99.afa data/waal/MSA`.

To convert the logo to pdf, run: `ps2pdf -dEPSCrop data/waal/logo/waal_hits_1e-15_filtered-cdhit99.logo.eps data/waal/logo/waal_hits_1e-15_filtered-cdhit99.logo.pdf`.