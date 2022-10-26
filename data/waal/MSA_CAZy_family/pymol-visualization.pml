
fetch 7tpg
color 0xeeeeee, 7tpg
label n. CA and resi 191 and 7tpg, "%s-%s" % (resn, resi)
label n. CA and resi 265 and 7tpg, "%s-%s" % (resn, resi)
label n. CA and resi 313 and 7tpg, "%s-%s" % (resn, resi)
select cons, resi 191 and 7tpg or resi 265 and 7tpg or resi 313 and 7tpg
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
