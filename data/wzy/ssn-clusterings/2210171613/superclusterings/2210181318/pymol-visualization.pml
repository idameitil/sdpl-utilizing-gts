set cartoon_side_chain_helper, on
set float_labels, on
set label_size, 15
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


load data/wzy/alphafold/AAD50486.1/ranked_0.pdb, 1_AAD50486.1
color teal, 1_AAD50486.1
cealign 7tpg, 1_AAD50486.1

label n. CA and resi 56 and 1_AAD50486.1, "%s-%s" % (resn, resi)
label n. CA and resi 61 and 1_AAD50486.1, "%s-%s" % (resn, resi)
label n. CA and resi 151 and 1_AAD50486.1, "%s-%s" % (resn, resi)
label n. CA and resi 185 and 1_AAD50486.1, "%s-%s" % (resn, resi)
label n. CA and resi 318 and 1_AAD50486.1, "%s-%s" % (resn, resi)
select cons_AAD50486.1, resi 56 and 1_AAD50486.1 or resi 61 and 1_AAD50486.1 or resi 151 and 1_AAD50486.1 or resi 185 and 1_AAD50486.1 or resi 318 and 1_AAD50486.1
show licorice, cons_AAD50486.1
color atomic, cons_AAD50486.1



load data/wzy/alphafold/AAK64372.1/ranked_0.pdb, 1_AAK64372.1
color orange, 1_AAK64372.1
cealign 1_AAD50486.1, 1_AAK64372.1

label n. CA and resi 57 and 1_AAK64372.1, "%s-%s" % (resn, resi)
label n. CA and resi 61 and 1_AAK64372.1, "%s-%s" % (resn, resi)
label n. CA and resi 142 and 1_AAK64372.1, "%s-%s" % (resn, resi)
label n. CA and resi 176 and 1_AAK64372.1, "%s-%s" % (resn, resi)
label n. CA and resi 292 and 1_AAK64372.1, "%s-%s" % (resn, resi)
select cons_AAK64372.1, resi 57 and 1_AAK64372.1 or resi 61 and 1_AAK64372.1 or resi 142 and 1_AAK64372.1 or resi 176 and 1_AAK64372.1 or resi 292 and 1_AAK64372.1
show licorice, cons_AAK64372.1
color atomic, cons_AAK64372.1



load data/wzy/alphafold/CAI34008.1/ranked_0.pdb, 1_CAI34008.1
color green, 1_CAI34008.1
cealign 1_AAD50486.1, 1_CAI34008.1

label n. CA and resi 51 and 1_CAI34008.1, "%s-%s" % (resn, resi)
label n. CA and resi 55 and 1_CAI34008.1, "%s-%s" % (resn, resi)
label n. CA and resi 153 and 1_CAI34008.1, "%s-%s" % (resn, resi)
label n. CA and resi 187 and 1_CAI34008.1, "%s-%s" % (resn, resi)
label n. CA and resi 315 and 1_CAI34008.1, "%s-%s" % (resn, resi)
select cons_CAI34008.1, resi 51 and 1_CAI34008.1 or resi 55 and 1_CAI34008.1 or resi 153 and 1_CAI34008.1 or resi 187 and 1_CAI34008.1 or resi 315 and 1_CAI34008.1
show licorice, cons_CAI34008.1
color atomic, cons_CAI34008.1



load data/wzy/alphafold/ABK27355.1/ranked_0.pdb, 1_ABK27355.1
color br6, 1_ABK27355.1
cealign 1_AAD50486.1, 1_ABK27355.1

label n. CA and resi 49 and 1_ABK27355.1, "%s-%s" % (resn, resi)
label n. CA and resi 53 and 1_ABK27355.1, "%s-%s" % (resn, resi)
label n. CA and resi 133 and 1_ABK27355.1, "%s-%s" % (resn, resi)
label n. CA and resi 168 and 1_ABK27355.1, "%s-%s" % (resn, resi)
label n. CA and resi 289 and 1_ABK27355.1, "%s-%s" % (resn, resi)
select cons_ABK27355.1, resi 49 and 1_ABK27355.1 or resi 53 and 1_ABK27355.1 or resi 133 and 1_ABK27355.1 or resi 168 and 1_ABK27355.1 or resi 289 and 1_ABK27355.1
show licorice, cons_ABK27355.1
color atomic, cons_ABK27355.1



load data/wzy/alphafold/ADC54967.1/ranked_0.pdb, 1_ADC54967.1
color red, 1_ADC54967.1
cealign 1_AAD50486.1, 1_ADC54967.1

