# Make db
cd data/hhblits_cazy_families/msa

ffindex_build -s ../hhblits_cazy_families_msa.ff{data,index} .
cd ..

ffindex_apply hhblits_cazy_families_msa.ff{data,index} -i hhblits_cazy_families_a3m_wo_ss.ffindex -d hhblits_cazy_families_a3m_wo_ss.ffdata -- hhconsensus -M 50 -maxres 65535 -i stdin -oa3m stdout -v 0

rm hhblits_cazy_families_msa.ff{data,index}

mv hhblits_cazy_families_a3m_wo_ss.ffdata hhblits_cazy_families_a3m.ffdata

mv hhblits_cazy_families_a3m_wo_ss.ffindex hhblits_cazy_families_a3m.ffindex

ffindex_apply hhblits_cazy_families_a3m.ff{data,index} -i hhblits_cazy_families_hhm.ffindex -d hhblits_cazy_families_hhm.ffdata -- hhmake -i stdin -o stdout -v 0

cstranslate -f -x 0.3 -c 4 -I a3m -i hhblits_cazy_families_a3m -o hhblits_cazy_families_cs219

sort -k3 -n -r hhblits_cazy_families_cs219.ffindex | cut -f1 > sorting.dat

ffindex_order sorting.dat hhblits_cazy_families_hhm.ff{data,index} hhblits_cazy_families_hhm_ordered.ff{data,index}

mv hhblits_cazy_families_hhm_ordered.ffindex hhblits_cazy_families_hhm.ffindex

mv hhblits_cazy_families_hhm_ordered.ffdata hhblits_cazy_families_hhm.ffdata

cd ../..

# Run comparison
python src/compare-cazy-families/run-hhblits.py