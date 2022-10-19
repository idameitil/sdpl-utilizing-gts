set cartoon_side_chain_helper, on
set float_labels, on
set label_size, 20
set label_font_id, 7

fetch 7tpg
select chain_H, chain H
select chain_L, chain L
select chain_B, chain B
hide cartoon, chain_H
hide cartoon, chain_L
color grey, chain_B
select "arg_7tpg", resi 242 and chain_B or resi 265 and chain_B or resi 191 and chain_B or resi 139 and chain_B
show licorice, arg_7tpg
color atomic, arg_7tpg
center
set_view (     0.129056588,   -0.914879322,   -0.382540226,    -0.931019366,    0.021019539,   -0.364364743,     0.341392726,    0.403177291,   -0.849059284,     0.000000000,    0.000000000, -203.904266357,   134.720489502,  144.012847900,  140.640121460,   160.759674072,  247.048858643,  -20.000000000 )


load data/wzy/alphafold/WP_024244058.1/ranked_0.pdb, 1_WP_024244058.1
color teal, 1_WP_024244058.1
cealign 7tpg, 1_WP_024244058.1

label n. CA and resi 43 and 1_WP_024244058.1, "%s-%s" % (resn, resi)
label n. CA and resi 47 and 1_WP_024244058.1, "%s-%s" % (resn, resi)
label n. CA and resi 129 and 1_WP_024244058.1, "%s-%s" % (resn, resi)
label n. CA and resi 163 and 1_WP_024244058.1, "%s-%s" % (resn, resi)
label n. CA and resi 290 and 1_WP_024244058.1, "%s-%s" % (resn, resi)
select cons_WP_024244058.1, resi 43 and 1_WP_024244058.1 or resi 47 and 1_WP_024244058.1 or resi 129 and 1_WP_024244058.1 or resi 163 and 1_WP_024244058.1 or resi 290 and 1_WP_024244058.1
show licorice, cons_WP_024244058.1
color atomic, cons_WP_024244058.1



load data/wzy/alphafold/AHB32687.1/ranked_0.pdb, 1_AHB32687.1
color orange, 1_AHB32687.1
cealign 1_WP_024244058.1, 1_AHB32687.1

label n. CA and resi 83 and 1_AHB32687.1, "%s-%s" % (resn, resi)
label n. CA and resi 88 and 1_AHB32687.1, "%s-%s" % (resn, resi)
label n. CA and resi 184 and 1_AHB32687.1, "%s-%s" % (resn, resi)
label n. CA and resi 218 and 1_AHB32687.1, "%s-%s" % (resn, resi)
label n. CA and resi 335 and 1_AHB32687.1, "%s-%s" % (resn, resi)
select cons_AHB32687.1, resi 83 and 1_AHB32687.1 or resi 88 and 1_AHB32687.1 or resi 184 and 1_AHB32687.1 or resi 218 and 1_AHB32687.1 or resi 335 and 1_AHB32687.1
show licorice, cons_AHB32687.1
color atomic, cons_AHB32687.1



load data/wzy/alphafold/BAQ01743.1/ranked_0.pdb, 1_BAQ01743.1
color green, 1_BAQ01743.1
cealign 1_WP_024244058.1, 1_BAQ01743.1

label n. CA and resi 82 and 1_BAQ01743.1, "%s-%s" % (resn, resi)
label n. CA and resi 86 and 1_BAQ01743.1, "%s-%s" % (resn, resi)
label n. CA and resi 181 and 1_BAQ01743.1, "%s-%s" % (resn, resi)
label n. CA and resi 215 and 1_BAQ01743.1, "%s-%s" % (resn, resi)
label n. CA and resi 330 and 1_BAQ01743.1, "%s-%s" % (resn, resi)
select cons_BAQ01743.1, resi 82 and 1_BAQ01743.1 or resi 86 and 1_BAQ01743.1 or resi 181 and 1_BAQ01743.1 or resi 215 and 1_BAQ01743.1 or resi 330 and 1_BAQ01743.1
show licorice, cons_BAQ01743.1
color atomic, cons_BAQ01743.1