label n. CA and resi 50 and 1_ADC54967.1, "%s-%s" % (resn, resi)
label n. CA and resi 54 and 1_ADC54967.1, "%s-%s" % (resn, resi)
label n. CA and resi 142 and 1_ADC54967.1, "%s-%s" % (resn, resi)
label n. CA and resi 174 and 1_ADC54967.1, "%s-%s" % (resn, resi)
label n. CA and resi 300 and 1_ADC54967.1, "%s-%s" % (resn, resi)
select cons_ADC54967.1, resi 50 and 1_ADC54967.1 or resi 54 and 1_ADC54967.1 or resi 142 and 1_ADC54967.1 or resi 174 and 1_ADC54967.1 or resi 300 and 1_ADC54967.1
show licorice, cons_ADC54967.1
color atomic, cons_ADC54967.1



load data/wzy/alphafold/CAI33817.1/ranked_0.pdb, 3_CAI33817.1
color teal, 3_CAI33817.1
cealign 7tpg, 3_CAI33817.1

select cons_CAI33817
show licorice, cons_CAI33817.1
color atomic, cons_CAI33817.1



load data/wzy/alphafold/ADI43263.1/ranked_0.pdb, 3_ADI43263.1
color orange, 3_ADI43263.1
cealign 3_CAI33817.1, 3_ADI43263.1

select cons_ADI43263
show licorice, cons_ADI43263.1
color atomic, cons_ADI43263.1



load data/wzy/alphafold/CAI34254.1/ranked_0.pdb, 3_CAI34254.1
color green, 3_CAI34254.1
cealign 3_CAI33817.1, 3_CAI34254.1

select cons_CAI34254
show licorice, cons_CAI34254.1
color atomic, cons_CAI34254.1



load data/wzy/alphafold/ADR74237.1/ranked_0.pdb, 3_ADR74237.1
color br6, 3_ADR74237.1
cealign 3_CAI33817.1, 3_ADR74237.1

select cons_ADR74237
show licorice, cons_ADR74237.1
color atomic, cons_ADR74237.1



load data/wzy/alphafold/CAI34217.1/ranked_0.pdb, 3_CAI34217.1
color red, 3_CAI34217.1
cealign 3_CAI33817.1, 3_CAI34217.1

select cons_CAI34217
show licorice, cons_CAI34217.1
color atomic, cons_CAI34217.1



load data/wzy/alphafold/BAQ00957.1/ranked_0.pdb, 4_BAQ00957.1
color teal, 4_BAQ00957.1
cealign 7tpg, 4_BAQ00957.1

label n. CA and resi 141 and 4_BAQ00957.1, "%s-%s" % (resn, resi)
label n. CA and resi 265 and 4_BAQ00957.1, "%s-%s" % (resn, resi)
label n. CA and resi 294 and 4_BAQ00957.1, "%s-%s" % (resn, resi)
select cons_BAQ00957.1, resi 141 and 4_BAQ00957.1 or resi 265 and 4_BAQ00957.1 or resi 294 and 4_BAQ00957.1
show licorice, cons_BAQ00957.1
color atomic, cons_BAQ00957.1



load data/wzy/alphafold/AIG62747.1/ranked_0.pdb, 4_AIG62747.1
color orange, 4_AIG62747.1
cealign 4_BAQ00957.1, 4_AIG62747.1

label n. CA and resi 134 and 4_AIG62747.1, "%s-%s" % (resn, resi)
label n. CA and resi 250 and 4_AIG62747.1, "%s-%s" % (resn, resi)
label n. CA and resi 280 and 4_AIG62747.1, "%s-%s" % (resn, resi)
select cons_AIG62747.1, resi 134 and 4_AIG62747.1 or resi 250 and 4_AIG62747.1 or resi 280 and 4_AIG62747.1
show licorice, cons_AIG62747.1
color atomic, cons_AIG62747.1



load data/wzy/alphafold/CAI33309.1/ranked_0.pdb, 4_CAI33309.1
color green, 4_CAI33309.1
cealign 4_BAQ00957.1, 4_CAI33309.1

label n. CA and resi 150 and 4_CAI33309.1, "%s-%s" % (resn, resi)
label n. CA and resi 266 and 4_CAI33309.1, "%s-%s" % (resn, resi)
label n. CA and resi 304 and 4_CAI33309.1, "%s-%s" % (resn, resi)
select cons_CAI33309.1, resi 150 and 4_CAI33309.1 or resi 266 and 4_CAI33309.1 or resi 304 and 4_CAI33309.1
show licorice, cons_CAI33309.1
color atomic, cons_CAI33309.1



