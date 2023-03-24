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

Add to wzy_polymerases repo (`wzy_polymerases/csdb/snfg/3/`) and push.

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
To parse the blast expansion output files into json format, run `python src/data-collection-and-preprocessing/run-blastfilter.py [enzyme-family]`. Where `enzyme-family` is `wzy`, `wzx`, `wzz`, `waal` or `eca-pol`.

This will create the files `data/eca-pol/blast/run/*/blast.js`.

### Make unique-hits file
To create `unique-hits.tsv`, run `python src/data-collection-and-preprocessing/make-unique-hits-file.py [enzyme-family]`.

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

FOR WAAL: `python src/data-collection-and-preprocessing/filter-waal-eca-pol-blast-hits.py waal 280 500 [pct_threshold]`

`cd-hit -i data/waal/blast/unique-hits-short-headers-[pct_threshold]-filtered.fasta -o data/waal/blast/unique-hits-short-headers-[pct_threshold]-filtered-cdhit[cd-hit-threshold].fasta -c [cd-hit-threshold]`

FOR ECA-POL: `python src/data-collection-and-preprocessing/filter-waal-eca-pol-blast-hits.py eca-pol 400 500 57`

`cd-hit -i data/eca-pol/blast/unique-hits-short-headers-57-filtered.fasta -o data/eca-pol/blast/unique-hits-short-headers-57-filtered-cdhit[cd-hit-threshold].fasta -c [cd-hit-threshold]`

## Make seeds and hits fasta for Waal and ECA-Pol

To make fasta with seeds and redundancy reduced blast hits, run: `python src/data-collection-and-preprocessing/make-seeds-and-hits-fasta-waal-eca-pol.py [enzyme-family] [blast_threshold] [cdhit-threshold]`.

This will generate the file `data/[enzyme-family]/seeds-and-hits[blast_threshold]-cdhit[cdhit_threshold].fasta`.

## Phylogenetic trees

### Make iTOL label files
To make iTOL label files, run `python src/phylogenetic-trees/make-itol-label-files.py`. This will create label files in the folder `data/[enzyme_family]/phylogenetic-trees/itol-label-files`.

The MUSCLE tree is generated at: `https://www.ebi.ac.uk/Tools/msa/muscle/` by uploading `data/wzy/wzy.fasta`. This tree is saved as `data/wzy/phylogenetic-trees/trees/muscle-tree.nwk`.

### Make small tree for poster
The nodes that are wanted in the tree are added to `data/wzy/phylogenetic-trees/small-tree-poster/selected-nodes-small-tree.txt`.

To make a fasta file with the selected nodes that have a sugar, run `python src/phylogenetic-trees/prepare-small-tree.py`.