load data/wzy/alphafold/ABB29906.1/ranked_0.pdb, 1_ABB29906.1
color br6, 1_ABB29906.1
cealign 1_WP_024244058.1, 1_ABB29906.1

label n. CA and resi 49 and 1_ABB29906.1, "%s-%s" % (resn, resi)
label n. CA and resi 53 and 1_ABB29906.1, "%s-%s" % (resn, resi)
label n. CA and resi 129 and 1_ABB29906.1, "%s-%s" % (resn, resi)
label n. CA and resi 161 and 1_ABB29906.1, "%s-%s" % (resn, resi)
label n. CA and resi 284 and 1_ABB29906.1, "%s-%s" % (resn, resi)
select cons_ABB29906.1, resi 49 and 1_ABB29906.1 or resi 53 and 1_ABB29906.1 or resi 129 and 1_ABB29906.1 or resi 161 and 1_ABB29906.1 or resi 284 and 1_ABB29906.1
show licorice, cons_ABB29906.1
color atomic, cons_ABB29906.1



load data/wzy/alphafold/ACH97162.1/ranked_0.pdb, 1_ACH97162.1
color red, 1_ACH97162.1
cealign 1_WP_024244058.1, 1_ACH97162.1

label n. CA and resi 51 and 1_ACH97162.1, "%s-%s" % (resn, resi)
label n. CA and resi 55 and 1_ACH97162.1, "%s-%s" % (resn, resi)
label n. CA and resi 142 and 1_ACH97162.1, "%s-%s" % (resn, resi)
label n. CA and resi 176 and 1_ACH97162.1, "%s-%s" % (resn, resi)
label n. CA and resi 301 and 1_ACH97162.1, "%s-%s" % (resn, resi)
select cons_ACH97162.1, resi 51 and 1_ACH97162.1 or resi 55 and 1_ACH97162.1 or resi 142 and 1_ACH97162.1 or resi 176 and 1_ACH97162.1 or resi 301 and 1_ACH97162.1
show licorice, cons_ACH97162.1
color atomic, cons_ACH97162.1



load data/wzy/alphafold/AIG62747.1/ranked_0.pdb, 3_AIG62747.1
color teal, 3_AIG62747.1
cealign 7tpg, 3_AIG62747.1

label n. CA and resi 250 and 3_AIG62747.1, "%s-%s" % (resn, resi)
label n. CA and resi 280 and 3_AIG62747.1, "%s-%s" % (resn, resi)
select cons_AIG62747.1, resi 250 and 3_AIG62747.1 or resi 280 and 3_AIG62747.1
show licorice, cons_AIG62747.1
color atomic, cons_AIG62747.1



load data/wzy/alphafold/CAI33309.1/ranked_0.pdb, 3_CAI33309.1
color orange, 3_CAI33309.1
cealign 3_AIG62747.1, 3_CAI33309.1

label n. CA and resi 266 and 3_CAI33309.1, "%s-%s" % (resn, resi)
label n. CA and resi 304 and 3_CAI33309.1, "%s-%s" % (resn, resi)
select cons_CAI33309.1, resi 266 and 3_CAI33309.1 or resi 304 and 3_CAI33309.1
show licorice, cons_CAI33309.1
color atomic, cons_CAI33309.1



load data/wzy/alphafold/CAI34369.1/ranked_0.pdb, 3_CAI34369.1
color green, 3_CAI34369.1
cealign 3_AIG62747.1, 3_CAI34369.1

label n. CA and resi 268 and 3_CAI34369.1, "%s-%s" % (resn, resi)
label n. CA and resi 308 and 3_CAI34369.1, "%s-%s" % (resn, resi)
select cons_CAI34369.1, resi 268 and 3_CAI34369.1 or resi 308 and 3_CAI34369.1
show licorice, cons_CAI34369.1
color atomic, cons_CAI34369.1



load data/wzy/alphafold/BAQ00957.1/ranked_0.pdb, 3_BAQ00957.1
color br6, 3_BAQ00957.1
cealign 3_AIG62747.1, 3_BAQ00957.1