load data/wzy/alphafold/CAI34369.1/ranked_0.pdb, 4_CAI34369.1
color br6, 4_CAI34369.1
cealign 4_BAQ00957.1, 4_CAI34369.1

label n. CA and resi 151 and 4_CAI34369.1, "%s-%s" % (resn, resi)
label n. CA and resi 268 and 4_CAI34369.1, "%s-%s" % (resn, resi)
label n. CA and resi 308 and 4_CAI34369.1, "%s-%s" % (resn, resi)
select cons_CAI34369.1, resi 151 and 4_CAI34369.1 or resi 268 and 4_CAI34369.1 or resi 308 and 4_CAI34369.1
show licorice, cons_CAI34369.1
color atomic, cons_CAI34369.1



load data/wzy/alphafold/WP_000220864.1/ranked_0.pdb, 2_WP_000220864.1
color teal, 2_WP_000220864.1
cealign 7tpg, 2_WP_000220864.1

label n. CA and resi 240 and 2_WP_000220864.1, "%s-%s" % (resn, resi)
select cons_WP_000220864.1, resi 240 and 2_WP_000220864.1
show licorice, cons_WP_000220864.1
color atomic, cons_WP_000220864.1



load data/wzy/alphafold/BAQ01516.1/ranked_0.pdb, 2_BAQ01516.1
color orange, 2_BAQ01516.1
cealign 2_WP_000220864.1, 2_BAQ01516.1

label n. CA and resi 264 and 2_BAQ01516.1, "%s-%s" % (resn, resi)
select cons_BAQ01516.1, resi 264 and 2_BAQ01516.1
show licorice, cons_BAQ01516.1
color atomic, cons_BAQ01516.1



load data/wzy/alphafold/AHB32411.1/ranked_0.pdb, 2_AHB32411.1
color green, 2_AHB32411.1
cealign 2_WP_000220864.1, 2_AHB32411.1

label n. CA and resi 244 and 2_AHB32411.1, "%s-%s" % (resn, resi)
select cons_AHB32411.1, resi 244 and 2_AHB32411.1
show licorice, cons_AHB32411.1
color atomic, cons_AHB32411.1



load data/wzy/alphafold/BAQ01780.1/ranked_0.pdb, 2_BAQ01780.1
color br6, 2_BAQ01780.1
cealign 2_WP_000220864.1, 2_BAQ01780.1

label n. CA and resi 228 and 2_BAQ01780.1, "%s-%s" % (resn, resi)
select cons_BAQ01780.1, resi 228 and 2_BAQ01780.1
show licorice, cons_BAQ01780.1
color atomic, cons_BAQ01780.1



load data/wzy/alphafold/AAZ85718.1/ranked_0.pdb, 2_AAZ85718.1
color red, 2_AAZ85718.1
cealign 2_WP_000220864.1, 2_AAZ85718.1

label n. CA and resi 269 and 2_AAZ85718.1, "%s-%s" % (resn, resi)
select cons_AAZ85718.1, resi 269 and 2_AAZ85718.1
show licorice, cons_AAZ85718.1
color atomic, cons_AAZ85718.1



load data/wzy/alphafold/AAA97573.1/ranked_0.pdb, 10_AAA97573.1
color teal, 10_AAA97573.1
cealign 7tpg, 10_AAA97573.1

label n. CA and resi 173 and 10_AAA97573.1, "%s-%s" % (resn, resi)
label n. CA and resi 176 and 10_AAA97573.1, "%s-%s" % (resn, resi)
label n. CA and resi 234 and 10_AAA97573.1, "%s-%s" % (resn, resi)
label n. CA and resi 291 and 10_AAA97573.1, "%s-%s" % (resn, resi)
label n. CA and resi 349 and 10_AAA97573.1, "%s-%s" % (resn, resi)
select cons_AAA97573.1, resi 173 and 10_AAA97573.1 or resi 176 and 10_AAA97573.1 or resi 234 and 10_AAA97573.1 or resi 291 and 10_AAA97573.1 or resi 349 and 10_AAA97573.1
show licorice, cons_AAA97573.1
color atomic, cons_AAA97573.1



load data/wzy/alphafold/AAC45857.1/ranked_0.pdb, 10_AAC45857.1
color orange, 10_AAC45857.1
cealign 10_AAA97573.1, 10_AAC45857.1