The fasta file (`data/wzy/phylogenetic-trees/small-tree-poster/selected-nodes-small-tree.fasta`) is uploaded to muscle website (https://www.ebi.ac.uk/Tools/msa/muscle/) and the tree is saved in `data/wzy/phylogenetic-trees/small-tree-poster/selected-nodes-small-tree.nwk`

### Combine family trees
To combine all family trees into one, run `python src/phylogenetic-trees/combine-trees.py`.

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

This will create the folder `data/wzy/ssn-clusterings/[timestamp]` which contains `metadata.txt`, `info.txt`, `clusters.tsv`, `included_accessions.txt`, `network` and a folder `clusters`.

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

### Search genbank
For each supercluster: 
- get `data/wzy/ssn-clusterings/2210171613/superclusterings/2210191051/superclusters/0284_3_9/0284_3_9.accs_pruned` from Garry
- run  `efetch -db protein -format fasta -input data/wzy/ssn-clusterings/2210171613/superclusterings/2210191051/superclusters/0284_3_9/0284_3_9.accs_pruned > data/wzy/ssn-clusterings/2210171613/superclusterings/2210191051/superclusters/0284_3_9/0284_3_9.accs_pruned.fasta`
- run `mafft  --maxiterate 1000 --localpair --leavegappyregion --reorder --thread 7 data/wzy/ssn-clusterings/2210171613/superclusterings/2210191051/superclusters/0284_3_9/0284_3_9.accs_pruned.fasta > data/wzy/ssn-clusterings/2210171613/superclusterings/2210191051/superclusters/0284_3_9/0284_3_9.accs_pruned-mafft.fa`
- run `hmmbuild data/wzy/ssn-clusterings/2210171613/superclusterings/2210191051/superclusters/0284_3_9/0284_3_9.accs_pruned-mafft.hmm data/wzy/ssn-clusterings/2210171613/superclusterings/2210191051/superclusters/0284_3_9/0284_3_9.accs_pruned-mafft.fa`

`python src/ssn-clustering/genbank-search-superclusters.py`

`scp -r data/wzy/ssn-clusterings/2210171613/superclusterings/2210191051 idamei@transfer.gbar.dtu.dk:/work3/idamei/wzy/ssn-clusterings/2210171613/superclusterings`

On the HPC: `sh /work3/idamei/wzy/ssn-clusterings/2210171613/superclusterings/2210191051/submit-genbank-search.sh`

OBS: 0221_4 is an ssn cluster from 1085, which was too big. The hmmsearch for this one has not been run yet. 

Download the results:
`scp -r idamei@transfer.gbar.dtu.dk:/work3/idamei/wzy/ssn-clusterings/2210171613/superclusterings/2210191051 data/wzy/ssn-clusterings/2210171613/superclusterings`

This will create `data/wzy/ssn-clusterings/2210171613/superclusterings/2210191051/superclusters/[supercluster_name]/[supercluster_name].accs_pruned-mafft-genbank-search.out`

To parse the genbank hmm search, run: `python src/genbank-search/parse-hmm-search.py wzy`. This will create `data/wzy/ssn-clusterings/2210171613/superclusterings/2210191051/superclusters/[supercluster_name]/hits-evalue.tsv`

### Generation of CAZy families
The superclustering run `data/wzy/ssn-clusterings/2210171613/superclusterings/2210191051` was used for generating the families. However, along the way of pruning the sueprclusters, we decided that 160 was a better threshold. Instead of redoing the pruning with a new superclustering, we kept going with this one and just removed SSN clusters connected only by edges <160. A list of the alignments for each family including which SSN clusters were removed, is found in `references.md` under "# CAZy families".

### Seed CAZy search
The list of Wzy seeds (`data/wzy/wzy.fasta`) was scanned against the CAZy families by Bernard. The output file is saved in `data/wzy/seed-cazy-search/seeds_newhmm.txt`.

The html stuff was removed from the file ('top <#top>    '): `data/wzy/seed-cazy-search/seeds_newhmm-cleaned.txt`.

The HMM file was parsed with `pyhton src/wzy-seed-search/parse-hmm.py`, which created the file `data/wzy/seed-cazy-search/best_hmm_hits.tsv`.
(before this the file `data/wzy/seed-cazy-search/hmm_hits.tsv` was generated).

The fasta files were generated with efetch: `src/wzy-seed-search/efetch.sh`.

Each fasta file was uploaded to muscle and the trees were saved in `data/wzy/seed-cazy-search/seeds-in-families`.

A table with original supercluster membership and CAZy family membership is generated with: `python src/wzy-seed-search/put-family-in-wzy-table.py`. This creates the file `data/wzy/wzy_with_cazy_family.ts`. 

Bernard added the seeds with high e-values to CAZy. He sent a file `data/wzy/wzy_with_cazy_family_accessions.xls` with the CAZy IDs (2nd of March 2023).

## WaaL

### Make seed MSA
`mafft data/waal/waal.fasta > data/waal/waal_mafft.fa`

### Make initial MSA and tree
`mafft  --maxiterate 1000 --localpair --leavegappyregion --reorder --thread 7 data/waal/seeds-and-hits1e-60-cdhit95.fasta > data/waal/seeds-and-hits1e-60-cdhit95_mafft_maxit1000.fa`

Aclust tree:
`scp data/waal/seeds-and-reduced-hits.fasta idamei@transfer.gbar.dtu.dk:/work3/idamei/waal/tree-seeds-and-hits/`

On the HPC, run: `sh /work3/idamei/bin/aclust_example/aclust1.sh /work3/idamei/waal/tree-seeds-and-hits/ seeds-and-reduced-hits.fasta`

When all jobs are finished, run: `sh /work3/idamei/bin/aclust_example/aclust2.sh /work3/idamei/waal/tree-seeds-and-hits/ seeds-and-reduced-hits.fasta`

When the job is finished, download the tree file: `scp idamei@transfer.gbar.dtu.dk:/work3/idamei/waal/tree-seeds-and-hits/my.tree data/waal/seeds-and-reduced-hits-aclust.nwk`.

### CAZy family
Garry pruned the ligase accessions based on `data/waal/seeds-and-hits1e-60-cdhit95-pruned.fasta`. His pruned list is in `data/waal/seeds-and-hits1e-60-cdhit95-pruned2.accs`. He then generated a tree with these, "https://itol.embl.de/tree/1923890169346361673971155#". It was decided to make four subfamilies. 

For each subfamily:
- A folder was created `data/waal/final_subfamilies/subfamily1` etc.
- The list of accessions from the tree was saved in `data/waal/final_subfamilies/subfamily1/accessions`
- A fasta with these was generated `data/waal/final_subfamilies/subfamily1/accessions.fa`
- It was pruned: `data/waal/final_subfamilies/subfamily1/accessions-pruned.fa`
- An alignment was generated: `data/waal/final_subfamilies/subfamily1/accessions-pruned-mafft.fa`

All the pruned fastas of the subfamilies were combined into `data/waal/final_family/ligase.fa` and an alignment was made.

### Build HMM
`hmmbuild data/waal/seeds-and-hits1e-60-cdhit95_mafft_maxit1000.hmm data/waal/seeds-and-hits1e-60-cdhit95_mafft_maxit1000.fa`

### hmmsearch against genbank (this was not used)
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

### Prepare list of accessions for CAZy (this was not used)
`python src/genbank-search/filter-hits.py waal 6e-23`. This will create the file `data/waal/genbank-search/hits-6e-23.txt`.

## ECA-Pol

### Make seed MSA
`mafft data/eca-pol/eca-pol.fasta > data/eca-pol/eca-pol_mafft.fa`

### Get list of accessions
From Garry's hr1 tree of reblasted ECA-Pols (https://itol.embl.de/tree/1923890169486281673015321), the biggest clade was selected and the labels were copied ("Copy leaf labels") and pasted into `data/eca-pol/MSA_CAZy_family/accessions_clade1`.

A fasta file with all the reblasting hits was obtained from Garry (length-filtered 400-520):
`data/eca-pol/MSA_CAZy_family/reblast_hits.fasta`

A fasta file with only the sequences from clade1 was generated by running: `python src/eca-pol-analysis/make-fasta-accessions-include.py`

This generates the file `data/eca-pol/MSA_CAZy_family/clade1.fasta`

### Pruning
This set of sequences was pruned manually into `data/eca-pol/MSA_CAZy_family/clade1-pruned.fa`.

A new alignment for the pruned set was made by: `mafft  --maxiterate 1000 --localpair --leavegappyregion --thread 7 --reorder data/eca-pol/MSA_CAZy_family/clade1-pruned.fa > data/eca-pol/MSA_CAZy_family/clade1-pruned-mafft.fa`.

### Generation of CAZy family
The file `data/eca-pol/MSA_CAZy_family/clade1-pruned-mafft.fa` was sent to Vincent and he created a new HMM for family X586 (called Ida, I think).

### Build HMM
`hmmbuild data/eca-pol/MSA_CAZy_family/clade1-pruned-mafft.hmm data/eca-pol/MSA_CAZy_family/clade1-pruned-mafft.fa`

### hmmsearch against genbank
Copy HMM to HPC: `scp -r data/eca-pol/MSA_CAZy_family/clade1-pruned-mafft.hmm idamei@transfer.gbar.dtu.dk:/work3/idamei/eca-pol/`

On the HPC:
`qrsh`
`hmmsearch /work3/idamei/eca-pol/clade1-pruned-mafft.hmm /work3/garryg/blast/db-/genbank.fa > /work3/idamei/eca-pol/genbank-search/eca-pol-genbank-mafft.out`

Download the results: `scp idamei@transfer.gbar.dtu.dk:/work3/idamei/eca-pol/genbank-search/eca-pol-genbank-mafft.out data/eca-pol/genbank-search/`

### Parse genbank search
To parse the genbank hmm search, run: `python src/genbank-search/parse-hmm-search.py eca-pol`. This will create `data/eca-pol/genbank-search/hits-evalue.tsv`

### Retrieve genbank sequences
To retrieve the sequences of the hits, run: `scp data/eca-pol/genbank-search/hits-evalue.tsv idamei@transfer.gbar.dtu.dk:/work3/idamei/eca-pol/genbank-search/`

Then run on the hpc: 
`qrsh`
`blastdbcmd -db genbank -entry_batch /work3/idamei/eca-pol/genbank-search/hits-evalue.tsv -dbtype prot > /work3/idamei/eca-pol/genbank-search/hits.fasta`
And: `blastdbcmd -db genbank -entry_batch /work3/idamei/eca-pol/genbank-search/hits-evalue.tsv -outfmt "%a ,%L ,%T ,%t ,%s" > /work3/idamei/eca-pol/genbank-search/hits.csv`
(Change `db` in `~/.bashrc` to `db-` and `source ~/.bashrc`)

`scp idamei@transfer.gbar.dtu.dk:/work3/idamei/eca-pol/genbank-search/hits.fasta data/eca-pol/genbank-search/`
`scp idamei@transfer.gbar.dtu.dk:/work3/idamei/eca-pol/genbank-search/hits.csv data/eca-pol/genbank-search/`

### Make iTOL label files with e-values
`python src/phylogenetic-trees/make-itol-label-files.py`

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

## RodA
A fasta file of family X571 (RodA) was downloaded with "Fetch fasta" (Fields ticked: "Public Sequences", "Add Frags,Splicing" and "Add (0-0) Sequences"). It is located in `data/roda/cazyX571.fa`.

It was redundancy reduced: `cd-hit -i data/roda/cazyX571.fa -o data/roda/cazyX571-cdhit0.8.fa -c 0.8`.

And an alignments was made `mafft  --maxiterate 1000 --localpair --leavegappyregion --reorder --thread 7 data/roda/cazyX571-cdhit0.8.fa > data/roda/cazyX571-cdhit0.8-mafft.fa`.

## Comparison of families
All fastas of the families were copied to `data/hhblits_cazy_families/fastas`.

All MSAs were copied to `data/hhblits_cazy_families/msa`.

To run the hhblits comparisons, run: `sh src/compare-cazy-families/hhblits.sh`.

The output files are in `data/hhblits_cazy_families/output`.

## Test your query sequence
Build family HMMs: `python src/compare-cazy-families/build-hmms.py`

Make hmmscan db: `sh src/compare-cazy-families/make-hmmscan-db.sh`

Compress the db: `hmmpress data/hhblits_cazy_families/hmmscan_db/hmmscan_db`

Test your query sequence like this: `hmmscan data/hhblits_cazy_families/hmmscan_db/hmmscan_db [query_fasta] > hmmscan.out`

## Pymol visualization
(Old)
To make pymol script including all families, run: `python src/pymol-visualization/make-pymol-script-all-families.py`.

Then, to run the pymol script without making the images: `pymol data/pymol-visualizations/pymol-script.pml`.

Or run the pymol script with making the images: `pymol data/pymol-visualizations/pymol-script-make-images.pml`.

This will create the figures in `data/pymol-visualizations/figures`.

(New, with only one model per family)
To make pymol script including all families, run: `src/pymol-visualization/make-pymol-script-selected.py`.

Then, to run the pymol script without making the images: `pymol data/pymol-visualizations/pymol-script-selected.pml`.

Or run the pymol script with making the images: `pymol data/pymol-visualizations/pymol-script-selected-make-images.pml`.

This will create the figures in `data/pymol-visualizations/figures-selected`.

## Compare architecture (figure)
(Old) The architectures were manually written from the alphafold structures in pymol into `data/compare-architectures/architecture-tables/[acc].csv`.

The secondary structure is retrieved for each structure by running `python src/compare-architectures/run-dssp.py`. This creates the tables in `data/compare-architectures/data/compare-architectures/architecture-tables-dssp`. 

These files are copied to `data/compare-architectures/architecture-tables-dssp-with-tm` and the TM regions are manually annotated by looking at the structures in pymol.

The architecture and conserved residue files are generated by running: `python src/compare-architectures/make-architecture-data.py`. This creates the files `architecture.js`and `conserved_[threshold].js`.

The html file is in `data/compare-architectures/arch.html`, in which the threshold can also be changed. The javascript file is in `data/compare-architectures/arch.js`.

## WadA
The sequence of the WadA from "Lipopolysaccharide biosynthesis and traffic in the envelope of the pathogen Brucella abortus" was written into `data/wada/wadA.fa`, and the N-terminal domain was removed.

The sequence was blasted against NR on the HPC.

The file was downloaded: `scp idamei@transfer.gbar.dtu.dk:/work3/idamei/single_blast/wadA/blast.out data/wada/`

`blastfilter -js data/wada/blast.out > data/wada/blast.js`  if it gives an error, add a " 0" to the line "Query= WadA" line

`python src/wada/make-hits-file.py`

Open `data/wada/hits.tsv` in excel and copy all accessions with e-value smaller than e-40 to >`data/wada/hits-e-40.txt`

`efetch -db protein -format fasta -input data/wada/hits-e-40.txt > data/wada/hits-e-40.fa`

`cd-hit -i data/wada/hits-e-40.fa -o data/wada/hits-e-40-cdhit0.95.fa -c 0.95`

`mafft  --maxiterate 1000 --localpair --leavegappyregion --reorder --thread 7 data/wada/hits-e-40-cdhit0.95.fa > data/wada/hits-e-40-cdhit0.95-mafft.fa`

The N-terminal domains were removed and the alignment was pruned: `data/wada/hits-e-40-cdhit0.95-pruned.fa`

`mafft  --maxiterate 1000 --localpair --leavegappyregion --reorder --thread 7 data/wada/hits-e-40-cdhit0.95-pruned.fa > data/wada/hits-e-40-cdhit0.95-pruned-mafft.fa`

The alignment `data/wada/hits-e-40-cdhit0.95-pruned-mafft.fa` was sent to Bernard.