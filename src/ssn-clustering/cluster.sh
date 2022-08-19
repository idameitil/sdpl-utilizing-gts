echo "\n*** RUNNING get-clusters.py ***\n"
python src/ssn-clustering/get-clusters.py $1 $2 $3
echo "\n*** RUNNING prepare-cluster-alignments.py ***\n"
python src/ssn-clustering/prepare-cluster-alignments.py $1

echo "\n*** COPYING FOLDER TO THE HPC ***\n"
scp -r data/wzy/ssn-clusterings/$1 idamei@transfer.gbar.dtu.dk:/work3/idamei/wzy/ssn-clusterings/

# echo "\n*** STARTING JOBS ON HPC ***\n"
# ssh -l idamei login1.gbar.dtu.dk 'sh /work3/idamei/ssn-clusterings/clustering/$1/submit.sh'

#echo "\n*** RUNNING make-report.py ***\n"
#python src/ssn-clustering/make-report.py $1

#echo "\n*** CONVERTING REPORT TO HTML ***\n"
#pandoc data/wzy/ssn-clusterings/$1/report.md -o data/wzy/ssn-clusterings/$1/report.html -f gfm