label n. CA and resi 265 and 3_BAQ00957.1, "%s-%s" % (resn, resi)
label n. CA and resi 294 and 3_BAQ00957.1, "%s-%s" % (resn, resi)
select cons_BAQ00957.1, resi 265 and 3_BAQ00957.1 or resi 294 and 3_BAQ00957.1
show licorice, cons_BAQ00957.1
color atomic, cons_BAQ00957.1



load data/wzy/alphafold/BAQ01516.1/ranked_0.pdb, 2_BAQ01516.1
color teal, 2_BAQ01516.1
cealign 7tpg, 2_BAQ01516.1

select cons_BAQ01516
show licorice, cons_BAQ01516.1
color atomic, cons_BAQ01516.1



load data/wzy/alphafold/ADC54950.1/ranked_0.pdb, 2_ADC54950.1
color orange, 2_ADC54950.1
cealign 2_BAQ01516.1, 2_ADC54950.1

select cons_ADC54950
show licorice, cons_ADC54950.1
color atomic, cons_ADC54950.1



load data/wzy/alphafold/AHB32411.1/ranked_0.pdb, 2_AHB32411.1
color green, 2_AHB32411.1
cealign 2_BAQ01516.1, 2_AHB32411.1

select cons_AHB32411
show licorice, cons_AHB32411.1
color atomic, cons_AHB32411.1



load data/wzy/alphafold/BAQ00653.1/ranked_0.pdb, 2_BAQ00653.1
color br6, 2_BAQ00653.1
cealign 2_BAQ01516.1, 2_BAQ00653.1

select cons_BAQ00653
show licorice, cons_BAQ00653.1
color atomic, cons_BAQ00653.1



load data/wzy/alphafold/AAZ85718.1/ranked_0.pdb, 2_AAZ85718.1
color red, 2_AAZ85718.1
cealign 2_BAQ01516.1, 2_AAZ85718.1

select cons_AAZ85718
show licorice, cons_AAZ85718.1
color atomic, cons_AAZ85718.1



load data/wzy/alphafold/CDF66396.1/ranked_0.pdb, 9_CDF66396.1
color teal, 9_CDF66396.1
cealign 7tpg, 9_CDF66396.1

label n. CA and resi 168 and 9_CDF66396.1, "%s-%s" % (resn, resi)
label n. CA and resi 171 and 9_CDF66396.1, "%s-%s" % (resn, resi)
label n. CA and resi 228 and 9_CDF66396.1, "%s-%s" % (resn, resi)
label n. CA and resi 284 and 9_CDF66396.1, "%s-%s" % (resn, resi)
label n. CA and resi 345 and 9_CDF66396.1, "%s-%s" % (resn, resi)
select cons_CDF66396.1, resi 168 and 9_CDF66396.1 or resi 171 and 9_CDF66396.1 or resi 228 and 9_CDF66396.1 or resi 284 and 9_CDF66396.1 or resi 345 and 9_CDF66396.1
show licorice, cons_CDF66396.1
color atomic, cons_CDF66396.1



load data/wzy/alphafold/AAA97573.1/ranked_0.pdb, 9_AAA97573.1
color orange, 9_AAA97573.1
cealign 9_CDF66396.1, 9_AAA97573.1

label n. CA and resi 173 and 9_AAA97573.1, "%s-%s" % (resn, resi)
label n. CA and resi 176 and 9_AAA97573.1, "%s-%s" % (resn, resi)
label n. CA and resi 234 and 9_AAA97573.1, "%s-%s" % (resn, resi)
label n. CA and resi 291 and 9_AAA97573.1, "%s-%s" % (resn, resi)
label n. CA and resi 349 and 9_AAA97573.1, "%s-%s" % (resn, resi)
select cons_AAA97573.1, resi 173 and 9_AAA97573.1 or resi 176 and 9_AAA97573.1 or resi 234 and 9_AAA97573.1 or resi 291 and 9_AAA97573.1 or resi 349 and 9_AAA97573.1
show licorice, cons_AAA97573.1
color atomic, cons_AAA97573.1



load data/wzy/alphafold/AAC45857.1/ranked_0.pdb, 9_AAC45857.1
color green, 9_AAC45857.1
cealign 9_CDF66396.1, 9_AAC45857.1

