# Analysis of O-antigen synthesis enzymes

## Collecting data and preprocessing

Manually curated Wzys from literature are added to `data/selected-wzys.tsv`.

The DNA records for the Wzys were downloaded manually using NCBI batch entry (https://www.ncbi.nlm.nih.gov/sites/batchentrez) (Click “Send to:”, "Complete Record", "GenBank (full)"). They are stored in `data/selected_OAGCs.gb` (Some are O-antigen gene clusters, some are whole genome sequences). This file is too big to store in GitHub, and is just stored locally.

Manually curated Waals and ECA-Pol from literature are added to `data/waal/selected-waals.tsv` and `data/eca-pol/eca-pol.tsv` respectively.

### Enriching Wzy and Waal table with sugars and taxonomy
To enrich the selected wzys or waals with csdb sugars and taxonomy run `python src/data-collection-and-preprocessing/enrich-wzys.py [enzyme-family]`

This will create the file `data/wzy/wzy.tsv` or `data/waal/waal.tsv`

### Downloading CSDB images
In order to download new CSDB images, run `python src/data-collection-and-preprocessing/download-csdb-images.py`

Add to wzy_polymerases repo.

### Retrieving Wzxs and Wzzs
To retrieve the Wzx and Wzz entries, run `python src/data-collection-and-preprocessing/retrieve-wzx-wzz.py`

This will create the files `data/wzx/wzx.tsv` and `data/wzz/wzz.tsv`.

### Making seed fasta files
To generate fasta files run `python src/data-collection-and-preprocessing/make-fastas.py`

This will create the files `data/wzx/wzx.fasta`, `data/wzy/wzy.fasta`, `data/wzz/wzz.fasta`, `data/waal/waal.fasta` and `data/eca-pol/eca-pol.fasta`.

### Expanding with Blast
Copy fasta file to HPC: `scp data/[enzyme_family]/[enzyme_family].fasta idamei@transfer.gbar.dtu.dk:/work3/idamei/[enzyme_family]/blast`

On the HPC, run: `/work3/idamei/src/blast.py [enzyme_family]`

And then: `/work3/idamei/[enzyme_family]/blast/submit.sh`

(OBS: maybe only download the new runs) When all jobs have finished, download the data: `scp -r idamei@transfer.gbar.dtu.dk:/work3/idamei/[enzyme_family]/blast data/[enzyme_family]/`

### Parsing Blast results
To parse the blast expansion output files, run `python src/data-collection-and-preprocessing/parse-blast-results.py [protein-family]`. Where `protein-family` is `wzy`, `wzx`, `wzz`, `waal` or `eca-pol`.

This will create the file `data/[protein-family]/blast/unique-hits.tsv` which contains a list of the hit accessions and their best e-values.

### Retrieving Blast hit data
To retrieve the sequence and taxid for the blast hits, run:
`scp data/[enzyme_family]/blast/unique-hits.tsv idamei@transfer.gbar.dtu.dk:/work3/idamei/[enzyme_family]/blast/`

Then, on the HPC run:
`qrsh`

`blastdbcmd -db nr -entry_batch /work3/idamei/[enzyme_family]/blast/unique-hits.tsv > /work3/idamei/[enzyme_family]/blast/unique-hits.fasta`

`blastdbcmd -db nr -entry_batch /work3/idamei/[enzyme_family]/blast/unique-hits.tsv -outfmt "%a ,%L ,%T ,%t ,%s" > /work3/idamei/[enzyme_family]/blast/unique-hits.csv` 

Then locally run:
`scp idamei@transfer.gbar.dtu.dk:/work3/idamei/[enzyme_family]/blast/unique-hits.fasta data/[enzyme_family]/blast/`

`scp idamei@transfer.gbar.dtu.dk:/work3/idamei/[enzyme_family]/blast/unique-hits.csv data/[enzyme_family]/blast/`

`data/[enzyme_family]/blast/unique-hits.fasta` is a fasta file with exactly the entries in `data/[enzyme_family]/blast/unique-hits.tsv`. `data/[enzyme_family]/blast/unique-hits.csv` is a csv file containing taxids along with other info. It also includes identical sequences and therefore has more lines than `data/[enzyme_family]/blast/unique-hits.tsv`.

To generate fasta with short headers, run: `sed 's/ >.*$//' data/[enzyme_family]/blast/unique-hits.fasta > data/[enzyme_family]/blast/unique-hits-short-headers.fasta`

### Retrieve blast hit serotypes for wzys
The list of accessions for 1e-15 is split into files of 1000 lines each by running `split data/wzy/ssn-clusterings/2206101141/included_accessions.txt data/wzy/blast-full-genbank/1e-15/hits`

Each file is uploaded to NCBI batch entry and the gp files are downloaded and saved in `data/wzy/blast-full-genbank/1e-15`. 

To retrieve serotypes for the blast hits (the ones where available), run `python src/data-collection-and-preprocessing/get-serotypes.py`. This will create the file `data/wzy/blast-full-genbank/1e-15/hits-serotypes.tsv`.

### Enriching blast hit data
Then, to enrich with sugar data and taxonomy, run `python src/data-collection-and-preprocessing/enrich-blast-hits.py`. This will create the file `data/wzy/blast/hits-enriched.tsv`.

FOR WAAL: `python src/data-collection-and-preprocessing/enrich-blast-hits-waal-eca-pol.py waal`

FOR ECA-POL: `python src/data-collection-and-preprocessing/enrich-blast-hits-waal-eca-pol.py eca-pol`

### Make nodes file
Run `python src/data-collection-and-preprocessing/make-nodes-file.py`. 

This will generate the file `data/wzy/seeds-and-hits.tsv`.

FOR WAAL: `python src/data-collection-and-preprocessing/make-nodes-file-waal-eca-pol.py waal`

FOR ECA-POL: `python src/data-collection-and-preprocessing/make-nodes-file-waal-eca-pol.py eca-pol`

### Filtering and redundancy reducing Blast hits
To filter blast hits by length and perform redundancy reduction with cd-hit run: `python3 src/data-collection-and-preprocessing/filter-blast-hits.py`.

This will create the files `data/wzy/blast/unique-hits-min320max600.fasta` and `data/wzy/blast/unique-hits-min320max600-cdhit99.fasta`.

FOR WAAL: `python src/data-collection-and-preprocessing/filter-waal-eca-pol-blast-hits.py waal 280 500`

`cd-hit -i data/waal/blast/unique-hits-short-headers-1e-15-filtered.fasta -o data/waal/blast/unique-hits-short-headers-1e-15-filtered-cdhit99.fasta -c 0.99`

FOR ECA-POL: `python src/data-collection-and-preprocessing/filter-waal-eca-pol-blast-hits.py eca-pol 400 600`

`cd-hit -i data/eca-pol/blast/unique-hits-short-headers-1e-15-filtered.fasta -o data/eca-pol/blast/unique-hits-short-headers-1e-15-filtered-cdhit99.fasta -c 0.99`

## Phobius
Phobius is run at `https://phobius.sbc.su.se/`. The results are downloaded with "Save page as", "Web Page, complete" and saved in `data/wzy/phobius`.

## All-vs-all blast

Make the input fasta: `python src/all-vs-all-blast/make-all-vs-all-input-fasta.py`. This will create the file `data/wzy/all-vs-all-blast/seeds-and-unique-hits.fasta`.

Locally run `sh src/all-vs-all-blast/prepare-all-vs-all.sh data/wzy/all-vs-all-blast/seeds-and-unique-hits.fasta wzy`

On the HPC run `python3 /work3/idamei/wzy/all-vs-all-blast/prepare-all-vs-all.py /work3/idamei/wzy/all-vs-all-blast/db/seeds-and-unique-hits.fasta wzy`

And `sh /work3/idamei/wzy/all-vs-all-blast/submit.sh`

### Make network file

To make the network file run on the HPC:
`qrsh`

`python3 /work3/idamei/src/make-network-file.py wzy`.

Then gzip the network file: `gzip /work3/idamei/wzy/all-vs-all-blast/network`

Download the network file: `scp idamei@transfer.gbar.dtu.dk:/work3/idamei/wzy/all-vs-all-blast/network.gz data/wzy/all-vs-all-blast/`.

And unzip it: `gzip -d data/wzy/all-vs-all-blast/network.gz`

## SSN clustering

### Cluster
Fragment sequences are manually added to the file `data/wzy/blast/banned`.

To run the SSN, run `sh src/ssn-clustering/cluster/cluster.sh [timestamp] [expansion-threshold] [ssn-threshold] wzy`. (expansion-threshold is written as '1e-15')

This will create the folder `data/wzy/ssn-clusterings/[timestamp]` which contains `metadata.txt`, `info.txt`, `clusters.tsv`, `included.txt`, `network` and a folder `clusters`.

### Analyse clustering
When all jobs are finished, run locally: `sh src/ssn-clustering/analyse-clustering/analyse-clustering.sh [timestamp]`. This will create the ssn report, table, pymol script and HMMs in `data/wzy/ssn-clusterings/[timestamp]`.

To visualize alphafold models with conserved residues, run: `pymol data/wzy/ssn-clusterings/[timestamp]/pymol-visualization.pml`.

### Supercluster
Run HHblits all against all: `sh src/ssn-clustering/supercluster/hhblits.sh [ssn-timestamp]`. This will create a .hhr file for each cluster (in `data/wzy/ssn-clusterings/[timestamp]/clusters/[cluster]/[cluster.hhr]`).

To run superclustering pipeline, run: `sh src/ssn-clustering/supercluster/supercluster.sh [ssn_timestamp] [superclustering_timestamp] [superclustering_threshold]`. This will create the folder `data/wzy/ssn-clusterings/[ssn-timestamp]/superclusterings/[superclustering_timestamp]`.

### Analyse superclustering
Then, to analyse the superclustering, run: `sh src/ssn-clustering/analyse-superclustering/analyse-superclustering.sh [ssn-timestamp] [superclustering-timestamp]`. This will generate the superclustering report, table and HMMs in `data/wzy/ssn-clusterings/[ssn-timestamp]/superclusterings/[superclustering_timestamp]`.

### Make hmmscan db
(OBS: Don't run this twice) Cat all HMMs to one file `sh src/ssn-clustering/analyse-superclustering/make-hmmscan-supercluster-db.sh [ssn_timestamp] [superclustering_timestamp]`

Compress db: `hmmpress data/wzy/ssn-clusterings/$1/superclusterings/$2/hmmscan_db/hmmscan_db`

Test your query sequence like this: `hmmscan data/wzy/ssn-clusterings/2210171613/superclusterings/2210191051/hmmscan_db/hmmscan_db [query_fasta] > hmmscan.out`

## Phylogenetic trees

### Make iTOL label files
To make iTOL label files, run `python src/phylogenetic-trees/make-itol-label-files.py`. This will create label files in the folder `data/[enzyme_family]/phylogenetic-trees/itol-label-files`.

The MUSCLE tree is generated at: `https://www.ebi.ac.uk/Tools/msa/muscle/` by uploading `data/wzy/wzy.fasta`. This tree is saved as `data/wzy/phylogenetic-trees/trees/muscle-tree.nwk`.

### Make small tree for poster
The nodes that are wanted in the tree are added to `data/wzy/phylogenetic-trees/small-tree-poster/selected-nodes-small-tree.txt`.

To make a fasta file with the selected nodes that have a sugar, run `python src/phylogenetic-trees/prepare-small-tree.py`.

The fasta file (`data/wzy/phylogenetic-trees/small-tree-poster/selected-nodes-small-tree.fasta`) is uploaded to muscle website (https://www.ebi.ac.uk/Tools/msa/muscle/) and the tree is saved in `data/wzy/phylogenetic-trees/small-tree-poster/selected-nodes-small-tree.nwk`

## WaaL

### Make seeds and reduced hits fasta
To make fasta with seeds and redundancy reduced blast hits, run: `python src/waal-analysis/make-seeds-and-hits-fasta.py`.

This will generate the file `data/waal/seeds-and-reduced-hits.fasta`.

### Make initial MSA and tree
MSA: `mafft  --maxiterate 1000 --localpair --leavegappyregion --thread 7 data/waal/seeds-and-reduced-hits.fasta > data/waal/seeds-and-reduced-hits_mafft.fa`

FastTree: `fasttree data/waal/seeds-and-reduced-hits_mafft.fa > data/waal/seeds-and-reduced-hits_mafft.nwk`

Aclust tree:
`scp data/waal/seeds-and-reduced-hits.fasta idamei@transfer.gbar.dtu.dk:/work3/idamei/waal/tree-seeds-and-hits/`

On the HPC, run: `sh /work3/idamei/bin/aclust_example/aclust1.sh /work3/idamei/waal/tree-seeds-and-hits/ seeds-and-reduced-hits.fasta`

When all jobs are finished, run: `sh /work3/idamei/bin/aclust_example/aclust2.sh /work3/idamei/waal/tree-seeds-and-hits/ seeds-and-reduced-hits.fasta`

When the job is finished, download the tree file: `scp -r idamei@transfer.gbar.dtu.dk:/work3/idamei/waal/tree-seeds-and-hits/my.tree data/waal/seeds-and-reduced-hits-aclust.nwk`.

### Make clade fastas
(Lists of accessions are prepared from the tree in iTOL: `data/waal/clades/clade1/clade1` and `data/waal/clades/clade2/clade2`)
script not updated: `python src/waal-analysis/make-clade-fastas.py`

### Make clade MSAs
`mafft  --maxiterate 1000 --localpair --leavegappyregion --thread 4 data/waal/clades/clade1/clade1.fasta > data/waal/clades/clade1/clade1_mafft.fa`

`mafft  --maxiterate 1000 --localpair --leavegappyregion --thread 4 data/waal/clades/clade2/clade2.fasta > data/waal/clades/clade2/clade2_mafft.fa`

### Build HMMs
`hmmbuild data/waal/clades/clade1/clade1.hmm data/waal/clades/clade1/clade1_mafft.fa`

`hmmbuild data/waal/clades/clade2/clade2.hmm data/waal/clades/clade2/clade2_mafft.fa`

### HMM scan (check if the different HMMs overlap)
Make the database:
`cat data/waal/clades/clade1/clade1.hmm data/waal/clades/clade2-1/clade2-1.hmm data/waal/clades/clade2-2/clade2-2.hmm > data/waal/hmmscan/db/hmmdb`

Compress the database:
`hmmpress data/waal/hmmscan/db/hmmdb`

Run hmmscan:
`python src/waal-analysis/hmmscan.py`

### hmmsearch against genbank
Copy HMMs to HPC: `scp data/waal/clades/clade1/clade1.hmm data/waal/clades/clade2/clade2.hmm idamei@transfer.gbar.dtu.dk:/work3/idamei/waal/hmm`

On the HPC:
`qrsh`

`hmmsearch /work3/idamei/waal/hmm/clade1.hmm /work3/garryg/blast/db-/genbank.fa > /work3/idamei/waal/genbank-search/clade1-genbank.out`

`hmmsearch /work3/idamei/waal/hmm/clade2.hmm /work3/garryg/blast/db-/genbank.fa > /work3/idamei/waal/genbank-search/clade2-genbank.out`

Download the results:
`scp idamei@transfer.gbar.dtu.dk:/work3/idamei/waal/genbank-search/clade1-genbank.out data/waal/genbank-search/`
`scp idamei@transfer.gbar.dtu.dk:/work3/idamei/waal/genbank-search/clade2-genbank.out data/waal/genbank-search/`

To parse the genbank hmm search, run: `python src/genbank-search/parse-hmm-search.py waal`. This will create `data/waal/genbank-search/hits-evalue.tsv`

To retrieve the sequences of the hits, run: `scp data/waal/genbank-search/hits-evalue.tsv idamei@transfer.gbar.dtu.dk:/work3/idamei/waal/genbank-search/`

Then run: `blastdbcmd -db genbank -entry_batch /work3/idamei/waal/genbank-search/hits-evalue.tsv -dbtype prot > /work3/idamei/waal/genbank-search/hits.fasta`

`scp idamei@transfer.gbar.dtu.dk:/work3/idamei/waal/genbank-search/hits.fasta data/waal/genbank-search/`

### Make iTOL label files with e-values
`python src/waal-analysis/make-iTOL-labels-evalue.py`

### All-vs-all
`sh src/all-vs-all-blast/all-vs-all.sh data/waal/genbank-search/hits-1e-5.fasta waal`

On the HPC: `python3 /work3/idamei/waal/all-vs-all-blast/prepare-all-vs-all.py /work3/idamei/waal/all-vs-all-blast/db/hits-1e-5.fasta waal`

`sh /work3/idamei/waal/all-vs-all-blast/submit.sh`

### Make network file
To make the network file run on the HPC:
`qrsh`

`python3 /work3/idamei/src/make-network-file.py eca-pol waal`.

Download the network file: `scp idamei@transfer.gbar.dtu.dk:/work3/idamei/waal/all-vs-all-blast/network data/waal/all-vs-all-blast/`.

### SSN
`cd-hit -i data/waal/genbank-search/hits.fasta -o data/waal/genbank-search/hits-cdhit99.fasta -c 0.99`

`python src/ssn-clustering/cluster/get-clusters.py [timestamp] [expansion-threshold] [ssn-threshold] waal`

### Prepare list of accessions for CAZy
`python src/genbank-search/filter-hits.py waal 6e-23`. This will create the file `data/waal/genbank-search/hits-6e-23.txt`.

### Make MSA for CAZy family
Copy accession list to HPC: `scp -r data/waal/genbank-search/hits-6e-23.txt idamei@transfer.gbar.dtu.dk:/work3/idamei/waal/MSA_CAZy_family`

To get the fasta file, run on the HPC:
`qrsh`
(change BLASTDB to this in `~/.bashrc`: `export BLASTDB=/work3/garryg/blast/db-`)
`blastdbcmd -db genbank -entry_batch /work3/idamei/waal/MSA_CAZy_family/hits-6e-23.txt > /work3/idamei/waal/MSA_CAZy_family/hits-6e-23.fa`

Download fasta file: `scp -r idamei@transfer.gbar.dtu.dk:/work3/idamei/waal/MSA_CAZy_family/hits-6e-23.fa data/waal/MSA_CAZy_family`

Redundancy reduce: `cd-hit -i data/waal/MSA_CAZy_family/hits-6e-23.fa -o data/waal/MSA_CAZy_family/hits-6e-23-cdhit95.fa -c 0.95`

Run mafft: `mafft  --maxiterate 1000 --localpair --leavegappyregion --thread -1 data/waal/MSA_CAZy_family/hits-6e-23-cdhit95.fa > data/waal/MSA_CAZy_family/hits-6e-23-cdhit99_mafft.fa`

### Pymol visualization
To make the pymol visualization, run: `pymol src/waal-analysis/make-pymol-visualization.py`

To open in pymol, run `pymol data/waal/MSA_CAZy_family/pymol-visualization.pml`.

## ECA-Pol

### Make MSA
`mafft  --maxiterate 1000 --localpair --leavegappyregion data/eca-pol/MSA/unique-hits-short-headers-1e-15-filtered-cdhit99.fasta > data/eca-pol/MSA/unique-hits-short-headers-1e-15-filtered-cdhit99_mafft.fa`

### Build HMM
`hmmbuild data/eca-pol/hmm/eca-pol-mafft.hmm data/eca-pol/MSA/unique-hits-short-headers-1e-15-filtered-cdhit99_mafft.fa`

### hmmsearch against genbank
Copy HMM to HPC: `scp -r data/eca-pol/hmm/ idamei@transfer.gbar.dtu.dk:/work3/idamei/eca-pol/`

On the HPC:
`qrsh`
`hmmsearch /work3/idamei/eca-pol/hmm/eca-pol-mafft.hmm /work3/garryg/blast/db-/genbank.fa > /work3/idamei/eca-pol/genbank-search/eca-pol-genbank-mafft.out`

Download the results: `scp idamei@transfer.gbar.dtu.dk:/work3/idamei/eca-pol/genbank-search/eca-pol-genbank-mafft.out data/eca-pol/genbank-search/`

To parse the genbank hmm search, run: `python src/genbank-search/parse-hmm-search.py eca-pol`. This will create `data/eca-pol/genbank-search/hits-evalue.tsv`

To retrieve the sequences of the hits, run: `scp data/eca-pol/genbank-search/hits-evalue.tsv idamei@transfer.gbar.dtu.dk:/work3/idamei/eca-pol/genbank-search/`

Then run on the hpc: 
`qrsh`
`blastdbcmd -db genbank -entry_batch /work3/idamei/eca-pol/genbank-search/hits-evalue.tsv -dbtype prot > /work3/idamei/eca-pol/genbank-search/hits.fasta`

`scp idamei@transfer.gbar.dtu.dk:/work3/idamei/eca-pol/genbank-search/hits.fasta data/eca-pol/genbank-search/`

### Make iTOL label files with e-values
`python src/waal-analysis/make-iTOL-labels-evalue.py`

### All-vs-all
Filter the hits: `python src/genbank-search/filter-hits.py eca-pol`.

`sh src/all-vs-all-blast/all-vs-all.sh data/eca-pol/genbank-search/hits.fasta eca-pol`

On the HPC: `python3 /work3/idamei/eca-pol/all-vs-all-blast/prepare-all-vs-all.py /work3/idamei/eca-pol/all-vs-all-blast/db/hits.fasta eca-pol`

`sh /work3/idamei/eca-pol/all-vs-all-blast/submit.sh`

### Make network file
To make the network file run on the HPC:
`qrsh`

`python3 /work3/idamei/src/make-network-file.py eca-pol`.

Download the network file: `scp idamei@transfer.gbar.dtu.dk:/work3/idamei/eca-pol/all-vs-all-blast/network data/eca-pol/all-vs-all-blast/`.

### SSN
`cd-hit -i data/eca-pol/genbank-search/hits.fasta -o data/eca-pol/genbank-search/hits-cdhit99.fasta -c 0.99`

`python src/ssn-clustering/cluster/get-clusters.py [timestamp] [expansion-threshold] [ssn-threshold] eca-pol`

### Prepare list of accessions for CAZy
`python src/genbank-search/filter-hits.py eca-pol 1e-40`. This creates the file `data/eca-pol/genbank-search/hits-1e-40.txt` with accessions to include in the CAZy family.

### Make MSA for CAZy family
Copy accession list to HPC: `scp -r data/eca-pol/genbank-search/hits-1e-40.txt idamei@transfer.gbar.dtu.dk:/work3/idamei/eca-pol/MSA_CAZy_family`

To get the fasta file, run on the HPC:
`qrsh`
(change BLASTDB to this in `~/.bashrc`: `export BLASTDB=/work3/garryg/blast/db-`)
`blastdbcmd -db genbank -entry_batch /work3/idamei/eca-pol/MSA_CAZy_family/hits-1e-40.txt > /work3/idamei/eca-pol/MSA_CAZy_family/hits-1e-40.fa`

Download fasta file: `scp -r idamei@transfer.gbar.dtu.dk:/work3/idamei/eca-pol/MSA_CAZy_family/hits-1e-40.fa data/eca-pol/MSA_CAZy_family`

Redundancy reduce: `cd-hit -i data/eca-pol/MSA_CAZy_family/hits-1e-40.fa -o data/eca-pol/MSA_CAZy_family/hits-1e-40-cdhit95.fa -c 0.95`

Run mafft: `mafft  --maxiterate 1000 --localpair --leavegappyregion data/eca-pol/MSA_CAZy_family/hits-1e-40-cdhit95.fa > data/eca-pol/MSA_CAZy_family/hits-1e-40-cdhit99_mafft.fa`

### Make Pymol visualization
To make the pymol visualization, run: `python src/eca-pol-analysis/make-pymol-visualization.py`

To open in pymol, run: `pymol data/eca-pol/MSA_CAZy_family/pymol-visualization.pml`.
