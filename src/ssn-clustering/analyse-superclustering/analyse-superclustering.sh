# echo "\n*** DOWNLOADING ALIGNMENTS FROM HPC ***\n"
# scp -r idamei@transfer.gbar.dtu.dk:/work3/idamei/wzy/ssn-clusterings/$1/superclusterings/$2 data/wzy/ssn-clusterings/$1/superclusterings/

echo "\n*** GENERATING REPORT ***\n"
python src/ssn-clustering/analyse-superclustering/make-report-superclusters.py $1 $2

echo "\n*** GENERATING SUMMARY TABLE ***\n"
python src/ssn-clustering/analyse-superclustering/make-table-superclusters.py $1 $2

echo "\n*** MAKING STEREOCHEMISTRY PLOT ***\n"
python src/ssn-clustering/analyse-superclustering/plot-stereochemistry.py $1 $2

echo "\n*** MAKING PYMOL SCRIPT ***\n"
python src/ssn-clustering/analyse-superclustering/make-pymol-script-superclusters.py $1 $2

echo "\n*** BUILDING HMMS ***\n"
python src/ssn-clustering/analyse-superclustering/build-hmms-superclusters.py $1 $2