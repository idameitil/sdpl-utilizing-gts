set cartoon_side_chain_helper, on
set float_labels, on
set label_size, 30
set label_font_id, 7
set ray_trace_mode, 0

fetch 7tpg
select chain_H, chain H
select chain_L, chain L
select chain_B, chain B
hide cartoon, chain_H
hide cartoon, chain_L
color grey, chain_B
select "cons_7tpg", resi 265 and chain_B or resi 191 and chain_B or resi 313 and chain_B
show licorice, cons_7tpg
color atomic, cons_7tpg
center
set_view (     0.129056588,   -0.914879322,   -0.382540226,    -0.931019366,    0.021019539,   -0.364364743,     0.341392726,    0.403177291,   -0.849059284,     0.000000000,    0.000000000, -203.904266357,   134.720489502,  144.012847900,  140.640121460,   160.759674072,  247.048858643,  -20.000000000 )


load data/wzy/alphafold/AHB32215.1/ranked_0.pdb, 1_AHB32215.1
color 0xeeeeee, 1_AHB32215.1
cealign 7tpg, 1_AHB32215.1

label n. CA and resi 49 and 1_AHB32215.1, "%s" % (resn)
label n. CA and resi 53 and 1_AHB32215.1, "%s" % (resn)
label n. CA and resi 137 and 1_AHB32215.1, "%s" % (resn)
label n. CA and resi 171 and 1_AHB32215.1, "%s" % (resn)
label n. CA and resi 219 and 1_AHB32215.1, "%s" % (resn)
label n. CA and resi 283 and 1_AHB32215.1, "%s" % (resn)
select cons_AHB32215.1, resi 49 and 1_AHB32215.1 or resi 53 and 1_AHB32215.1 or resi 137 and 1_AHB32215.1 or resi 171 and 1_AHB32215.1 or resi 219 and 1_AHB32215.1 or resi 283 and 1_AHB32215.1
show licorice, cons_AHB32215.1
color atomic, cons_AHB32215.1



load data/wzy/alphafold/AHB32334.1/ranked_0.pdb, 1_AHB32334.1
color 0xeeeeee, 1_AHB32334.1
cealign 1_AHB32215.1, 1_AHB32334.1

label n. CA and resi 33 and 1_AHB32334.1, "%s" % (resn)
label n. CA and resi 37 and 1_AHB32334.1, "%s" % (resn)
label n. CA and resi 126 and 1_AHB32334.1, "%s" % (resn)
label n. CA and resi 161 and 1_AHB32334.1, "%s" % (resn)
label n. CA and resi 219 and 1_AHB32334.1, "%s" % (resn)
label n. CA and resi 284 and 1_AHB32334.1, "%s" % (resn)
select cons_AHB32334.1, resi 33 and 1_AHB32334.1 or resi 37 and 1_AHB32334.1 or resi 126 and 1_AHB32334.1 or resi 161 and 1_AHB32334.1 or resi 219 and 1_AHB32334.1 or resi 284 and 1_AHB32334.1
show licorice, cons_AHB32334.1
color atomic, cons_AHB32334.1



load data/wzy/alphafold/AHB32861.1/ranked_0.pdb, 1_AHB32861.1
color 0xeeeeee, 1_AHB32861.1
cealign 1_AHB32215.1, 1_AHB32861.1

label n. CA and resi 48 and 1_AHB32861.1, "%s" % (resn)
label n. CA and resi 52 and 1_AHB32861.1, "%s" % (resn)
label n. CA and resi 136 and 1_AHB32861.1, "%s" % (resn)
label n. CA and resi 170 and 1_AHB32861.1, "%s" % (resn)
label n. CA and resi 221 and 1_AHB32861.1, "%s" % (resn)
label n. CA and resi 287 and 1_AHB32861.1, "%s" % (resn)
select cons_AHB32861.1, resi 48 and 1_AHB32861.1 or resi 52 and 1_AHB32861.1 or resi 136 and 1_AHB32861.1 or resi 170 and 1_AHB32861.1 or resi 221 and 1_AHB32861.1 or resi 287 and 1_AHB32861.1
show licorice, cons_AHB32861.1
color atomic, cons_AHB32861.1



