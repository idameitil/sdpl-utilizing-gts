echo "\n*** PREPARING DIRECTORY ***\n"
python src/ssn-clustering/supercluster/make-files.py $1 $2 $3
echo "\n*** MAKING HMM EDGE FILE ***\n"
python src/ssn-clustering/supercluster/make-hmm-edge-file.py $1 $2 $3
echo "\n*** GETTING SUPERCLUSTERS ***\n"
python src/ssn-clustering/supercluster/get-superclusters.py $1 $2 $3
echo "\n*** MAKING ALIGNMENTS ***\n"
# python src/ssn-clustering/supercluster/prepare-supercluster-alignments.py $1 $2
python src/ssn-clustering/supercluster/make-supercluster-alignments.py $1 $2