label n. CA and resi 173 and 9_AAC45857.1, "%s-%s" % (resn, resi)
label n. CA and resi 176 and 9_AAC45857.1, "%s-%s" % (resn, resi)
label n. CA and resi 234 and 9_AAC45857.1, "%s-%s" % (resn, resi)
label n. CA and resi 291 and 9_AAC45857.1, "%s-%s" % (resn, resi)
label n. CA and resi 349 and 9_AAC45857.1, "%s-%s" % (resn, resi)
select cons_AAC45857.1, resi 173 and 9_AAC45857.1 or resi 176 and 9_AAC45857.1 or resi 234 and 9_AAC45857.1 or resi 291 and 9_AAC45857.1 or resi 349 and 9_AAC45857.1
show licorice, cons_AAC45857.1
color atomic, cons_AAC45857.1



load data/wzy/alphafold/BAQ02088.1/ranked_0.pdb, 6_BAQ02088.1
color teal, 6_BAQ02088.1
cealign 7tpg, 6_BAQ02088.1

label n. CA and resi 228 and 6_BAQ02088.1, "%s-%s" % (resn, resi)
label n. CA and resi 307 and 6_BAQ02088.1, "%s-%s" % (resn, resi)
label n. CA and resi 343 and 6_BAQ02088.1, "%s-%s" % (resn, resi)
label n. CA and resi 348 and 6_BAQ02088.1, "%s-%s" % (resn, resi)
label n. CA and resi 395 and 6_BAQ02088.1, "%s-%s" % (resn, resi)
select cons_BAQ02088.1, resi 228 and 6_BAQ02088.1 or resi 307 and 6_BAQ02088.1 or resi 343 and 6_BAQ02088.1 or resi 348 and 6_BAQ02088.1 or resi 395 and 6_BAQ02088.1
show licorice, cons_BAQ02088.1
color atomic, cons_BAQ02088.1



load data/wzy/alphafold/ACA24754.1/ranked_0.pdb, 6_ACA24754.1
color orange, 6_ACA24754.1
cealign 6_BAQ02088.1, 6_ACA24754.1

label n. CA and resi 217 and 6_ACA24754.1, "%s-%s" % (resn, resi)
label n. CA and resi 294 and 6_ACA24754.1, "%s-%s" % (resn, resi)
select cons_ACA24754.1, resi 217 and 6_ACA24754.1 or resi 294 and 6_ACA24754.1
show licorice, cons_ACA24754.1
color atomic, cons_ACA24754.1



load data/wzy/alphafold/BAQ01659.1/ranked_0.pdb, 6_BAQ01659.1
color green, 6_BAQ01659.1
cealign 6_BAQ02088.1, 6_BAQ01659.1

label n. CA and resi 211 and 6_BAQ01659.1, "%s-%s" % (resn, resi)
label n. CA and resi 279 and 6_BAQ01659.1, "%s-%s" % (resn, resi)
label n. CA and resi 315 and 6_BAQ01659.1, "%s-%s" % (resn, resi)
label n. CA and resi 367 and 6_BAQ01659.1, "%s-%s" % (resn, resi)
select cons_BAQ01659.1, resi 211 and 6_BAQ01659.1 or resi 279 and 6_BAQ01659.1 or resi 315 and 6_BAQ01659.1 or resi 367 and 6_BAQ01659.1
show licorice, cons_BAQ01659.1
color atomic, cons_BAQ01659.1



load data/wzy/alphafold/BAQ00795.1/ranked_0.pdb, 6_BAQ00795.1
color br6, 6_BAQ00795.1
cealign 6_BAQ02088.1, 6_BAQ00795.1

label n. CA and resi 213 and 6_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 276 and 6_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 312 and 6_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 317 and 6_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 366 and 6_BAQ00795.1, "%s-%s" % (resn, resi)
select cons_BAQ00795.1, resi 213 and 6_BAQ00795.1 or resi 276 and 6_BAQ00795.1 or resi 312 and 6_BAQ00795.1 or resi 317 and 6_BAQ00795.1 or resi 366 and 6_BAQ00795.1
show licorice, cons_BAQ00795.1
color atomic, cons_BAQ00795.1



