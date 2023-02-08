for VARIABLE in 'X605' 'X606' 'X607' 'X608' 'X609' 'X610' 'X611' 'X612' 'X613' 'X614' 'X617'
do
    efetch -db protein -format fasta -input data/wzy/seed-cazy-search/seeds-in-families/$VARIABLE.acc > data/wzy/seed-cazy-search/seeds-in-families/$VARIABLE.fa
done