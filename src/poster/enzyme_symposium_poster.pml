set cartoon_side_chain_helper, on
load /Users/idamei/phd/data/wzy/alphafold/ABI98966.1/ranked_0.pdb, 1_ABI98966.1

label n. CA and resi 55 and 1_ABI98966.1, "%s-%s" % (resn, resi)
label n. CA and resi 59 and 1_ABI98966.1, "%s-%s" % (resn, resi)
label n. CA and resi 144 and 1_ABI98966.1, "%s-%s" % (resn, resi)
label n. CA and resi 178 and 1_ABI98966.1, "%s-%s" % (resn, resi)
label n. CA and resi 293 and 1_ABI98966.1, "%s-%s" % (resn, resi)

color 0xeeeeee, 1_ABI98966

select cons_ABI98966.1, resi 55 and 1_ABI98966.1 or resi 59 and 1_ABI98966.1 or resi 144 and 1_ABI98966.1 or resi 178 and 1_ABI98966.1 or resi 293 and 1_ABI98966.1
show licorice, cons_ABI98966.1
color atomic, cons_ABI98966.1

set cartoon_color, 0xeeeeee

set float_labels, on
set label_size, 20
set label_font_id, 7

bg_color white

remove hydrogens

set_view (\
     0.250400782,   -0.651315570,    0.716297925,\
    -0.585554361,   -0.691086829,   -0.423695505,\
     0.770988941,   -0.313338548,   -0.554435670,\
     0.000000000,    0.000000000, -103.749755859,\
    -4.355312347,    2.290699005,   -2.317111969,\
    74.437194824,  133.062316895,  -20.000000000 )