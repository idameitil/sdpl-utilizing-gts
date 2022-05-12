src/ssn-clustering/get-clusters.py $1
src/ssn-clustering/prepare-cluster-alignments.py $1
scp -r data/wzy/ssn-clusterings/clustering/$1 idamei@transfer.gbar.dtu.dk:/work3/idamei/ssn-clusterings/clustering/