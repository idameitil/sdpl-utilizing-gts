# Put msas in folder
python src/ssn-clustering/supercluster-analysis/make-msa-folder.py $1

# Make database
cd data/wzy/ssn-clusterings/$1/hhsearchdb/msa
ffindex_build -s ../hhsearchdb_msa.ff{data,index} .
cd ..

ffindex_apply hhsearchdb_msa.ff{data,index} -i hhsearchdb_a3m_wo_ss.ffindex -d hhsearchdb_a3m_wo_ss.ffdata -- hhconsensus -M 50 -maxres 65535 -i stdin -oa3m stdout -v 0

mv hhsearchdb_a3m_wo_ss.ffdata hhsearchdb_a3m.ffdata

mv hhsearchdb_a3m_wo_ss.ffindex hhsearchdb_a3m.ffindex

ffindex_apply hhsearchdb_a3m.ff{data,index} -i hhsearchdb_hhm.ffindex -d hhsearchdb_hhm.ffdata -- hhmake -i stdin -o stdout -v 0

cstranslate -f -x 0.3 -c 4 -I a3m -i hhsearchdb_a3m -o hhsearchdb_cs219

sort -k3 -n -r hhsearchdb_cs219.ffindex | cut -f1 > sorting.dat

ffindex_order sorting.dat hhsearchdb_hhm.ff{data,index} hhsearchdb_hhm_ordered.ff{data,index}

mv hhsearchdb_hhm_ordered.ffindex hhsearchdb_hhm.ffindex

mv hhsearchdb_hhm_ordered.ffdata hhsearchdb_hhm.ffdata

cd ../../../../..

# Run hhblits
python src/ssn-clustering/supercluster-analysis/run-hhblits.py $1