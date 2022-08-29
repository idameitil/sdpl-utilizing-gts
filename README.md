# Analysis of O-antigen synthesis enzymes

## Collecting data and preprocessing

Manually curated Wzys from papers are added to `data/selected-wzys.tsv`.

The DNA records for the Wzys were downloaded manually using NCBI batch entry (https://www.ncbi.nlm.nih.gov/sites/batchentrez) (Click “Send to:”, "Complete Record", "GenBank (full)"). They are stored in `data/selected_OAGCs.gb` (Some are O-antigen gene clusters, some are whole genome sequences). This file is too big to store in GitHub, and is just stored locally.

### Enriching Wzy table with sugars and taxonomy
To enrich the selected wzys with csdb sugars and taxonomy run `python src/data-collection-and-preprocessing/enrich-wzys.py`

This will create the file `data/wzy/wzy.tsv`

### Downloading CSDB images
In order to download new CSDB images, run `python src/data-collection-and-preprocessing/download-csdb-images.py`

Add to wzy_polymerases repo.

### Retrieving Wzxs, Wzzs and WaaLs
(OBS: new entry was added to waal.tsv, so don't run this)
To retrieve the Wzx, Wzz and Waal entries run `python src/data-collection-and-preprocessing/retrieve-wzx-wzz-and-waal.py`

This will create the files `data/wzx/wzx.tsv`, `data/wzz/wzz.tsv` and `data/waal/waal.tsv` (add 7tpg to waal.tsv and waal.fasta)

### Making fasta files
To generate fasta files run `python3 src/data-collection-and-preprocessing/make-fastas.py`

This will create the files `data/wzx.fasta`, `data/wzy.fasta`, `data/wzz.fasta` and `data/waal.fasta`.

### Expanding with Blast
Copy fasta file with entries that need to be blasted to `/work3/idamei/wzy/blast/` on the HPC.

On the HPC: `cd /work3/idamei/wzy/blast`

Change inputfile to the name of the fasta in: `genscript.py`

Then run `genscript.py > submit.sh`

Check the generated folders in `run`and then run `sh submit.sh`

When all jobs have finished, download the data: `scp -r idamei@transfer.gbar.dtu.dk:/work3/idamei/wzy/blast data/wzy/`

For Wzx, Wzz and WaaL, it is the same procedure, just `/work3/idamei/waal/blast/`

### Parsing Blast results
To parse the blast expansion output files run `python3 src/data-collection-and-preprocessing/parse-blast-results.py [protein-family]`. Where `protein-family` is `wzy`, `wzx`, `wzz`, `waal` or `eca-pol`.

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

### Enriching blast hit data
The list of accessions for 1e-15 is split into files of 1000 lines each by running `split data/wzy/ssn-clusterings/2206101141/included_accessions.txt data/wzy/blast-full-genbank/1e-15/hits`

Each file is uploaded to NCBI batch entry and the gp files are downloaded and saved in `data/wzy/blast-full-genbank/1e-15`. 

To retrieve serotypes for the blast hits (the ones where available), run `python src/data-collection-and-preprocessing/get-serotypes.py`. This will create the file `data/wzy/blast-full-genbank/1e-15/hits-serotypes.tsv`.

Then, to enrich with sugar data and taxonomy, run `python src/data-collection-and-preprocessing/enrich-blast-hits.py`. This will create the file `data/wzy/blast/hits-enriched.tsv`.

### Make nodes file
Run `python src/data-collection-and-preprocessing/make-nodes-file.py`. 

This will generate the file `data/wzy/seeds-and-hits.tsv`.

### Filtering and redundancy reducing Blast hits
To filter blast hits by length and perform redundancy reduction with cd-hit run: `python3 src/data-collection-and-preprocessing/filter-blast-hits.py`.

This will create the files `data/wzy/blast/unique-hits-min320max600.fasta` and `data/wzy/blast/unique-hits-min320max600-cdhit99.fasta`.

## Phobius
Phobius is run at `https://phobius.sbc.su.se/`. The results are downloaded with "Save page as", "Web Page, complete" and saved in `data/wzy/phobius`.

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
To make the network file run `python3 src/all-vs-all-blast/make-network-file.py`.

This will create the file `data/wzy/all-vs-all-blast/network`.

## SSN clustering

### Cluster
Fragment sequences are manually added to the file `data/wzy/blast/banned`.

To get the clusters in the SSN, run `sh src/ssn-clustering/cluster/cluster.sh [timestamp] [expansion-threshold] [ssn-threshold]`. (expansion-threshold is written as '1e-30')

This will create the folder `data/wzy/ssn-clusterings/[timestamp]` which contains a folder `clusters` with fasta files for all the clusters and jobscripts for making MSAs, a `metadata.txt`, `info.txt`, `clusters.tsv`, `included.txt`, `network`, and `submit.sh`. Then, it copies all this to the HPC.

On the HPC, run `sh /work3/idamei/wzy/ssn-clusterings/[timestamp]/submit.sh`.

### Analyse clustering
When all jobs are finished (check with bstat), run locally: `sh src/ssn-clustering/analyse-clustering/analyse-clustering.sh [timestamp]`

Push changes.

To visualize alphafold models with conserved residues, run: `pymol data/wzy/ssn-clusterings/[timestamp]/pymol-visualization.pml`.

<!---
### HMM search
`python src/ssn-clustering/search-hmms.py [timestamp]`
-->

### Super cluster analysis
Run HHblits all clusters against all: `sh src/ssn-clustering/super-cluster-analysis/hhblits.sh [timestamp]`

Make HMM supercluster network edge file: `python src/ssn-clustering/super-cluster-analysis/make-hmm-edge-file.py [timestamp] 110`

Get super clusters: `python src/ssn-clustering/super-cluster-analysis/collapse-clusters.py [timestamp] 110`

Prepare MSAs for super clusters: `python src/ssn-clustering/super-cluster-analysis/prepare-super-cluster-alignments.py`

`scp -r data/wzy/ssn-clusterings/[timestamp]/super-clusters idamei@transfer.gbar.dtu.dk:/work3/idamei/wzy/ssn-clusterings/[timestamp]`

At the HPC: `sh /work3/idamei/wzy/ssn-clusterings/[timestamp]/submit.sh`

When all jobs are finished, run locally:
`scp -r idamei@transfer.gbar.dtu.dk:/work3/idamei/wzy/ssn-clusterings/[timestamp]/super-clusters/ data/wzy/ssn-clusterings/[timestamp]`

## Phylogenetic trees

### Make iTOL label files
To make iTOL label files, run `python src/phylogenetic-trees/make-itol-label-files.py`. This will create label files in the folder `data/wzy/phylogenetic-trees/itol-label-files`.

The MUSCLE tree is generated at: `https://www.ebi.ac.uk/Tools/msa/muscle/` by uploading `data/wzy/wzy.fasta`. This tree is saved as `data/wzy/phylogenetic-trees/trees/muscle-tree.nwk`.

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

### Enrich blast hits with taxonomy
`python src/data-collection-and-preprocessing/enrich-blast-hits-waal-eca-pol.py waal`

### Make nodes file
`python src/data-collection-and-preprocessing/make-nodes-file-waal-eca-pol.py waal`

### Filter and redundancy reduce
`python src/data-collection-and-preprocessing/filter-waal-eca-pol-blast-hits.py waal 280 500`

`cd-hit -i data/waal/blast/unique-hits-short-headers-1e-15-filtered.fasta -o data/waal/blast/unique-hits-short-headers-1e-15-filtered-cdhit99.fasta -c 0.99`

### Make MSA and logo
`python src/waal-analysis/prepare-MSA-and-logo.py`

`scp -r data/waal/MSA-logo idamei@transfer.gbar.dtu.dk:/work3/idamei/waal/`

On the HPC, run `bsub < /work3/idamei/waal/MSA-logo/MSA-logo.sh`

To download the results, run `scp -r idamei@transfer.gbar.dtu.dk:/work3/idamei/waal/MSA-logo data/waal`.

To convert the logo to pdf, run: `ps2pdf -dEPSCrop data/waal/MSA-logo/seeds-and-hits.logo.eps data/waal/MSA-logo/seeds-and-hits.logo.pdf`.
 
### Pymol visualization
`python src/waal-analysis/make-pymol-script.py`

`pymol src/waal-analysis/pymol-visualization.pml`

### Make clade fastas
script not updates: `python src/waal-analysis/make-clade-fastas.py`

### Build HMMs
`hmmbuild data/waal/clades/clade1/clade1.hmm data/waal/clades/clade1/clade1.afa`

`hmmbuild data/waal/clades/clade2/clade2.hmm data/waal/clades/clade2/clade2.afa`

`hmmbuild data/waal/clades/clade2-1/clade2-1.hmm data/waal/clades/clade2-1/clade2-1.afa`

`hmmbuild data/waal/clades/clade2-2/clade2-2.hmm data/waal/clades/clade2-2/clade2-2.afa`

### HMM search
Search for hits in all clades with the three HMMs:
`python src/waal-analysis/hmmsearch.py`

### HMM scan
Make the database:
`cat data/waal/clades/clade1/clade1.hmm data/waal/clades/clade2-1/clade2-1.hmm data/waal/clades/clade2-2/clade2-2.hmm > data/waal/hmmscan/db/hmmdb`

Compress the database:
`hmmpress data/waal/hmmscan/db/hmmdb`

Run hmmscan:
`python src/waal-analysis/hmmscan.py`

### Make tree with all hits below 1e-15 and seeds
`python src/waal-analysis/prepare-tree-all.py`

### hmmsearch against genbank
`scp data/waal/clades/clade1/clade1.hmm data/waal/clades/clade2/clade2.hmm idamei@transfer.gbar.dtu.dk:/work3/idamei/waal/hmm`

`qrsh`

`hmmsearch /work3/idamei/waal/hmm/clade1.hmm /work3/garryg/blast/db-/genbank.fa > /work3/idamei/waal/genbank-search/clade1-genbank.out`

`hmmsearch /work3/idamei/waal/hmm/clade2.hmm /work3/garryg/blast/db-/genbank.fa > /work3/idamei/waal/genbank-search/clade2-genbank.out`

`scp idamei@transfer.gbar.dtu.dk:/work3/idamei/waal/genbank-search/clade1-genbank.out data/waal/genbank-search/`
`scp idamei@transfer.gbar.dtu.dk:/work3/idamei/waal/genbank-search/clade2-genbank.out data/waal/genbank-search/`

To parse the genbank hmm search, run: `python src/genbank-search/parse-hmm-search.py`. This will create `data/waal/genbank-search/hits-evalue.tsv`

To retrieve the sequences of the hits, run: `scp data/waal/genbank-search/hits-evalue.tsv idamei@transfer.gbar.dtu.dk:/work3/idamei/waal/genbank-search/`

Then run: `blastdbcmd -db genbank -entry_batch /work3/idamei/waal/genbank-search/hits-evalue.tsv -dbtype prot > /work3/idamei/waal/genbank-search/hits.fasta`

`scp idamei@transfer.gbar.dtu.dk:/work3/idamei/waal/genbank-search/hits.fasta data/waal/genbank-search/`

### Make tree with all genbank hits
CD-HIT: `cd-hit -i data/waal/genbank-search/hits.fasta -o data/waal/genbank-search/hits-cd-hit99.fasta -c 0.99`

`scp data/waal/genbank-search/hits-cd-hit99.fasta idamei@transfer.gbar.dtu.dk:/work3/idamei/waal/genbank-hits-tree`

On the HPC: `cp /work3/idamei/bin/aclust_example/* /work3/idamei/waal/genbank-hits-tree/`

Follow Aclust readme in /work3/idamei/waal/genbank-hits-tree/.

### Make iTOL label files with e-values
`python src/waal-analysis/make-iTOL-labels-evalue.py`

## ECA-Pol

### Enrich blast hits with taxonomy
`python src/data-collection-and-preprocessing/enrich-blast-hits-waal-eca-pol.py eca-pol`

### Make nodes file
`python src/data-collection-and-preprocessing/make-nodes-file-waal-eca-pol.py eca-pol`

### Filter and redundancy reduce
`python src/data-collection-and-preprocessing/filter-waal-eca-pol-blast-hits.py eca-pol 400 600`

`cd-hit -i data/eca-pol/blast/unique-hits-short-headers-1e-15-filtered.fasta -o data/eca-pol/blast/unique-hits-short-headers-1e-15-filtered-cdhit99.fasta -c 0.99`

### Make MSA
`scp data/eca-pol/blast/unique-hits-short-headers-1e-15-filtered-cdhit99.fasta idamei@transfer.gbar.dtu.dk:/work3/idamei/eca-pol/MSA/`

On the HPC:
`qrsh`
`/work3/idamei/bin/muscle5.1.linux_intel64 -super5 /work3/idamei/eca-pol/MSA/unique-hits-short-headers-1e-15-filtered-cdhit99.fasta -output /work3/idamei/eca-pol/MSA/unique-hits-short-headers-1e-15-filtered-cdhit99.afa`

`scp -r idamei@transfer.gbar.dtu.dk:/work3/idamei/eca-pol/MSA/ data/eca-pol/`

### Build HMM
`hmmbuild data/eca-pol/hmm/eca-pol.hmm data/eca-pol/MSA/eca-pol.afa`

### hmmsearch against genbank
`scp data/eca-pol/hmm/ idamei@transfer.gbar.dtu.dk:/work3/idamei/eca-pol/`

`qrsh`

`hmmsearch /work3/idamei/eca-pol/hmm/eca-pol.hmm /work3/garryg/blast/db-/genbank.fa > /work3/idamei/eca-pol/genbank-search/eca-pol-genbank.out`

`scp idamei@transfer.gbar.dtu.dk:/work3/idamei/eca-pol/genbank-search/eca-pol-genbank.out data/eca-pol/genbank-search/`