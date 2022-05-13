# Analysis of O-antigen synthesis enzymes

## Collecting data and preprocessing

Manually curated Wzys from papers are added to `data/selected-wzys.tsv`.

The DNA records for the Wzys were downloaded manually using NCBI batch entry (https://www.ncbi.nlm.nih.gov/sites/batchentrez). They are stored in `data/selected_OAGCs.gb` (Some are O-antigen gene clusters, some are whole genome sequences). This file is too big to store in GitHub, and is just stored locally.

### Enriching Wzy table with sugars and taxonomy
To enrich the selected wzys with csdb sugars and taxonomy run `src/data-collection-and-preprocessing/enrich-wzys.py`

This will create the file `data/wzy/wzy.tsv`

### Retrieving Wzxs and Wzzs
To retrieve the Wzx and Wzz entries run `src/data-collection-and-preprocessing/retrieve-wzx-and-wzz.py`

This will create the files `data/wzx.tsv` and `data/wzz.tsv`

### Making fasta files
To generate fasta files run `src/data-collection-and-preprocessing/make-fastas`

This will create the files `data/wzx.fasta`, `data/wzy.fasta` and `data/wzz.fasta`

### Expanding with Blast
Copy fasta file with entries that need to be blasted to `/work3/idamei/wzy_blast/` on the HPC.

On the HPC: `cd /work3/idamei/wzy_blast`

Change inputfile to the name of the fasta in: `genscript.py`

Then run `genscript.py > submit.sh`

Check the generated folders in `run`and then run `sh submit.sh`

### Parsing Blast results
To parse the blast expansion output files run `src/data-collection-and-preprocessing/parse-blast-results.py`

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

### Filtering and redundancy reducing Blast hits
To filter blast hits by length and perform redundancy reduction with cd-hit run: `src/data-collection-and-preprocessing/filter-blast-hits.py`.

This will create the files `data/wzy/blast/unique-hits-min320max600.fasta` and `data/wzy/blast/unique-hits-min320max600-cdhit99.fasta`.

## SSN clustering

### All-vs-all blast

run `sh src/ssn-clustering/all-vs-all.sh [timestamp]`

When all jobs are finished, run: `scp -r idamei@transfer.gbar.dtu.dk:/work3/idamei/ssn-clusterings/[timestamp] data/wzy/ssn-clusterings/all-vs-all-blast/`

This file is too big to store in GitHub, so is only stored locally.

### Make network file
To make the network file run `src/ssn-clustering/make-network-file.py [timestamp]`.

This will create the file `data/wzy/ssn-clusterings/all-vs-all-blast/[timestamp]/network`.

### Cluster

Fragment sequences are manually added to the file `data/wzy/blast/ssn-clusterings/banned`. These will not be included in the clusters.

To get the clusters in the SSN, change the thresholds in `src/ssn-clustering/get-clusters.py` to the desired ones and run `sh src/ssn-clustering/cluster.sh [timestamp]`.

This will create the folder `data/wzy/ssn-clusterings/clustering/[timestamp]` which contains a folder `clusters` with fasta files for all the clusters and jobscripts for making MSAs, a `metadata.txt`, `info.txt`, `clusters.tsv`, `included.txt`, `network`, `report.md` and `submit.sh`. Then, it copies all this to the HPC and submits the jobs.

When all jobs are finished (check with bstat), run locally: `scp -r idamei@transfer.gbar.dtu.dk:/work3/idamei/ssn-clusterings/clustering/[timestamp]/clusters/ data/wzy/ssn-clusterings/clustering/[timestamp]`