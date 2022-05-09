# 

## Collecting data and preprocessing

Manually curated Wzys from papers are added to `data/selected-wzys.tsv`

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


### Parsing Blast results
To parse the blast expansion output files run `src/data-collection-and-preprocessing/parse-blast-results.py`
This will create the file `data/wzy/blast/unique-hits.tsv` which contains a list of the hit accessions and their best e-values.

### Retrieving Blast hit data
To retrieve the sequence and taxid for the blast hits, run:
`scp data/wzy/blast/unique-hits.tsv idamei@transfer.gbar.dtu.dk:/work3/idamei/`
Then, on the HPC run:
`qrsh`
`blastdbcmd -db nr -entry_batch /work3/idamei/unique-hits.tsv > /work3/idamei/unique-hits.fasta`
`blastdbcmd -db nr -entry_batch /work3/idamei/unique-hits.tsv -outfmt "%a,%L,%T,%t,%s" > /work3/idamei/unique-hits.seq`
Then locally run:
`scp idamei@transfer.gbar.dtu.dk:/work3/idamei/unique-hits.fasta data/wzy/blast/unique-hits.fasta`
`scp idamei@transfer.gbar.dtu.dk:/work3/idamei/unique-hits.seq data/wzy/blast/unique-hits.seq`
`data/wzy/blast/unique-hits.fasta` is a fasta file with exactly the entries in `data/wzy/blast/unique-hits.tsv`.
`data/wzy/blast/unique-hits.seq` is a csv file containing taxids along with other info. It also includes identical sequences and therefore has more lines than `data/wzy/blast/unique-hits.tsv`.

### Filtering and redundancy reducing Blast hits
To filter blast hits by length and perform redundancy reduction with cd-hit run: `src/data-collection-and-preprocessing/filter-blast-hits.py`.
This will create the files `data/wzy/blast/unique-hits-min320max600.fasta` and `data/wzy/blast/unique-hits-min320max600-cdhit99.fasta`.

## Explorations


## Clustering

### All-vs-all blast
On the HPC, run `mkdir /work3/idamei/ssn-clusterings/[timestamp]`
Locally, run `scp src/ssn-clustering/prepare-all-vs-all.py idamei@transfer.gbar.dtu.dk:/work3/idamei/ssn-clusterings/[timestamp]/`
And `scp data/wzy/blast/unique-hits.fasta idamei@transfer.gbar.dtu.dk:/work3/idamei/ssn-clusterings/[timestamp]/`
Then on the HPC, run `python3 /work3/idamei/ssn-clusterings/[timestamp]/prepare-all-vs-all.py [timestamp]`
And `sh submit.sh`
When all jobs are finished, run locally: `scp -r idamei@transfer.gbar.dtu.dk:/work3/idamei/ssn-clusterings/[timestamp] data/wzy/ssn-clusterings/all-vs-all-blast`
This file is too big to store in GitHub, and is just stored locally.

### old
Fragment sequences are manually added to the file `data/wzy/blast/ssn-clusterings/banned`. These will not be included in the clusters.

`python src/ssn-clustering/all-vs-all.py/ [timestamp]`

`scp -r data/wzy/ssn-clusterings/[timestamp] idamei@transfer.gbar.dtu.dk:/work3/idamei/ssn-clusterings`

On the HPC, run: `sh /work3/idamei/ssn-clusterings/[timestamp]/submit.sh`