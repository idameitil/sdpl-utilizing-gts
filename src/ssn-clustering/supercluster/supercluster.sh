python src/ssn-clustering/supercluster/make-files.py $1 $2 $3

python src/ssn-clustering/supercluster/make-hmm-edge-file.py $1 $2 $3

python src/ssn-clustering/supercluster/get-superclusters.py $1 $2 $3

# python src/ssn-clustering/supercluster/prepare-supercluster-alignments.py $1 $2
echo "\n*** MAKING ALIGNMENTS ***\n"
python python src/ssn-clustering/supercluster/make-supercluster-alignments.py $1 $2