load data/wzy/alphafold/CAI34008.1/ranked_0.pdb, 1_CAI34008.1
color 0xeeeeee, 1_CAI34008.1
cealign 1_AHB32215.1, 1_CAI34008.1

label n. CA and resi 51 and 1_CAI34008.1, "%s" % (resn)
label n. CA and resi 55 and 1_CAI34008.1, "%s" % (resn)
label n. CA and resi 153 and 1_CAI34008.1, "%s" % (resn)
label n. CA and resi 187 and 1_CAI34008.1, "%s" % (resn)
label n. CA and resi 254 and 1_CAI34008.1, "%s" % (resn)
label n. CA and resi 315 and 1_CAI34008.1, "%s" % (resn)
select cons_CAI34008.1, resi 51 and 1_CAI34008.1 or resi 55 and 1_CAI34008.1 or resi 153 and 1_CAI34008.1 or resi 187 and 1_CAI34008.1 or resi 254 and 1_CAI34008.1 or resi 315 and 1_CAI34008.1
show licorice, cons_CAI34008.1
color atomic, cons_CAI34008.1



load data/wzy/alphafold/ACH97162.1/ranked_0.pdb, 1_ACH97162.1
color 0xeeeeee, 1_ACH97162.1
cealign 1_AHB32215.1, 1_ACH97162.1

label n. CA and resi 51 and 1_ACH97162.1, "%s" % (resn)
label n. CA and resi 55 and 1_ACH97162.1, "%s" % (resn)
label n. CA and resi 142 and 1_ACH97162.1, "%s" % (resn)
label n. CA and resi 176 and 1_ACH97162.1, "%s" % (resn)
label n. CA and resi 234 and 1_ACH97162.1, "%s" % (resn)
label n. CA and resi 301 and 1_ACH97162.1, "%s" % (resn)
select cons_ACH97162.1, resi 51 and 1_ACH97162.1 or resi 55 and 1_ACH97162.1 or resi 142 and 1_ACH97162.1 or resi 176 and 1_ACH97162.1 or resi 234 and 1_ACH97162.1 or resi 301 and 1_ACH97162.1
show licorice, cons_ACH97162.1
color atomic, cons_ACH97162.1



load data/wzy/alphafold/CAI33309.1/ranked_0.pdb, 3_CAI33309.1
color 0xeeeeee, 3_CAI33309.1
cealign 7tpg, 3_CAI33309.1

label n. CA and resi 150 and 3_CAI33309.1, "%s" % (resn)
label n. CA and resi 266 and 3_CAI33309.1, "%s" % (resn)
label n. CA and resi 304 and 3_CAI33309.1, "%s" % (resn)
select cons_CAI33309.1, resi 150 and 3_CAI33309.1 or resi 266 and 3_CAI33309.1 or resi 304 and 3_CAI33309.1
show licorice, cons_CAI33309.1
color atomic, cons_CAI33309.1



load data/wzy/alphafold/CAI34369.1/ranked_0.pdb, 3_CAI34369.1
color 0xeeeeee, 3_CAI34369.1
cealign 3_CAI33309.1, 3_CAI34369.1

label n. CA and resi 151 and 3_CAI34369.1, "%s" % (resn)
label n. CA and resi 268 and 3_CAI34369.1, "%s" % (resn)
label n. CA and resi 308 and 3_CAI34369.1, "%s" % (resn)
select cons_CAI34369.1, resi 151 and 3_CAI34369.1 or resi 268 and 3_CAI34369.1 or resi 308 and 3_CAI34369.1
show licorice, cons_CAI34369.1
color atomic, cons_CAI34369.1



load data/wzy/alphafold/AIG62747.1/ranked_0.pdb, 3_AIG62747.1
color 0xeeeeee, 3_AIG62747.1
cealign 3_CAI33309.1, 3_AIG62747.1