load data/wzy/alphafold/AAM27615.1/ranked_0.pdb, 5_AAM27615.1
color teal, 5_AAM27615.1
cealign 7tpg, 5_AAM27615.1

select cons_AAM27615
show licorice, cons_AAM27615.1
color atomic, cons_AAM27615.1



load data/wzy/alphafold/CAI33817.1/ranked_0.pdb, 5_CAI33817.1
color orange, 5_CAI33817.1
cealign 5_AAM27615.1, 5_CAI33817.1

select cons_CAI33817
show licorice, cons_CAI33817.1
color atomic, cons_CAI33817.1



load data/wzy/alphafold/ACD37165.1/ranked_0.pdb, 5_ACD37165.1
color green, 5_ACD37165.1
cealign 5_AAM27615.1, 5_ACD37165.1

select cons_ACD37165
show licorice, cons_ACD37165.1
color atomic, cons_ACD37165.1



load data/wzy/alphafold/CAI32772.1/ranked_0.pdb, 4_CAI32772.1
color teal, 4_CAI32772.1
cealign 7tpg, 4_CAI32772.1

label n. CA and resi 242 and 4_CAI32772.1, "%s-%s" % (resn, resi)
label n. CA and resi 441 and 4_CAI32772.1, "%s-%s" % (resn, resi)
select cons_CAI32772.1, resi 242 and 4_CAI32772.1 or resi 441 and 4_CAI32772.1
show licorice, cons_CAI32772.1
color atomic, cons_CAI32772.1



load data/wzy/alphafold/CAI32705.1/ranked_0.pdb, 4_CAI32705.1
color orange, 4_CAI32705.1
cealign 4_CAI32772.1, 4_CAI32705.1

label n. CA and resi 214 and 4_CAI32705.1, "%s-%s" % (resn, resi)
label n. CA and resi 395 and 4_CAI32705.1, "%s-%s" % (resn, resi)
select cons_CAI32705.1, resi 214 and 4_CAI32705.1 or resi 395 and 4_CAI32705.1
show licorice, cons_CAI32705.1
color atomic, cons_CAI32705.1



load data/wzy/alphafold/AHB32490.1/ranked_0.pdb, 4_AHB32490.1
color green, 4_AHB32490.1
cealign 4_CAI32772.1, 4_AHB32490.1

label n. CA and resi 238 and 4_AHB32490.1, "%s-%s" % (resn, resi)
label n. CA and resi 429 and 4_AHB32490.1, "%s-%s" % (resn, resi)
select cons_AHB32490.1, resi 238 and 4_AHB32490.1 or resi 429 and 4_AHB32490.1
show licorice, cons_AHB32490.1
color atomic, cons_AHB32490.1



load data/wzy/alphafold/AAT77177.1/ranked_0.pdb, 13_AAT77177.1
color teal, 13_AAT77177.1
cealign 7tpg, 13_AAT77177.1

label n. CA and resi 226 and 13_AAT77177.1, "%s-%s" % (resn, resi)
label n. CA and resi 284 and 13_AAT77177.1, "%s-%s" % (resn, resi)
select cons_AAT77177.1, resi 226 and 13_AAT77177.1 or resi 284 and 13_AAT77177.1
show licorice, cons_AAT77177.1
color atomic, cons_AAT77177.1



load data/wzy/alphafold/CBN82200.1/ranked_0.pdb, 13_CBN82200.1
color orange, 13_CBN82200.1
cealign 13_AAT77177.1, 13_CBN82200.1

label n. CA and resi 211 and 13_CBN82200.1, "%s-%s" % (resn, resi)
label n. CA and resi 270 and 13_CBN82200.1, "%s-%s" % (resn, resi)
select cons_CBN82200.1, resi 211 and 13_CBN82200.1 or resi 270 and 13_CBN82200.1
show licorice, cons_CBN82200.1
color atomic, cons_CBN82200.1



load data/wzy/alphafold/CAI34124.1/ranked_0.pdb, 27_CAI34124.1
color teal, 27_CAI34124.1
cealign 7tpg, 27_CAI34124.1

