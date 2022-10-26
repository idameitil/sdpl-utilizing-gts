
fetch 7tpg
select chain_H, chain H
select chain_L, chain L
select chain_B, chain B
hide cartoon, chain_H
hide cartoon, chain_L
color 0xeeeeee, 7tpg
label n. CA and resi 191 and 7tpg, "%s-%s" % (resn, resi)
label n. CA and resi 242 and 7tpg, "%s-%s" % (resn, resi)
label n. CA and resi 261 and 7tpg, "%s-%s" % (resn, resi)
label n. CA and resi 265 and 7tpg, "%s-%s" % (resn, resi)
label n. CA and resi 313 and 7tpg, "%s-%s" % (resn, resi)
label n. CA and resi 314 and 7tpg, "%s-%s" % (resn, resi)
select cons, resi 191 and 7tpg or resi 242 and 7tpg or resi 261 and 7tpg or resi 265 and 7tpg or resi 313 and 7tpg or resi 314 and 7tpg
show licorice, cons
color atomic, cons



load /Users/idamei/phd/data/waal/alphafold/AF-P26471-F1-model_v3.pdb, P26471.1
color wheat, P26471.1
label n. CA and resi 208 and P26471.1, "%s-%s" % (resn, resi)
label n. CA and resi 270 and P26471.1, "%s-%s" % (resn, resi)
label n. CA and resi 321 and P26471.1, "%s-%s" % (resn, resi)
label n. CA and resi 322 and P26471.1, "%s-%s" % (resn, resi)
select cons, resi 208 and P26471.1 or resi 270 and P26471.1 or resi 321 and P26471.1 or resi 322 and P26471.1
show licorice, cons
color atomic, cons


cealign 7tpg, P26471.1
set label_position,(1,1,1)
set label_color,black
center
bg_color white
set float_labels, on
set label_size, 20
set label_font_id, 7
remove hydrogens
set cartoon_side_chain_helper, on
