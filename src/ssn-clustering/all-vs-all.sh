
ssh -l idamei login1.gbar.dtu.dk mkdir /work3/idamei/ssn-clusterings/all-vs-all-blast/$1

scp src/ssn-clustering/prepare-all-vs-all.py idamei@transfer.gbar.dtu.dk:/work3/idamei/ssn-clusterings/all-vs-all-blast/$1/
scp data/wzy/blast/unique-hits-short-headers.fasta idamei@transfer.gbar.dtu.dk:/work3/idamei/ssn-clusterings/all-vs-all-blast/$1/
scp data/wzy/wzy.fasta idamei@transfer.gbar.dtu.dk:/work3/idamei/ssn-clusterings/all-vs-all-blast/$1/

#ssh -l idamei login1.gbar.dtu.dk python3 /work3/idamei/ssn-clusterings/$1/prepare-all-vs-all.py $1

#ssh -l idamei login1.gbar.dtu.dk sh /work3/idamei/ssn-clusterings/$1/submit.sh