label n. CA and resi 173 and 10_AAC45857.1, "%s-%s" % (resn, resi)
label n. CA and resi 176 and 10_AAC45857.1, "%s-%s" % (resn, resi)
label n. CA and resi 234 and 10_AAC45857.1, "%s-%s" % (resn, resi)
label n. CA and resi 291 and 10_AAC45857.1, "%s-%s" % (resn, resi)
label n. CA and resi 349 and 10_AAC45857.1, "%s-%s" % (resn, resi)
select cons_AAC45857.1, resi 173 and 10_AAC45857.1 or resi 176 and 10_AAC45857.1 or resi 234 and 10_AAC45857.1 or resi 291 and 10_AAC45857.1 or resi 349 and 10_AAC45857.1
show licorice, cons_AAC45857.1
color atomic, cons_AAC45857.1



load data/wzy/alphafold/CDF66396.1/ranked_0.pdb, 10_CDF66396.1
color green, 10_CDF66396.1
cealign 10_AAA97573.1, 10_CDF66396.1

label n. CA and resi 168 and 10_CDF66396.1, "%s-%s" % (resn, resi)
label n. CA and resi 171 and 10_CDF66396.1, "%s-%s" % (resn, resi)
label n. CA and resi 228 and 10_CDF66396.1, "%s-%s" % (resn, resi)
label n. CA and resi 284 and 10_CDF66396.1, "%s-%s" % (resn, resi)
label n. CA and resi 345 and 10_CDF66396.1, "%s-%s" % (resn, resi)
select cons_CDF66396.1, resi 168 and 10_CDF66396.1 or resi 171 and 10_CDF66396.1 or resi 228 and 10_CDF66396.1 or resi 284 and 10_CDF66396.1 or resi 345 and 10_CDF66396.1
show licorice, cons_CDF66396.1
color atomic, cons_CDF66396.1



load data/wzy/alphafold/ACA24754.1/ranked_0.pdb, 6_ACA24754.1
color teal, 6_ACA24754.1
cealign 7tpg, 6_ACA24754.1

select cons_ACA24754
show licorice, cons_ACA24754.1
color atomic, cons_ACA24754.1



load data/wzy/alphafold/BAQ00795.1/ranked_0.pdb, 6_BAQ00795.1
color orange, 6_BAQ00795.1
cealign 6_ACA24754.1, 6_BAQ00795.1

label n. CA and resi 312 and 6_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 366 and 6_BAQ00795.1, "%s-%s" % (resn, resi)
select cons_BAQ00795.1, resi 312 and 6_BAQ00795.1 or resi 366 and 6_BAQ00795.1
show licorice, cons_BAQ00795.1
color atomic, cons_BAQ00795.1



load data/wzy/alphafold/BAQ02088.1/ranked_0.pdb, 6_BAQ02088.1
color green, 6_BAQ02088.1
cealign 6_ACA24754.1, 6_BAQ02088.1

label n. CA and resi 343 and 6_BAQ02088.1, "%s-%s" % (resn, resi)
label n. CA and resi 395 and 6_BAQ02088.1, "%s-%s" % (resn, resi)
select cons_BAQ02088.1, resi 343 and 6_BAQ02088.1 or resi 395 and 6_BAQ02088.1
show licorice, cons_BAQ02088.1
color atomic, cons_BAQ02088.1



load data/wzy/alphafold/BAQ01659.1/ranked_0.pdb, 6_BAQ01659.1
color br6, 6_BAQ01659.1
cealign 6_ACA24754.1, 6_BAQ01659.1

label n. CA and resi 315 and 6_BAQ01659.1, "%s-%s" % (resn, resi)
label n. CA and resi 367 and 6_BAQ01659.1, "%s-%s" % (resn, resi)
select cons_BAQ01659.1, resi 315 and 6_BAQ01659.1 or resi 367 and 6_BAQ01659.1
show licorice, cons_BAQ01659.1
color atomic, cons_BAQ01659.1



load data/wzy/alphafold/AHB32490.1/ranked_0.pdb, 5_AHB32490.1
color teal, 5_AHB32490.1
cealign 7tpg, 5_AHB32490.1

label n. CA and resi 238 and 5_AHB32490.1, "%s-%s" % (resn, resi)
label n. CA and resi 429 and 5_AHB32490.1, "%s-%s" % (resn, resi)
select cons_AHB32490.1, resi 238 and 5_AHB32490.1 or resi 429 and 5_AHB32490.1
show licorice, cons_AHB32490.1
color atomic, cons_AHB32490.1



