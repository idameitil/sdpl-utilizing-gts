
fetch 7tpg
select chain_H, chain H
select chain_L, chain L
select chain_B, chain B
hide cartoon, chain_H
hide cartoon, chain_L
color 0xeeeeee, 7tpg
label n. CA and resi 191 and 7tpg, "%s-%s" % (resn, resi)
label n. CA and resi 313 and 7tpg, "%s-%s" % (resn, resi)
label n. CA and resi 324 and 7tpg, "%s-%s" % (resn, resi)
select cons, resi 191 and 7tpg or resi 313 and 7tpg or resi 324 and 7tpg
show licorice, cons
color atomic, cons


set label_position,(1,1,1)
set label_color,black
center
bg_color white
set float_labels, on
set label_size, 20
set label_font_id, 7
remove hydrogens
set cartoon_side_chain_helper, on
set ray_trace_mode, 0