label n. CA and resi 267 and 27_CAI34124.1, "%s-%s" % (resn, resi)
label n. CA and resi 304 and 27_CAI34124.1, "%s-%s" % (resn, resi)
label n. CA and resi 325 and 27_CAI34124.1, "%s-%s" % (resn, resi)
select cons_CAI34124.1, resi 267 and 27_CAI34124.1 or resi 304 and 27_CAI34124.1 or resi 325 and 27_CAI34124.1
show licorice, cons_CAI34124.1
color atomic, cons_CAI34124.1



load data/wzy/alphafold/CAI34254.1/ranked_0.pdb, 28_CAI34254.1
color teal, 28_CAI34254.1
cealign 7tpg, 28_CAI34254.1

label n. CA and resi 182 and 28_CAI34254.1, "%s-%s" % (resn, resi)
label n. CA and resi 183 and 28_CAI34254.1, "%s-%s" % (resn, resi)
label n. CA and resi 189 and 28_CAI34254.1, "%s-%s" % (resn, resi)
label n. CA and resi 277 and 28_CAI34254.1, "%s-%s" % (resn, resi)
select cons_CAI34254.1, resi 182 and 28_CAI34254.1 or resi 183 and 28_CAI34254.1 or resi 189 and 28_CAI34254.1 or resi 277 and 28_CAI34254.1
show licorice, cons_CAI34254.1
color atomic, cons_CAI34254.1



load data/wzy/alphafold/CAI34198.1/ranked_0.pdb, 28_CAI34198.1
color orange, 28_CAI34198.1
cealign 28_CAI34254.1, 28_CAI34198.1

label n. CA and resi 182 and 28_CAI34198.1, "%s-%s" % (resn, resi)
label n. CA and resi 183 and 28_CAI34198.1, "%s-%s" % (resn, resi)
label n. CA and resi 189 and 28_CAI34198.1, "%s-%s" % (resn, resi)
label n. CA and resi 278 and 28_CAI34198.1, "%s-%s" % (resn, resi)
select cons_CAI34198.1, resi 182 and 28_CAI34198.1 or resi 183 and 28_CAI34198.1 or resi 189 and 28_CAI34198.1 or resi 278 and 28_CAI34198.1
show licorice, cons_CAI34198.1
color atomic, cons_CAI34198.1



load data/wzy/alphafold/CAI34217.1/ranked_0.pdb, 28_CAI34217.1
color green, 28_CAI34217.1
cealign 28_CAI34254.1, 28_CAI34217.1

label n. CA and resi 186 and 28_CAI34217.1, "%s-%s" % (resn, resi)
label n. CA and resi 187 and 28_CAI34217.1, "%s-%s" % (resn, resi)
label n. CA and resi 193 and 28_CAI34217.1, "%s-%s" % (resn, resi)
label n. CA and resi 281 and 28_CAI34217.1, "%s-%s" % (resn, resi)
select cons_CAI34217.1, resi 186 and 28_CAI34217.1 or resi 187 and 28_CAI34217.1 or resi 193 and 28_CAI34217.1 or resi 281 and 28_CAI34217.1
show licorice, cons_CAI34217.1
color atomic, cons_CAI34217.1



load data/wzy/alphafold/BAQ01843.1/ranked_0.pdb, 10_BAQ01843.1
color teal, 10_BAQ01843.1
cealign 7tpg, 10_BAQ01843.1

label n. CA and resi 223 and 10_BAQ01843.1, "%s-%s" % (resn, resi)
label n. CA and resi 227 and 10_BAQ01843.1, "%s-%s" % (resn, resi)
label n. CA and resi 246 and 10_BAQ01843.1, "%s-%s" % (resn, resi)
select cons_BAQ01843.1, resi 223 and 10_BAQ01843.1 or resi 227 and 10_BAQ01843.1 or resi 246 and 10_BAQ01843.1
show licorice, cons_BAQ01843.1
color atomic, cons_BAQ01843.1



load data/wzy/alphafold/AFC91472.1/ranked_0.pdb, 10_AFC91472.1
color orange, 10_AFC91472.1
cealign 10_BAQ01843.1, 10_AFC91472.1