label n. CA and resi 134 and 3_AIG62747.1, "%s" % (resn)
label n. CA and resi 250 and 3_AIG62747.1, "%s" % (resn)
label n. CA and resi 280 and 3_AIG62747.1, "%s" % (resn)
select cons_AIG62747.1, resi 134 and 3_AIG62747.1 or resi 250 and 3_AIG62747.1 or resi 280 and 3_AIG62747.1
show licorice, cons_AIG62747.1
color atomic, cons_AIG62747.1



load data/wzy/alphafold/BAQ00653.1/ranked_0.pdb, 2_BAQ00653.1
color 0xeeeeee, 2_BAQ00653.1
cealign 7tpg, 2_BAQ00653.1

label n. CA and resi 246 and 2_BAQ00653.1, "%s" % (resn)
label n. CA and resi 301 and 2_BAQ00653.1, "%s" % (resn)
select cons_BAQ00653.1, resi 246 and 2_BAQ00653.1 or resi 301 and 2_BAQ00653.1
show licorice, cons_BAQ00653.1
color atomic, cons_BAQ00653.1



load data/wzy/alphafold/ADC54950.1/ranked_0.pdb, 2_ADC54950.1
color 0xeeeeee, 2_ADC54950.1
cealign 2_BAQ00653.1, 2_ADC54950.1

label n. CA and resi 249 and 2_ADC54950.1, "%s" % (resn)
label n. CA and resi 305 and 2_ADC54950.1, "%s" % (resn)
select cons_ADC54950.1, resi 249 and 2_ADC54950.1 or resi 305 and 2_ADC54950.1
show licorice, cons_ADC54950.1
color atomic, cons_ADC54950.1



load data/wzy/alphafold/AAZ85718.1/ranked_0.pdb, 2_AAZ85718.1
color 0xeeeeee, 2_AAZ85718.1
cealign 2_BAQ00653.1, 2_AAZ85718.1

label n. CA and resi 269 and 2_AAZ85718.1, "%s" % (resn)
label n. CA and resi 329 and 2_AAZ85718.1, "%s" % (resn)
select cons_AAZ85718.1, resi 269 and 2_AAZ85718.1 or resi 329 and 2_AAZ85718.1
show licorice, cons_AAZ85718.1
color atomic, cons_AAZ85718.1



load data/wzy/alphafold/CDF66396.1/ranked_0.pdb, 9_CDF66396.1
color 0xeeeeee, 9_CDF66396.1
cealign 7tpg, 9_CDF66396.1

label n. CA and resi 168 and 9_CDF66396.1, "%s" % (resn)
label n. CA and resi 171 and 9_CDF66396.1, "%s" % (resn)
label n. CA and resi 185 and 9_CDF66396.1, "%s" % (resn)
label n. CA and resi 228 and 9_CDF66396.1, "%s" % (resn)
label n. CA and resi 284 and 9_CDF66396.1, "%s" % (resn)
label n. CA and resi 345 and 9_CDF66396.1, "%s" % (resn)
select cons_CDF66396.1, resi 168 and 9_CDF66396.1 or resi 171 and 9_CDF66396.1 or resi 185 and 9_CDF66396.1 or resi 228 and 9_CDF66396.1 or resi 284 and 9_CDF66396.1 or resi 345 and 9_CDF66396.1
show licorice, cons_CDF66396.1
color atomic, cons_CDF66396.1



load data/wzy/alphafold/AAA97573.1/ranked_0.pdb, 9_AAA97573.1
color 0xeeeeee, 9_AAA97573.1
cealign 9_CDF66396.1, 9_AAA97573.1

label n. CA and resi 173 and 9_AAA97573.1, "%s" % (resn)
label n. CA and resi 176 and 9_AAA97573.1, "%s" % (resn)
label n. CA and resi 191 and 9_AAA97573.1, "%s" % (resn)
label n. CA and resi 234 and 9_AAA97573.1, "%s" % (resn)
label n. CA and resi 291 and 9_AAA97573.1, "%s" % (resn)
label n. CA and resi 349 and 9_AAA97573.1, "%s" % (resn)
select cons_AAA97573.1, resi 173 and 9_AAA97573.1 or resi 176 and 9_AAA97573.1 or resi 191 and 9_AAA97573.1 or resi 234 and 9_AAA97573.1 or resi 291 and 9_AAA97573.1 or resi 349 and 9_AAA97573.1
show licorice, cons_AAA97573.1
color atomic, cons_AAA97573.1



