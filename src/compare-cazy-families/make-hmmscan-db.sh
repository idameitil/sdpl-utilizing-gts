mkdir data/hhblits_cazy_families/hmmscan_db

for FILENAME in data/hhblits_cazy_families/hmms-family-names/*; do
    cat $FILENAME >> data/hhblits_cazy_families/hmmscan_db/hmmscan_db
done