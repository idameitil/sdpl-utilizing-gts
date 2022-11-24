mkdir data/wzy/ssn-clusterings/$1/superclusterings/$2/hmmscan_db

for FOLDER in data/wzy/ssn-clusterings/$1/superclusterings/$2/superclusters/*; do
    cat $FOLDER/*.hmm >> data/wzy/ssn-clusterings/$1/superclusterings/$2/hmmscan_db/hmmscan_db
done