echo "\n*** RUNNING get-clusters.py ***\n"
python src/ssn-clustering/get-clusters.py $1 $2 $3
echo "\n*** RUNNING prepare-cluster-alignments.py ***\n"
python src/ssn-clustering/prepare-cluster-alignments.py $1

echo "\n*** COPYING FOLDER TO THE HPC ***\n"
scp -r data/wzy/ssn-clusterings/$1 idamei@transfer.gbar.dtu.dk:/work3/idamei/wzy/ssn-clusterings/