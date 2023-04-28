@src/pymol-visualization/nicify.pml

fetch 7tpg, 615_i_7TPG_O-Lig
hide cartoon, !chain B
hide licorice, 615_i_7TPG_O-Lig and i. 301
color teal, 615_i_7TPG_O-Lig
label n. CA and resi 191 and 615_i_7TPG_O-Lig, "%s" % (resn)
label n. CA and resi 265 and 615_i_7TPG_O-Lig, "%s" % (resn)
label n. CA and resi 313 and 615_i_7TPG_O-Lig, "%s" % (resn)
select cons_615_i_7TPG_O-Lig, resi 191 and 615_i_7TPG_O-Lig or resi 242 and 615_i_7TPG_O-Lig or resi 261 and 615_i_7TPG_O-Lig or resi 265 and 615_i_7TPG_O-Lig or resi 313 and 615_i_7TPG_O-Lig
show licorice, cons_615_i_7TPG_O-Lig
color atomic, (cons_615_i_7TPG_O-Lig and not elem C)

load data/eca-pol/alphafold/ACH50550.1/ranked_0.pdb, 586_r_ACH50550.1
color teal, 586_r_ACH50550.1
label n. CA and resi 145 and 586_r_ACH50550.1, "%s" % (resn)
label n. CA and resi 204 and 586_r_ACH50550.1, "%s" % (resn)
label n. CA and resi 247 and 586_r_ACH50550.1, "%s" % (resn)
label n. CA and resi 399 and 586_r_ACH50550.1, "%s" % (resn)
select cons_586_r_ACH50550.1, resi 145 and 586_r_ACH50550.1 or resi 204 and 586_r_ACH50550.1 or resi 247 and 586_r_ACH50550.1 or resi 248 and 586_r_ACH50550.1 or resi 399 and 586_r_ACH50550.1
show licorice, cons_586_r_ACH50550.1
color atomic, (cons_586_r_ACH50550.1 and not elem C)

load data/wzy/alphafold/AAM27615.1/ranked_0.pdb, 614_i_AAM27615.1
color teal, 614_i_AAM27615.1
label n. CA and resi 188 and 614_i_AAM27615.1, "%s" % (resn)
label n. CA and resi 260 and 614_i_AAM27615.1, "%s" % (resn)
label n. CA and resi 298 and 614_i_AAM27615.1, "%s" % (resn)
select cons_614_i_AAM27615.1, resi 188 and 614_i_AAM27615.1 or resi 260 and 614_i_AAM27615.1 or resi 298 and 614_i_AAM27615.1
show licorice, cons_614_i_AAM27615.1
color atomic, (cons_614_i_AAM27615.1 and not elem C)

load data/wzy/alphafold/CAI32772.1/ranked_0.pdb, 608_r_CAI32772.1
color teal, 608_r_CAI32772.1
label n. CA and resi 184 and 608_r_CAI32772.1, "%s" % (resn)
label n. CA and resi 242 and 608_r_CAI32772.1, "%s" % (resn)
label n. CA and resi 290 and 608_r_CAI32772.1, "%s" % (resn)
label n. CA and resi 441 and 608_r_CAI32772.1, "%s" % (resn)
select cons_608_r_CAI32772.1, resi 184 and 608_r_CAI32772.1 or resi 242 and 608_r_CAI32772.1 or resi 290 and 608_r_CAI32772.1 or resi 441 and 608_r_CAI32772.1
show licorice, cons_608_r_CAI32772.1
color atomic, (cons_608_r_CAI32772.1 and not elem C)

super 608_r_CAI32772.1, 586_r_ACH50550.1
cealign 615_i_7TPG_O-Lig, 614_i_AAM27615.1

remove hydrogens

set_view (\
    -0.625740945,   -0.768066406,    0.136091620,\
    -0.735154450,    0.522372842,   -0.432055473,\
     0.260755271,   -0.370398730,   -0.891515672,\
    -0.000030898,    0.000821890,  -67.144096375,\
   126.827430725,  146.254821777,  126.177688599,\
   -75.567428589,  210.051681519,  -20.000000000 )

set_view (\
     0.418005377,    0.691306412,    0.589375794,\
     0.462569028,   -0.720342457,    0.516850471,\
     0.781854987,    0.056580566,   -0.620884001,\
    -0.000055406,   -0.000005800,  -68.810729980,\
    10.046039581,   11.712718010,    5.006405830,\
   -88.193801880,  225.809051514,  -20.000000000 )