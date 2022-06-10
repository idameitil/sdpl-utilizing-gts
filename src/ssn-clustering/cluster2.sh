echo "\n*** DOWNLOADING ALIGNMENTS AND LOGOS FROM HPC ***\n"
scp -r idamei@transfer.gbar.dtu.dk:/work3/idamei/ssn-clusterings/$1/clusters/ data/wzy/ssn-clusterings/$1

echo "\n*** CONVERTING LOGOS TO PDF ***\n"
python3 src/ssn-clustering/convert-logos-to-pdf.py $1

echo "\n*** GENARATING MARKDOWN REPORT ***\n"
python src/ssn-clustering/make-markdown.py $1

echo "\n*** CONVERTING REPORT TO HTML ***\n"
pandoc data/wzy/ssn-clusterings/$1/report.md -o data/wzy/ssn-clusterings/$1/report.html -f gfm

echo "\n*** GENERATING PYMOL SCRIPT ***\n"
python src/ssn-clustering/make-pymol-script.py $1