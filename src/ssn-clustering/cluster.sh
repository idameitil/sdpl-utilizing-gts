echo "\n*** RUNNING get-clusters.py ***\n"
python src/ssn-clustering/get-clusters.py $1
echo "\n*** RUNNING prepare-cluster-alignments.py ***\n"
python src/ssn-clustering/prepare-cluster-alignments.py $1

echo "\n*** STARTING JOBS ON HPC ***\n"
scp -r data/wzy/ssn-clusterings/clustering/$1 idamei@transfer.gbar.dtu.dk:/work3/idamei/ssn-clusterings/clustering/

# ssh -l idamei login1.gbar.dtu.dk 'sh /work3/idamei/ssn-clusterings/clustering/$1/submit.sh'

# echo "\n*** RUNNING make-markdown.py ***\n"
# python src/ssn-clustering/make-markdown.py $1