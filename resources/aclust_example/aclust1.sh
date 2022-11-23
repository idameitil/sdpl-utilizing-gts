cd $1

sed 's/ .*$//' $2 | chunkfasta -c 10 -- > chunkfasta.out

mkdir run

/work3/idamei/bin/aclust_example/runalignfastas.py > submit.sh

sh submit.sh