label n. CA and resi 204 and 10_AFC91472.1, "%s-%s" % (resn, resi)
label n. CA and resi 208 and 10_AFC91472.1, "%s-%s" % (resn, resi)
label n. CA and resi 239 and 10_AFC91472.1, "%s-%s" % (resn, resi)
select cons_AFC91472.1, resi 204 and 10_AFC91472.1 or resi 208 and 10_AFC91472.1 or resi 239 and 10_AFC91472.1
show licorice, cons_AFC91472.1
color atomic, cons_AFC91472.1



load data/wzy/alphafold/ABG81806.1/ranked_0.pdb, 10_ABG81806.1
color green, 10_ABG81806.1
cealign 10_BAQ01843.1, 10_ABG81806.1

label n. CA and resi 217 and 10_ABG81806.1, "%s-%s" % (resn, resi)
label n. CA and resi 221 and 10_ABG81806.1, "%s-%s" % (resn, resi)
label n. CA and resi 255 and 10_ABG81806.1, "%s-%s" % (resn, resi)
select cons_ABG81806.1, resi 217 and 10_ABG81806.1 or resi 221 and 10_ABG81806.1 or resi 255 and 10_ABG81806.1
show licorice, cons_ABG81806.1
color atomic, cons_ABG81806.1



load data/wzy/alphafold/BAQ02224.1/ranked_0.pdb, 10_BAQ02224.1
color br6, 10_BAQ02224.1
cealign 10_BAQ01843.1, 10_BAQ02224.1

label n. CA and resi 217 and 10_BAQ02224.1, "%s-%s" % (resn, resi)
label n. CA and resi 221 and 10_BAQ02224.1, "%s-%s" % (resn, resi)
label n. CA and resi 255 and 10_BAQ02224.1, "%s-%s" % (resn, resi)
select cons_BAQ02224.1, resi 217 and 10_BAQ02224.1 or resi 221 and 10_BAQ02224.1 or resi 255 and 10_BAQ02224.1
show licorice, cons_BAQ02224.1
color atomic, cons_BAQ02224.1



load data/wzy/alphafold/CAB63298.1/ranked_0.pdb, 10_CAB63298.1
color red, 10_CAB63298.1
cealign 10_BAQ01843.1, 10_CAB63298.1

label n. CA and resi 214 and 10_CAB63298.1, "%s-%s" % (resn, resi)
label n. CA and resi 218 and 10_CAB63298.1, "%s-%s" % (resn, resi)
label n. CA and resi 239 and 10_CAB63298.1, "%s-%s" % (resn, resi)
select cons_CAB63298.1, resi 214 and 10_CAB63298.1 or resi 218 and 10_CAB63298.1 or resi 239 and 10_CAB63298.1
show licorice, cons_CAB63298.1
color atomic, cons_CAB63298.1



load data/wzy/alphafold/CAI33412.1/ranked_0.pdb, 14_CAI33412.1
color teal, 14_CAI33412.1
cealign 7tpg, 14_CAI33412.1

label n. CA and resi 149 and 14_CAI33412.1, "%s-%s" % (resn, resi)
label n. CA and resi 205 and 14_CAI33412.1, "%s-%s" % (resn, resi)
label n. CA and resi 281 and 14_CAI33412.1, "%s-%s" % (resn, resi)
select cons_CAI33412.1, resi 149 and 14_CAI33412.1 or resi 205 and 14_CAI33412.1 or resi 281 and 14_CAI33412.1
show licorice, cons_CAI33412.1
color atomic, cons_CAI33412.1



load data/wzy/alphafold/ADI43263.1/ranked_0.pdb, 15_ADI43263.1
color teal, 15_ADI43263.1
cealign 7tpg, 15_ADI43263.1

label n. CA and resi 158 and 15_ADI43263.1, "%s-%s" % (resn, resi)
label n. CA and resi 253 and 15_ADI43263.1, "%s-%s" % (resn, resi)
label n. CA and resi 305 and 15_ADI43263.1, "%s-%s" % (resn, resi)
label n. CA and resi 319 and 15_ADI43263.1, "%s-%s" % (resn, resi)
select cons_ADI43263.1, resi 158 and 15_ADI43263.1 or resi 253 and 15_ADI43263.1 or resi 305 and 15_ADI43263.1 or resi 319 and 15_ADI43263.1
show licorice, cons_ADI43263.1
color atomic, cons_ADI43263.1



