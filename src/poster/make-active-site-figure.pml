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

set_view (\
    -0.476002455,    0.350449681,    0.806600928,\
    -0.438016742,    0.700842500,   -0.562990367,\
    -0.762601912,   -0.621289432,   -0.180100873,\
     0.000000000,    0.000000000, -117.678825378,\
    -3.228476524,    2.708984375,   -1.509864807,\
    75.452575684,  159.905059814,  -20.000000000 )

deselect

png /Users/idamei/phd/data/poster/active-site.png