load data/wzy/alphafold/CAI32772.1/ranked_0.pdb, 5_CAI32772.1
color orange, 5_CAI32772.1
cealign 5_AHB32490.1, 5_CAI32772.1

label n. CA and resi 242 and 5_CAI32772.1, "%s-%s" % (resn, resi)
label n. CA and resi 441 and 5_CAI32772.1, "%s-%s" % (resn, resi)
select cons_CAI32772.1, resi 242 and 5_CAI32772.1 or resi 441 and 5_CAI32772.1
show licorice, cons_CAI32772.1
color atomic, cons_CAI32772.1



load data/wzy/alphafold/CAI32705.1/ranked_0.pdb, 5_CAI32705.1
color green, 5_CAI32705.1
cealign 5_AHB32490.1, 5_CAI32705.1

label n. CA and resi 214 and 5_CAI32705.1, "%s-%s" % (resn, resi)
label n. CA and resi 395 and 5_CAI32705.1, "%s-%s" % (resn, resi)
select cons_CAI32705.1, resi 214 and 5_CAI32705.1 or resi 395 and 5_CAI32705.1
show licorice, cons_CAI32705.1
color atomic, cons_CAI32705.1



load data/wzy/alphafold/CBN82200.1/ranked_0.pdb, 12_CBN82200.1
color teal, 12_CBN82200.1
cealign 7tpg, 12_CBN82200.1

label n. CA and resi 211 and 12_CBN82200.1, "%s-%s" % (resn, resi)
label n. CA and resi 270 and 12_CBN82200.1, "%s-%s" % (resn, resi)
select cons_CBN82200.1, resi 211 and 12_CBN82200.1 or resi 270 and 12_CBN82200.1
show licorice, cons_CBN82200.1
color atomic, cons_CBN82200.1



load data/wzy/alphafold/AAT77177.1/ranked_0.pdb, 12_AAT77177.1
color orange, 12_AAT77177.1
cealign 12_CBN82200.1, 12_AAT77177.1

label n. CA and resi 226 and 12_AAT77177.1, "%s-%s" % (resn, resi)
label n. CA and resi 284 and 12_AAT77177.1, "%s-%s" % (resn, resi)
select cons_AAT77177.1, resi 226 and 12_AAT77177.1 or resi 284 and 12_AAT77177.1
show licorice, cons_AAT77177.1
color atomic, cons_AAT77177.1



load data/wzy/alphafold/CAI34124.1/ranked_0.pdb, 24_CAI34124.1
color teal, 24_CAI34124.1
cealign 7tpg, 24_CAI34124.1

label n. CA and resi 267 and 24_CAI34124.1, "%s-%s" % (resn, resi)
label n. CA and resi 301 and 24_CAI34124.1, "%s-%s" % (resn, resi)
label n. CA and resi 304 and 24_CAI34124.1, "%s-%s" % (resn, resi)
label n. CA and resi 325 and 24_CAI34124.1, "%s-%s" % (resn, resi)
select cons_CAI34124.1, resi 267 and 24_CAI34124.1 or resi 301 and 24_CAI34124.1 or resi 304 and 24_CAI34124.1 or resi 325 and 24_CAI34124.1
show licorice, cons_CAI34124.1
color atomic, cons_CAI34124.1



load data/wzy/alphafold/CAB63298.1/ranked_0.pdb, 7_CAB63298.1
color teal, 7_CAB63298.1
cealign 7tpg, 7_CAB63298.1

label n. CA and resi 218 and 7_CAB63298.1, "%s-%s" % (resn, resi)
label n. CA and resi 239 and 7_CAB63298.1, "%s-%s" % (resn, resi)
select cons_CAB63298.1, resi 218 and 7_CAB63298.1 or resi 239 and 7_CAB63298.1
show licorice, cons_CAB63298.1
color atomic, cons_CAB63298.1



load data/wzy/alphafold/AFC91472.1/ranked_0.pdb, 7_AFC91472.1
color orange, 7_AFC91472.1
cealign 7_CAB63298.1, 7_AFC91472.1

label n. CA and resi 208 and 7_AFC91472.1, "%s-%s" % (resn, resi)
label n. CA and resi 239 and 7_AFC91472.1, "%s-%s" % (resn, resi)
select cons_AFC91472.1, resi 208 and 7_AFC91472.1 or resi 239 and 7_AFC91472.1
show licorice, cons_AFC91472.1
color atomic, cons_AFC91472.1



