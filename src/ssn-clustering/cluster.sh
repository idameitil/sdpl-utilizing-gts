src/ssn-clustering/get-clusters.py $1
src/ssn-clustering/prepare-cluster-alignments.py $1
scp -r data/wzy/ssn-clusterings/clustering/$1 idamei@transfer.gbar.dtu.dk:/work3/idamei/ssn-clusterings/clustering/

ssh -l idamei login1.gbar.dtu.dk 'sh /work3/idamei/ssn-clusterings/clustering/$1/submit.sh'

src/ssn-clustering/make-markdown.py $1