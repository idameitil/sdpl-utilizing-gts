echo "\n*** RUNNING get-clusters.py ***\n"
python src/ssn-clustering/cluster/get-clusters.py $1 $2 $3 $4
echo "\n*** WRITING CLUSTER FILES ***\n"
python src/ssn-clustering/cluster/write-cluster-files.py $1
# echo "\n*** RUNNING prepare-cluster-alignments.py ***\n"
# python src/ssn-clustering/cluster/prepare-cluster-alignments.py $1
echo "\n*** MAKING iTOL LABEL FILES ***\n"
python src/ssn-clustering/cluster/make-cluster-itol-labels.py $1
echo "\n*** MAKING ALIGNMENTS ***\n"
python src/ssn-clustering/cluster/make-cluster-alignments.py $1
# echo "\n*** COPYING FOLDER TO THE HPC ***\n"
# scp -r data/wzy/ssn-clusterings/$1 idamei@transfer.gbar.dtu.dk:/work3/idamei/$4/ssn-clusterings/