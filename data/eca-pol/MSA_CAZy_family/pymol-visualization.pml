
load data/eca-pol/alphafold/ACH50550.1/ranked_0.pdb, ACH50550.1
color 0xeeeeee, ACH50550.1
label n. CA and resi 135 and ACH50550.1, "%s-%s" % (resn, resi)
label n. CA and resi 145 and ACH50550.1, "%s-%s" % (resn, resi)
label n. CA and resi 247 and ACH50550.1, "%s-%s" % (resn, resi)
label n. CA and resi 248 and ACH50550.1, "%s-%s" % (resn, resi)
label n. CA and resi 270 and ACH50550.1, "%s-%s" % (resn, resi)
select cons, resi 135 and ACH50550.1 or resi 145 and ACH50550.1 or resi 247 and ACH50550.1 or resi 248 and ACH50550.1 or resi 270 and ACH50550.1
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