load data/wzy/alphafold/AAC45857.1/ranked_0.pdb, 9_AAC45857.1
color 0xeeeeee, 9_AAC45857.1
cealign 9_CDF66396.1, 9_AAC45857.1

label n. CA and resi 173 and 9_AAC45857.1, "%s" % (resn)
label n. CA and resi 176 and 9_AAC45857.1, "%s" % (resn)
label n. CA and resi 191 and 9_AAC45857.1, "%s" % (resn)
label n. CA and resi 234 and 9_AAC45857.1, "%s" % (resn)
label n. CA and resi 291 and 9_AAC45857.1, "%s" % (resn)
label n. CA and resi 349 and 9_AAC45857.1, "%s" % (resn)
select cons_AAC45857.1, resi 173 and 9_AAC45857.1 or resi 176 and 9_AAC45857.1 or resi 191 and 9_AAC45857.1 or resi 234 and 9_AAC45857.1 or resi 291 and 9_AAC45857.1 or resi 349 and 9_AAC45857.1
show licorice, cons_AAC45857.1
color atomic, cons_AAC45857.1



load data/wzy/alphafold/BAQ00795.1/ranked_0.pdb, 5_BAQ00795.1
color 0xeeeeee, 5_BAQ00795.1
cealign 7tpg, 5_BAQ00795.1

label n. CA and resi 213 and 5_BAQ00795.1, "%s" % (resn)
label n. CA and resi 276 and 5_BAQ00795.1, "%s" % (resn)
label n. CA and resi 308 and 5_BAQ00795.1, "%s" % (resn)
label n. CA and resi 312 and 5_BAQ00795.1, "%s" % (resn)
label n. CA and resi 317 and 5_BAQ00795.1, "%s" % (resn)
label n. CA and resi 366 and 5_BAQ00795.1, "%s" % (resn)
select cons_BAQ00795.1, resi 213 and 5_BAQ00795.1 or resi 276 and 5_BAQ00795.1 or resi 308 and 5_BAQ00795.1 or resi 312 and 5_BAQ00795.1 or resi 317 and 5_BAQ00795.1 or resi 366 and 5_BAQ00795.1
show licorice, cons_BAQ00795.1
color atomic, cons_BAQ00795.1



load data/wzy/alphafold/BAQ01659.1/ranked_0.pdb, 5_BAQ01659.1
color 0xeeeeee, 5_BAQ01659.1
cealign 5_BAQ00795.1, 5_BAQ01659.1

label n. CA and resi 211 and 5_BAQ01659.1, "%s" % (resn)
label n. CA and resi 279 and 5_BAQ01659.1, "%s" % (resn)
label n. CA and resi 315 and 5_BAQ01659.1, "%s" % (resn)
label n. CA and resi 367 and 5_BAQ01659.1, "%s" % (resn)
select cons_BAQ01659.1, resi 211 and 5_BAQ01659.1 or resi 279 and 5_BAQ01659.1 or resi 315 and 5_BAQ01659.1 or resi 367 and 5_BAQ01659.1
show licorice, cons_BAQ01659.1
color atomic, cons_BAQ01659.1



load data/wzy/alphafold/BAQ02088.1/ranked_0.pdb, 5_BAQ02088.1
color 0xeeeeee, 5_BAQ02088.1
cealign 5_BAQ00795.1, 5_BAQ02088.1

