set cartoon_side_chain_helper, on
load /Users/idamei/phd/data/wzy/alphafold/AAT77177.1/ranked_0.pdb, AAT77177.1
color 0xeeeeee, AAT77177.1

label n. CA and resi 165, "%s-%s" % (resn, resi)
label n. CA and resi 226, "%s-%s" % (resn, resi)
label n. CA and resi 284, "%s-%s" % (resn, resi)

select conserved, resi 165 or resi 226 or resi 284

show licorice, conserved
color atomic, conserved

bg_color white

set float_labels, on
set label_size, 30
set label_font_id, 7

set_view (\
    -0.538292348,   -0.161206037,    0.827195942,\
    -0.842561722,    0.124092102,   -0.524107754,\
    -0.018159909,   -0.979089856,   -0.202624157,\
    -0.000000007,    0.000001568,  -65.753684998,\
    -2.581256628,    1.977519631,    3.348237991,\
    32.000385284,   96.007003784,  -20.000000000 )

deselect

png /Users/idamei/phd/data/poster/active-site.png