load data/wzy/alphafold/ABG81806.1/ranked_0.pdb, 7_ABG81806.1
color green, 7_ABG81806.1
cealign 7_CAB63298.1, 7_ABG81806.1

label n. CA and resi 221 and 7_ABG81806.1, "%s-%s" % (resn, resi)
label n. CA and resi 255 and 7_ABG81806.1, "%s-%s" % (resn, resi)
select cons_ABG81806.1, resi 221 and 7_ABG81806.1 or resi 255 and 7_ABG81806.1
show licorice, cons_ABG81806.1
color atomic, cons_ABG81806.1



load data/wzy/alphafold/BAQ01843.1/ranked_0.pdb, 7_BAQ01843.1
color br6, 7_BAQ01843.1
cealign 7_CAB63298.1, 7_BAQ01843.1

label n. CA and resi 227 and 7_BAQ01843.1, "%s-%s" % (resn, resi)
label n. CA and resi 246 and 7_BAQ01843.1, "%s-%s" % (resn, resi)
select cons_BAQ01843.1, resi 227 and 7_BAQ01843.1 or resi 246 and 7_BAQ01843.1
show licorice, cons_BAQ01843.1
color atomic, cons_BAQ01843.1



load data/wzy/alphafold/BAQ02224.1/ranked_0.pdb, 7_BAQ02224.1
color red, 7_BAQ02224.1
cealign 7_CAB63298.1, 7_BAQ02224.1

label n. CA and resi 221 and 7_BAQ02224.1, "%s-%s" % (resn, resi)
label n. CA and resi 255 and 7_BAQ02224.1, "%s-%s" % (resn, resi)
select cons_BAQ02224.1, resi 221 and 7_BAQ02224.1 or resi 255 and 7_BAQ02224.1
show licorice, cons_BAQ02224.1
color atomic, cons_BAQ02224.1



load data/wzy/alphafold/CAI33149.1/ranked_0.pdb, 8_CAI33149.1
color teal, 8_CAI33149.1
cealign 7tpg, 8_CAI33149.1

label n. CA and resi 265 and 8_CAI33149.1, "%s-%s" % (resn, resi)
label n. CA and resi 307 and 8_CAI33149.1, "%s-%s" % (resn, resi)
select cons_CAI33149.1, resi 265 and 8_CAI33149.1 or resi 307 and 8_CAI33149.1
show licorice, cons_CAI33149.1
color atomic, cons_CAI33149.1



load data/wzy/alphafold/AAY28249.1/ranked_0.pdb, 8_AAY28249.1
color orange, 8_AAY28249.1
cealign 8_CAI33149.1, 8_AAY28249.1

label n. CA and resi 259 and 8_AAY28249.1, "%s-%s" % (resn, resi)
label n. CA and resi 292 and 8_AAY28249.1, "%s-%s" % (resn, resi)
select cons_AAY28249.1, resi 259 and 8_AAY28249.1 or resi 292 and 8_AAY28249.1
show licorice, cons_AAY28249.1
color atomic, cons_AAY28249.1



load data/wzy/alphafold/CAI33491.1/ranked_0.pdb, 8_CAI33491.1
color green, 8_CAI33491.1
cealign 8_CAI33149.1, 8_CAI33491.1

label n. CA and resi 261 and 8_CAI33491.1, "%s-%s" % (resn, resi)
label n. CA and resi 306 and 8_CAI33491.1, "%s-%s" % (resn, resi)
select cons_CAI33491.1, resi 261 and 8_CAI33491.1 or resi 306 and 8_CAI33491.1
show licorice, cons_CAI33491.1
color atomic, cons_CAI33491.1



load data/wzy/alphafold/CAI33029.1/ranked_0.pdb, 8_CAI33029.1
color br6, 8_CAI33029.1
cealign 8_CAI33149.1, 8_CAI33029.1

label n. CA and resi 262 and 8_CAI33029.1, "%s-%s" % (resn, resi)
label n. CA and resi 300 and 8_CAI33029.1, "%s-%s" % (resn, resi)
select cons_CAI33029.1, resi 262 and 8_CAI33029.1 or resi 300 and 8_CAI33029.1
show licorice, cons_CAI33029.1
color atomic, cons_CAI33029.1


set label_position,(1,1,1)
set label_color,black
center 
disable 
bg_color white 