label n. CA and resi 228 and 5_BAQ02088.1, "%s" % (resn)
label n. CA and resi 307 and 5_BAQ02088.1, "%s" % (resn)
label n. CA and resi 339 and 5_BAQ02088.1, "%s" % (resn)
label n. CA and resi 343 and 5_BAQ02088.1, "%s" % (resn)
label n. CA and resi 348 and 5_BAQ02088.1, "%s" % (resn)
label n. CA and resi 395 and 5_BAQ02088.1, "%s" % (resn)
select cons_BAQ02088.1, resi 228 and 5_BAQ02088.1 or resi 307 and 5_BAQ02088.1 or resi 339 and 5_BAQ02088.1 or resi 343 and 5_BAQ02088.1 or resi 348 and 5_BAQ02088.1 or resi 395 and 5_BAQ02088.1
show licorice, cons_BAQ02088.1
color atomic, cons_BAQ02088.1



load data/wzy/alphafold/ACA24754.1/ranked_0.pdb, 5_ACA24754.1
color 0xeeeeee, 5_ACA24754.1
cealign 5_BAQ00795.1, 5_ACA24754.1

label n. CA and resi 217 and 5_ACA24754.1, "%s" % (resn)
label n. CA and resi 294 and 5_ACA24754.1, "%s" % (resn)
select cons_ACA24754.1, resi 217 and 5_ACA24754.1 or resi 294 and 5_ACA24754.1
show licorice, cons_ACA24754.1
color atomic, cons_ACA24754.1



load data/wzy/alphafold/ACD37165.1/ranked_0.pdb, 4_ACD37165.1
color 0xeeeeee, 4_ACD37165.1
cealign 7tpg, 4_ACD37165.1

label n. CA and resi 206 and 4_ACD37165.1, "%s" % (resn)
label n. CA and resi 258 and 4_ACD37165.1, "%s" % (resn)
label n. CA and resi 291 and 4_ACD37165.1, "%s" % (resn)
label n. CA and resi 346 and 4_ACD37165.1, "%s" % (resn)
select cons_ACD37165.1, resi 206 and 4_ACD37165.1 or resi 258 and 4_ACD37165.1 or resi 291 and 4_ACD37165.1 or resi 346 and 4_ACD37165.1
show licorice, cons_ACD37165.1
color atomic, cons_ACD37165.1



load data/wzy/alphafold/AAM27615.1/ranked_0.pdb, 4_AAM27615.1
color 0xeeeeee, 4_AAM27615.1
cealign 4_ACD37165.1, 4_AAM27615.1

label n. CA and resi 188 and 4_AAM27615.1, "%s" % (resn)
label n. CA and resi 260 and 4_AAM27615.1, "%s" % (resn)
label n. CA and resi 298 and 4_AAM27615.1, "%s" % (resn)
label n. CA and resi 357 and 4_AAM27615.1, "%s" % (resn)
select cons_AAM27615.1, resi 188 and 4_AAM27615.1 or resi 260 and 4_AAM27615.1 or resi 298 and 4_AAM27615.1 or resi 357 and 4_AAM27615.1
show licorice, cons_AAM27615.1
color atomic, cons_AAM27615.1



load data/wzy/alphafold/CBN82200.1/ranked_0.pdb, 14_CBN82200.1
color 0xeeeeee, 14_CBN82200.1
cealign 7tpg, 14_CBN82200.1

label n. CA and resi 211 and 14_CBN82200.1, "%s" % (resn)
label n. CA and resi 270 and 14_CBN82200.1, "%s" % (resn)
select cons_CBN82200.1, resi 211 and 14_CBN82200.1 or resi 270 and 14_CBN82200.1
show licorice, cons_CBN82200.1
color atomic, cons_CBN82200.1



load data/wzy/alphafold/AAT77177.1/ranked_0.pdb, 14_AAT77177.1
color 0xeeeeee, 14_AAT77177.1
cealign 14_CBN82200.1, 14_AAT77177.1

label n. CA and resi 226 and 14_AAT77177.1, "%s" % (resn)
label n. CA and resi 284 and 14_AAT77177.1, "%s" % (resn)
select cons_AAT77177.1, resi 226 and 14_AAT77177.1 or resi 284 and 14_AAT77177.1
show licorice, cons_AAT77177.1
color atomic, cons_AAT77177.1



