
# ssh -l idamei login1.gbar.dtu.dk mkdir /work3/idamei/wzy/all-vs-all-blast/

scp src/all-vs-all-blast/prepare-all-vs-all.py idamei@transfer.gbar.dtu.dk:/work3/idamei/wzy/all-vs-all-blast/
scp data/wzy/blast/unique-hits-short-headers.fasta idamei@transfer.gbar.dtu.dk:/work3/idamei/wzy/all-vs-all-blast/
scp data/wzy/wzy.fasta idamei@transfer.gbar.dtu.dk:/work3/idamei/wzy/all-vs-all-blast/

#ssh -l idamei login1.gbar.dtu.dk python3 /work3/idamei/ssn-clusterings/$1/prepare-all-vs-all.py $1

#ssh -l idamei login1.gbar.dtu.dk sh /work3/idamei/ssn-clusterings/$1/submit.sh