load data/wzy/alphafold/ADR74237.1/ranked_0.pdb, 15_ADR74237.1
color orange, 15_ADR74237.1
cealign 15_ADI43263.1, 15_ADR74237.1

label n. CA and resi 162 and 15_ADR74237.1, "%s-%s" % (resn, resi)
label n. CA and resi 261 and 15_ADR74237.1, "%s-%s" % (resn, resi)
label n. CA and resi 312 and 15_ADR74237.1, "%s-%s" % (resn, resi)
label n. CA and resi 326 and 15_ADR74237.1, "%s-%s" % (resn, resi)
select cons_ADR74237.1, resi 162 and 15_ADR74237.1 or resi 261 and 15_ADR74237.1 or resi 312 and 15_ADR74237.1 or resi 326 and 15_ADR74237.1
show licorice, cons_ADR74237.1
color atomic, cons_ADR74237.1



load data/wzy/alphafold/AAD50486.1/ranked_0.pdb, 7_AAD50486.1
color teal, 7_AAD50486.1
cealign 7tpg, 7_AAD50486.1

label n. CA and resi 56 and 7_AAD50486.1, "%s-%s" % (resn, resi)
label n. CA and resi 151 and 7_AAD50486.1, "%s-%s" % (resn, resi)
label n. CA and resi 185 and 7_AAD50486.1, "%s-%s" % (resn, resi)
label n. CA and resi 252 and 7_AAD50486.1, "%s-%s" % (resn, resi)
label n. CA and resi 318 and 7_AAD50486.1, "%s-%s" % (resn, resi)
select cons_AAD50486.1, resi 56 and 7_AAD50486.1 or resi 151 and 7_AAD50486.1 or resi 185 and 7_AAD50486.1 or resi 252 and 7_AAD50486.1 or resi 318 and 7_AAD50486.1
show licorice, cons_AAD50486.1
color atomic, cons_AAD50486.1



load data/wzy/alphafold/ADI43271.1/ranked_0.pdb, 7_ADI43271.1
color orange, 7_ADI43271.1
cealign 7_AAD50486.1, 7_ADI43271.1

label n. CA and resi 57 and 7_ADI43271.1, "%s-%s" % (resn, resi)
label n. CA and resi 157 and 7_ADI43271.1, "%s-%s" % (resn, resi)
label n. CA and resi 192 and 7_ADI43271.1, "%s-%s" % (resn, resi)
label n. CA and resi 250 and 7_ADI43271.1, "%s-%s" % (resn, resi)
label n. CA and resi 315 and 7_ADI43271.1, "%s-%s" % (resn, resi)
select cons_ADI43271.1, resi 57 and 7_ADI43271.1 or resi 157 and 7_ADI43271.1 or resi 192 and 7_ADI43271.1 or resi 250 and 7_ADI43271.1 or resi 315 and 7_ADI43271.1
show licorice, cons_ADI43271.1
color atomic, cons_ADI43271.1



load data/wzy/alphafold/ACD37078.1/ranked_0.pdb, 7_ACD37078.1
color green, 7_ACD37078.1
cealign 7_AAD50486.1, 7_ACD37078.1

label n. CA and resi 61 and 7_ACD37078.1, "%s-%s" % (resn, resi)
label n. CA and resi 152 and 7_ACD37078.1, "%s-%s" % (resn, resi)
label n. CA and resi 187 and 7_ACD37078.1, "%s-%s" % (resn, resi)
label n. CA and resi 255 and 7_ACD37078.1, "%s-%s" % (resn, resi)
label n. CA and resi 324 and 7_ACD37078.1, "%s-%s" % (resn, resi)
select cons_ACD37078.1, resi 61 and 7_ACD37078.1 or resi 152 and 7_ACD37078.1 or resi 187 and 7_ACD37078.1 or resi 255 and 7_ACD37078.1 or resi 324 and 7_ACD37078.1
show licorice, cons_ACD37078.1
color atomic, cons_ACD37078.1


set label_position,(1,1,1)
set label_color,black
center 
disable 
bg_color white 