load data/wzy/alphafold/CAI34124.1/ranked_0.pdb, 28_CAI34124.1
color 0xeeeeee, 28_CAI34124.1
cealign 7tpg, 28_CAI34124.1

label n. CA and resi 267 and 28_CAI34124.1, "%s" % (resn)
label n. CA and resi 301 and 28_CAI34124.1, "%s" % (resn)
label n. CA and resi 304 and 28_CAI34124.1, "%s" % (resn)
label n. CA and resi 325 and 28_CAI34124.1, "%s" % (resn)
select cons_CAI34124.1, resi 267 and 28_CAI34124.1 or resi 301 and 28_CAI34124.1 or resi 304 and 28_CAI34124.1 or resi 325 and 28_CAI34124.1
show licorice, cons_CAI34124.1
color atomic, cons_CAI34124.1



load data/wzy/alphafold/AHB32490.1/ranked_0.pdb, 6_AHB32490.1
color 0xeeeeee, 6_AHB32490.1
cealign 7tpg, 6_AHB32490.1

label n. CA and resi 175 and 6_AHB32490.1, "%s" % (resn)
label n. CA and resi 238 and 6_AHB32490.1, "%s" % (resn)
label n. CA and resi 287 and 6_AHB32490.1, "%s" % (resn)
label n. CA and resi 429 and 6_AHB32490.1, "%s" % (resn)
select cons_AHB32490.1, resi 175 and 6_AHB32490.1 or resi 238 and 6_AHB32490.1 or resi 287 and 6_AHB32490.1 or resi 429 and 6_AHB32490.1
show licorice, cons_AHB32490.1
color atomic, cons_AHB32490.1



load data/wzy/alphafold/CAI32772.1/ranked_0.pdb, 6_CAI32772.1
color 0xeeeeee, 6_CAI32772.1
cealign 6_AHB32490.1, 6_CAI32772.1

label n. CA and resi 184 and 6_CAI32772.1, "%s" % (resn)
label n. CA and resi 242 and 6_CAI32772.1, "%s" % (resn)
label n. CA and resi 290 and 6_CAI32772.1, "%s" % (resn)
label n. CA and resi 441 and 6_CAI32772.1, "%s" % (resn)
select cons_CAI32772.1, resi 184 and 6_CAI32772.1 or resi 242 and 6_CAI32772.1 or resi 290 and 6_CAI32772.1 or resi 441 and 6_CAI32772.1
show licorice, cons_CAI32772.1
color atomic, cons_CAI32772.1



load data/wzy/alphafold/AHB32411.1/ranked_0.pdb, 29_AHB32411.1
color 0xeeeeee, 29_AHB32411.1
cealign 7tpg, 29_AHB32411.1

label n. CA and resi 162 and 29_AHB32411.1, "%s" % (resn)
label n. CA and resi 207 and 29_AHB32411.1, "%s" % (resn)
label n. CA and resi 242 and 29_AHB32411.1, "%s" % (resn)
label n. CA and resi 244 and 29_AHB32411.1, "%s" % (resn)
label n. CA and resi 251 and 29_AHB32411.1, "%s" % (resn)
select cons_AHB32411.1, resi 162 and 29_AHB32411.1 or resi 207 and 29_AHB32411.1 or resi 242 and 29_AHB32411.1 or resi 244 and 29_AHB32411.1 or resi 251 and 29_AHB32411.1
show licorice, cons_AHB32411.1
color atomic, cons_AHB32411.1



load data/wzy/alphafold/CAI34254.1/ranked_0.pdb, 30_CAI34254.1
color 0xeeeeee, 30_CAI34254.1
cealign 7tpg, 30_CAI34254.1

