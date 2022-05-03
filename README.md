# 

## Collecting data and preprocessing

Manually curated Wzys from papers are added to `data/selected-wzys.tsv`

The DNA records for the Wzys were downloaded using NCBI batch entry. They are stored in `data/selected_OAGCs.gb` (Some are O-antigen gene clusters, some are whole genome sequences)

### Enriching Wzy table with sugars and taxonomy
To enrich the selected wzys with csdb sugars and taxonomy run `src/data-collection-and-preprocessing/enrich-wzys.py`
This will create the file `data/wzy/wzy.tsv`

## Retrieving Wzxs and Wzzs
To retrieve the Wzx and Wzz entries run `src/data-collection-and-preprocessing/`

### Expanding with Blast
We use the HPC to 

To create the job files required use `src/data-collection-and-preprocessing/gen_hpc_blast_jobs.py`



## Explorations


## Clustering 