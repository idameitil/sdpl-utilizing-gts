# Analysis of O-antigen synthesis enzymes

## Collecting data and preprocessing

Manually curated Wzys from papers are added to `data/selected-wzys.tsv`.

The DNA records for the Wzys were downloaded manually using NCBI batch entry (https://www.ncbi.nlm.nih.gov/sites/batchentrez) (Click “Send to:”, "Complete Record", "GenBank (full)"). They are stored in `data/selected_OAGCs.gb` (Some are O-antigen gene clusters, some are whole genome sequences). This file is too big to store in GitHub, and is just stored locally.

### Enriching Wzy table with sugars and taxonomy
To enrich the selected wzys with csdb sugars and taxonomy run `python src/data-collection-and-preprocessing/enrich-wzys.py`

This will create the file `data/wzy/wzy.tsv`

### Downloading CSDB images
In order to download new CSDB images, run `python3 src/data-collection-and-preprocessing/download-csdb-images.py`

### Retrieving Wzxs, Wzzs and WaaLs
To retrieve the Wzx, Wzz and Waal entries run `python3 src/data-collection-and-preprocessing/retrieve-wzx-wzz-and-waal.py`

This will create the files `data/wzx/wzx.tsv`, `data/wzz/wzz.tsv` and `data/waal/waal.tsv`

### Making fasta files
To generate fasta files run `python3 src/data-collection-and-preprocessing/make-fastas.py`

This will create the files `data/wzx.fasta`, `data/wzy.fasta` and `data/wzz.fasta`

### Expanding with Blast
Copy fasta file with entries that need to be blasted to `/work3/idamei/wzy_blast/` on the HPC.

On the HPC: `cd /work3/idamei/wzy_blast`

Change inputfile to the name of the fasta in: `genscript.py`

Then run `genscript.py > submit.sh`

Check the generated folders in `run`and then run `sh submit.sh`

### Parsing Blast results
To parse the blast expansion output files run `python3 src/data-collection-and-preprocessing/parse-blast-results.py`

This will create the file `data/wzy/blast/unique-hits.tsv` which contains a list of the hit accessions and their best e-values.

### Retrieving Blast hit data
To retrieve the sequence and taxid for the blast hits, run:
`scp data/wzy/blast/unique-hits.tsv idamei@transfer.gbar.dtu.dk:/work3/idamei/`

Then, on the HPC run:
`qrsh`

`blastdbcmd -db nr -entry_batch /work3/idamei/unique-hits.tsv > /work3/idamei/unique-hits.fasta`

`blastdbcmd -db nr -entry_batch /work3/idamei/unique-hits.tsv -outfmt "%a ,%L ,%T ,%t ,%s" > /work3/idamei/unique-hits.csv` 

Then locally run:
`scp idamei@transfer.gbar.dtu.dk:/work3/idamei/unique-hits.fasta data/wzy/blast/unique-hits.fasta`

`scp idamei@transfer.gbar.dtu.dk:/work3/idamei/unique-hits.csv data/wzy/blast/unique-hits.csv`

`data/wzy/blast/unique-hits.fasta` is a fasta file with exactly the entries in `data/wzy/blast/unique-hits.tsv`.

`data/wzy/blast/unique-hits.csv` is a csv file containing taxids along with other info. It also includes identical sequences and therefore has more lines than `data/wzy/blast/unique-hits.tsv`.

To generate fasta with short headers, run: `sed 's/ >.*$//' data/wzy/blast/unique-hits.fasta > data/wzy/blast/unique-hits-short-headers.fasta`

### Make nodes file
Run `python src/data-collection-and-preprocessing/make-nodes-file.py`. 

This will generate the file `data/wzy/seeds-and-hits.tsv`.

### Filtering and redundancy reducing Blast hits
To filter blast hits by length and perform redundancy reduction with cd-hit run: `python3 src/data-collection-and-preprocessing/filter-blast-hits.py`.

This will create the files `data/wzy/blast/unique-hits-min320max600.fasta` and `data/wzy/blast/unique-hits-min320max600-cdhit99.fasta`.

## All-vs-all blast

Locally run `sh src/all-vs-all-blast/all-vs-all.sh`

On the HPC run `python3 /work3/idamei/all-vs-all-blast/prepare-all-vs-all.py`

And `sh /work3/idamei/all-vs-all-blast/submit.sh`

When all jobs are finished, run: 
`qrsh`

`tar -czvf /work3/idamei/all-vs-all-blast.tar.gz /work3/idamei/all-vs-all-blast`

Then locally run: `scp -r idamei@transfer.gbar.dtu.dk:/work3/idamei/all-vs-all-blast.tar.gz data/wzy/all-vs-all-blast`
Unpack it and move to `data/wzy/all-vs-all-blast/`.
This file is too big to store in GitHub, so is only stored locally.

### Make network file
To make the network file run `python3 src/ssn-clustering/make-network-file.py`.

This will create the file `data/wzy/all-vs-all-blast/network`.

## SSN clustering

Fragment sequences are manually added to the file `data/wzy/blast/banned`.

To get the clusters in the SSN, run `sh src/ssn-clustering/cluster.sh [timestamp] [expansion-threshold] [ssn-threshold]`. (expansion-threshold is written as '1e-30')

This will create the folder `data/wzy/ssn-clusterings/[timestamp]` which contains a folder `clusters` with fasta files for all the clusters and jobscripts for making MSAs, a `metadata.txt`, `info.txt`, `clusters.tsv`, `included.txt`, `network`, `report.md` and `submit.sh`. Then, it copies all this to the HPC.

On the HPC, run `sh /work3/idamei/ssn-clusterings/[timestamp]/submit.sh`.

When all jobs are finished (check with bstat), run locally: `scp -r idamei@transfer.gbar.dtu.dk:/work3/idamei/ssn-clusterings/[timestamp]/clusters/ data/wzy/ssn-clusterings/[timestamp]`

To convert the logoplots to pdf run `python3 src/ssn-clustering/convert-logos-to-pdf.py [timestamp]`.

Push changes.

## Phylogenetic trees

### Make iTOL label files
To make iTOL label files, run `python src/phylogenetic-trees/make-itol-label-files.py`. This will create label files in the folder `data/wzy/phylogenetic-trees/itol-label-files`.

The MUSCLE tree is generated at: `https://www.ebi.ac.uk/Tools/msa/muscle/` by uploading `data/wzy/wzy.fasta`. This tree is saved as `data/wzy/phylogenetic-trees/trees/muscle-tree.nwk`.

## Pymol visualization

### Ligase alignment
To align Wzy alphafold models from different clusters with the O-antigen ligase (WaaL) and compare conserved arginines, run `pymol src/pymol-visualization/ligase-alignment.pml`.