label n. CA and resi 171 and 30_CAI34254.1, "%s" % (resn)
label n. CA and resi 182 and 30_CAI34254.1, "%s" % (resn)
label n. CA and resi 183 and 30_CAI34254.1, "%s" % (resn)
label n. CA and resi 189 and 30_CAI34254.1, "%s" % (resn)
label n. CA and resi 272 and 30_CAI34254.1, "%s" % (resn)
label n. CA and resi 277 and 30_CAI34254.1, "%s" % (resn)
label n. CA and resi 281 and 30_CAI34254.1, "%s" % (resn)
select cons_CAI34254.1, resi 171 and 30_CAI34254.1 or resi 182 and 30_CAI34254.1 or resi 183 and 30_CAI34254.1 or resi 189 and 30_CAI34254.1 or resi 272 and 30_CAI34254.1 or resi 277 and 30_CAI34254.1 or resi 281 and 30_CAI34254.1
show licorice, cons_CAI34254.1
color atomic, cons_CAI34254.1



load data/wzy/alphafold/CAI34198.1/ranked_0.pdb, 30_CAI34198.1
color 0xeeeeee, 30_CAI34198.1
cealign 30_CAI34254.1, 30_CAI34198.1

label n. CA and resi 171 and 30_CAI34198.1, "%s" % (resn)
label n. CA and resi 182 and 30_CAI34198.1, "%s" % (resn)
label n. CA and resi 183 and 30_CAI34198.1, "%s" % (resn)
label n. CA and resi 189 and 30_CAI34198.1, "%s" % (resn)
label n. CA and resi 273 and 30_CAI34198.1, "%s" % (resn)
label n. CA and resi 278 and 30_CAI34198.1, "%s" % (resn)
label n. CA and resi 282 and 30_CAI34198.1, "%s" % (resn)
select cons_CAI34198.1, resi 171 and 30_CAI34198.1 or resi 182 and 30_CAI34198.1 or resi 183 and 30_CAI34198.1 or resi 189 and 30_CAI34198.1 or resi 273 and 30_CAI34198.1 or resi 278 and 30_CAI34198.1 or resi 282 and 30_CAI34198.1
show licorice, cons_CAI34198.1
color atomic, cons_CAI34198.1



load data/wzy/alphafold/CAI34217.1/ranked_0.pdb, 30_CAI34217.1
color 0xeeeeee, 30_CAI34217.1
cealign 30_CAI34254.1, 30_CAI34217.1

label n. CA and resi 175 and 30_CAI34217.1, "%s" % (resn)
label n. CA and resi 186 and 30_CAI34217.1, "%s" % (resn)
label n. CA and resi 187 and 30_CAI34217.1, "%s" % (resn)
label n. CA and resi 193 and 30_CAI34217.1, "%s" % (resn)
label n. CA and resi 276 and 30_CAI34217.1, "%s" % (resn)
label n. CA and resi 281 and 30_CAI34217.1, "%s" % (resn)
label n. CA and resi 285 and 30_CAI34217.1, "%s" % (resn)
select cons_CAI34217.1, resi 175 and 30_CAI34217.1 or resi 186 and 30_CAI34217.1 or resi 187 and 30_CAI34217.1 or resi 193 and 30_CAI34217.1 or resi 276 and 30_CAI34217.1 or resi 281 and 30_CAI34217.1 or resi 285 and 30_CAI34217.1
show licorice, cons_CAI34217.1
color atomic, cons_CAI34217.1



load data/eca-pol/alphafold/ACH50550.1/ranked_0.pdb, ACH50550.1
color 0xeeeeee, ACH50550.1
cealign 6_AHB32490.1, ACH50550.1
label n. CA and resi 145 and ACH50550.1, "%s-%s" % (resn, resi)
label n. CA and resi 247 and ACH50550.1, "%s-%s" % (resn, resi)
label n. CA and resi 248 and ACH50550.1, "%s-%s" % (resn, resi)
label n. CA and resi 399 and ACH50550.1, "%s-%s" % (resn, resi)
select cons, resi 145 and ACH50550.1 or resi 247 and ACH50550.1 or resi 248 and ACH50550.1 or resi 399 and ACH50550.1
show licorice, cons
color atomic, cons


set label_position,(1,1,1)
set label_position,(1,1,1)
set label_color,black
center 
disable 
bg_color white 
remove hydrogens 
set label_position, (0, 0, 20) 
