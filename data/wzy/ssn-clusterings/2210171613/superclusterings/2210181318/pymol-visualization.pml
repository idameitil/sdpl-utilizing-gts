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


load data/wzy/alphafold/BAQ01743.1/ranked_0.pdb, 1_BAQ01743.1
color teal, 1_BAQ01743.1
cealign 7tpg, 1_BAQ01743.1

label n. CA and resi 82 and 1_BAQ01743.1, "%s-%s" % (resn, resi)
label n. CA and resi 181 and 1_BAQ01743.1, "%s-%s" % (resn, resi)
label n. CA and resi 215 and 1_BAQ01743.1, "%s-%s" % (resn, resi)
label n. CA and resi 330 and 1_BAQ01743.1, "%s-%s" % (resn, resi)
select cons_BAQ01743.1, resi 82 and 1_BAQ01743.1 or resi 181 and 1_BAQ01743.1 or resi 215 and 1_BAQ01743.1 or resi 330 and 1_BAQ01743.1
show licorice, cons_BAQ01743.1
color atomic, cons_BAQ01743.1



load data/wzy/alphafold/AHB32687.1/ranked_0.pdb, 1_AHB32687.1
color orange, 1_AHB32687.1
cealign 1_BAQ01743.1, 1_AHB32687.1

label n. CA and resi 83 and 1_AHB32687.1, "%s-%s" % (resn, resi)
label n. CA and resi 184 and 1_AHB32687.1, "%s-%s" % (resn, resi)
label n. CA and resi 218 and 1_AHB32687.1, "%s-%s" % (resn, resi)
label n. CA and resi 335 and 1_AHB32687.1, "%s-%s" % (resn, resi)
select cons_AHB32687.1, resi 83 and 1_AHB32687.1 or resi 184 and 1_AHB32687.1 or resi 218 and 1_AHB32687.1 or resi 335 and 1_AHB32687.1
show licorice, cons_AHB32687.1
color atomic, cons_AHB32687.1



load data/wzy/alphafold/AHB32666.1/ranked_0.pdb, 1_AHB32666.1
color green, 1_AHB32666.1
cealign 1_BAQ01743.1, 1_AHB32666.1

label n. CA and resi 7 and 1_AHB32666.1, "%s-%s" % (resn, resi)
label n. CA and resi 101 and 1_AHB32666.1, "%s-%s" % (resn, resi)
label n. CA and resi 135 and 1_AHB32666.1, "%s-%s" % (resn, resi)
label n. CA and resi 263 and 1_AHB32666.1, "%s-%s" % (resn, resi)
select cons_AHB32666.1, resi 7 and 1_AHB32666.1 or resi 101 and 1_AHB32666.1 or resi 135 and 1_AHB32666.1 or resi 263 and 1_AHB32666.1
show licorice, cons_AHB32666.1
color atomic, cons_AHB32666.1



load data/wzy/alphafold/ABI55342.1/ranked_0.pdb, 1_ABI55342.1
color br6, 1_ABI55342.1
cealign 1_BAQ01743.1, 1_ABI55342.1

label n. CA and resi 85 and 1_ABI55342.1, "%s-%s" % (resn, resi)
label n. CA and resi 184 and 1_ABI55342.1, "%s-%s" % (resn, resi)
label n. CA and resi 214 and 1_ABI55342.1, "%s-%s" % (resn, resi)
label n. CA and resi 336 and 1_ABI55342.1, "%s-%s" % (resn, resi)
select cons_ABI55342.1, resi 85 and 1_ABI55342.1 or resi 184 and 1_ABI55342.1 or resi 214 and 1_ABI55342.1 or resi 336 and 1_ABI55342.1
show licorice, cons_ABI55342.1
color atomic, cons_ABI55342.1



load data/wzy/alphafold/BAQ01641.1/ranked_0.pdb, 1_BAQ01641.1
color red, 1_BAQ01641.1
cealign 1_BAQ01743.1, 1_BAQ01641.1

label n. CA and resi 93 and 1_BAQ01641.1, "%s-%s" % (resn, resi)
label n. CA and resi 193 and 1_BAQ01641.1, "%s-%s" % (resn, resi)
label n. CA and resi 222 and 1_BAQ01641.1, "%s-%s" % (resn, resi)
label n. CA and resi 343 and 1_BAQ01641.1, "%s-%s" % (resn, resi)
select cons_BAQ01641.1, resi 93 and 1_BAQ01641.1 or resi 193 and 1_BAQ01641.1 or resi 222 and 1_BAQ01641.1 or resi 343 and 1_BAQ01641.1
show licorice, cons_BAQ01641.1
color atomic, cons_BAQ01641.1



load data/wzy/alphafold/CAI33817.1/ranked_0.pdb, 3_CAI33817.1
color teal, 3_CAI33817.1
cealign 7tpg, 3_CAI33817.1

select cons_CAI33817
show licorice, cons_CAI33817.1
color atomic, cons_CAI33817.1



load data/wzy/alphafold/CAI33324.1/ranked_0.pdb, 3_CAI33324.1
color orange, 3_CAI33324.1
cealign 3_CAI33817.1, 3_CAI33324.1

select cons_CAI33324
show licorice, cons_CAI33324.1
color atomic, cons_CAI33324.1



load data/wzy/alphafold/CAI33412.1/ranked_0.pdb, 3_CAI33412.1
color green, 3_CAI33412.1
cealign 3_CAI33817.1, 3_CAI33412.1

select cons_CAI33412
show licorice, cons_CAI33412.1
color atomic, cons_CAI33412.1



load data/wzy/alphafold/CAI34254.1/ranked_0.pdb, 3_CAI34254.1
color br6, 3_CAI34254.1
cealign 3_CAI33817.1, 3_CAI34254.1

select cons_CAI34254
show licorice, cons_CAI34254.1
color atomic, cons_CAI34254.1



load data/wzy/alphafold/CAI34198.1/ranked_0.pdb, 3_CAI34198.1
color red, 3_CAI34198.1
cealign 3_CAI33817.1, 3_CAI34198.1

select cons_CAI34198
show licorice, cons_CAI34198.1
color atomic, cons_CAI34198.1



load data/wzy/alphafold/BAQ00957.1/ranked_0.pdb, 4_BAQ00957.1
color teal, 4_BAQ00957.1
cealign 7tpg, 4_BAQ00957.1

label n. CA and resi 265 and 4_BAQ00957.1, "%s-%s" % (resn, resi)
label n. CA and resi 294 and 4_BAQ00957.1, "%s-%s" % (resn, resi)
select cons_BAQ00957.1, resi 265 and 4_BAQ00957.1 or resi 294 and 4_BAQ00957.1
show licorice, cons_BAQ00957.1
color atomic, cons_BAQ00957.1



load data/wzy/alphafold/AIG62747.1/ranked_0.pdb, 4_AIG62747.1
color orange, 4_AIG62747.1
cealign 4_BAQ00957.1, 4_AIG62747.1

label n. CA and resi 250 and 4_AIG62747.1, "%s-%s" % (resn, resi)
label n. CA and resi 280 and 4_AIG62747.1, "%s-%s" % (resn, resi)
select cons_AIG62747.1, resi 250 and 4_AIG62747.1 or resi 280 and 4_AIG62747.1
show licorice, cons_AIG62747.1
color atomic, cons_AIG62747.1



load data/wzy/alphafold/CAI33309.1/ranked_0.pdb, 4_CAI33309.1
color green, 4_CAI33309.1
cealign 4_BAQ00957.1, 4_CAI33309.1

label n. CA and resi 266 and 4_CAI33309.1, "%s-%s" % (resn, resi)
label n. CA and resi 304 and 4_CAI33309.1, "%s-%s" % (resn, resi)
select cons_CAI33309.1, resi 266 and 4_CAI33309.1 or resi 304 and 4_CAI33309.1
show licorice, cons_CAI33309.1
color atomic, cons_CAI33309.1



load data/wzy/alphafold/CAI34369.1/ranked_0.pdb, 4_CAI34369.1
color br6, 4_CAI34369.1
cealign 4_BAQ00957.1, 4_CAI34369.1

label n. CA and resi 268 and 4_CAI34369.1, "%s-%s" % (resn, resi)
label n. CA and resi 308 and 4_CAI34369.1, "%s-%s" % (resn, resi)
select cons_CAI34369.1, resi 268 and 4_CAI34369.1 or resi 308 and 4_CAI34369.1
show licorice, cons_CAI34369.1
color atomic, cons_CAI34369.1



load data/wzy/alphafold/ADC54950.1/ranked_0.pdb, 2_ADC54950.1
color teal, 2_ADC54950.1
cealign 7tpg, 2_ADC54950.1

select cons_ADC54950
show licorice, cons_ADC54950.1
color atomic, cons_ADC54950.1



load data/wzy/alphafold/AJE24464.1/ranked_0.pdb, 2_AJE24464.1
color orange, 2_AJE24464.1
cealign 2_ADC54950.1, 2_AJE24464.1

select cons_AJE24464
show licorice, cons_AJE24464.1
color atomic, cons_AJE24464.1



load data/wzy/alphafold/CAI33798.1/ranked_0.pdb, 2_CAI33798.1
color green, 2_CAI33798.1
cealign 2_ADC54950.1, 2_CAI33798.1

select cons_CAI33798
show licorice, cons_CAI33798.1
color atomic, cons_CAI33798.1



load data/wzy/alphafold/BAQ01516.1/ranked_0.pdb, 2_BAQ01516.1
color br6, 2_BAQ01516.1
cealign 2_ADC54950.1, 2_BAQ01516.1

select cons_BAQ01516
show licorice, cons_BAQ01516.1
color atomic, cons_BAQ01516.1



load data/wzy/alphafold/BAQ01780.1/ranked_0.pdb, 2_BAQ01780.1
color red, 2_BAQ01780.1
cealign 2_ADC54950.1, 2_BAQ01780.1

select cons_BAQ01780
show licorice, cons_BAQ01780.1
color atomic, cons_BAQ01780.1



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



load data/wzy/alphafold/CDF66396.1/ranked_0.pdb, 10_CDF66396.1
color orange, 10_CDF66396.1
cealign 10_AAA97573.1, 10_CDF66396.1

label n. CA and resi 168 and 10_CDF66396.1, "%s-%s" % (resn, resi)
label n. CA and resi 171 and 10_CDF66396.1, "%s-%s" % (resn, resi)
label n. CA and resi 228 and 10_CDF66396.1, "%s-%s" % (resn, resi)
label n. CA and resi 284 and 10_CDF66396.1, "%s-%s" % (resn, resi)
label n. CA and resi 345 and 10_CDF66396.1, "%s-%s" % (resn, resi)
select cons_CDF66396.1, resi 168 and 10_CDF66396.1 or resi 171 and 10_CDF66396.1 or resi 228 and 10_CDF66396.1 or resi 284 and 10_CDF66396.1 or resi 345 and 10_CDF66396.1
show licorice, cons_CDF66396.1
color atomic, cons_CDF66396.1



load data/wzy/alphafold/AAC45857.1/ranked_0.pdb, 10_AAC45857.1
color green, 10_AAC45857.1
cealign 10_AAA97573.1, 10_AAC45857.1

label n. CA and resi 173 and 10_AAC45857.1, "%s-%s" % (resn, resi)
label n. CA and resi 176 and 10_AAC45857.1, "%s-%s" % (resn, resi)
label n. CA and resi 234 and 10_AAC45857.1, "%s-%s" % (resn, resi)
label n. CA and resi 291 and 10_AAC45857.1, "%s-%s" % (resn, resi)
label n. CA and resi 349 and 10_AAC45857.1, "%s-%s" % (resn, resi)
select cons_AAC45857.1, resi 173 and 10_AAC45857.1 or resi 176 and 10_AAC45857.1 or resi 234 and 10_AAC45857.1 or resi 291 and 10_AAC45857.1 or resi 349 and 10_AAC45857.1
show licorice, cons_AAC45857.1
color atomic, cons_AAC45857.1



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



load data/wzy/alphafold/CAI32705.1/ranked_0.pdb, 5_CAI32705.1
color teal, 5_CAI32705.1
cealign 7tpg, 5_CAI32705.1

label n. CA and resi 214 and 5_CAI32705.1, "%s-%s" % (resn, resi)
label n. CA and resi 395 and 5_CAI32705.1, "%s-%s" % (resn, resi)
select cons_CAI32705.1, resi 214 and 5_CAI32705.1 or resi 395 and 5_CAI32705.1
show licorice, cons_CAI32705.1
color atomic, cons_CAI32705.1



load data/wzy/alphafold/CAI32772.1/ranked_0.pdb, 5_CAI32772.1
color orange, 5_CAI32772.1
cealign 5_CAI32705.1, 5_CAI32772.1

label n. CA and resi 242 and 5_CAI32772.1, "%s-%s" % (resn, resi)
label n. CA and resi 441 and 5_CAI32772.1, "%s-%s" % (resn, resi)
select cons_CAI32772.1, resi 242 and 5_CAI32772.1 or resi 441 and 5_CAI32772.1
show licorice, cons_CAI32772.1
color atomic, cons_CAI32772.1



load data/wzy/alphafold/AHB32490.1/ranked_0.pdb, 5_AHB32490.1
color green, 5_AHB32490.1
cealign 5_CAI32705.1, 5_AHB32490.1

label n. CA and resi 238 and 5_AHB32490.1, "%s-%s" % (resn, resi)
label n. CA and resi 429 and 5_AHB32490.1, "%s-%s" % (resn, resi)
select cons_AHB32490.1, resi 238 and 5_AHB32490.1 or resi 429 and 5_AHB32490.1
show licorice, cons_AHB32490.1
color atomic, cons_AHB32490.1



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
label n. CA and resi 304 and 24_CAI34124.1, "%s-%s" % (resn, resi)
label n. CA and resi 325 and 24_CAI34124.1, "%s-%s" % (resn, resi)
select cons_CAI34124.1, resi 267 and 24_CAI34124.1 or resi 304 and 24_CAI34124.1 or resi 325 and 24_CAI34124.1
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



load data/wzy/alphafold/BAQ01843.1/ranked_0.pdb, 7_BAQ01843.1
color orange, 7_BAQ01843.1
cealign 7_CAB63298.1, 7_BAQ01843.1

label n. CA and resi 227 and 7_BAQ01843.1, "%s-%s" % (resn, resi)
label n. CA and resi 246 and 7_BAQ01843.1, "%s-%s" % (resn, resi)
select cons_BAQ01843.1, resi 227 and 7_BAQ01843.1 or resi 246 and 7_BAQ01843.1
show licorice, cons_BAQ01843.1
color atomic, cons_BAQ01843.1



load data/wzy/alphafold/BAQ02224.1/ranked_0.pdb, 7_BAQ02224.1
color green, 7_BAQ02224.1
cealign 7_CAB63298.1, 7_BAQ02224.1

label n. CA and resi 221 and 7_BAQ02224.1, "%s-%s" % (resn, resi)
label n. CA and resi 255 and 7_BAQ02224.1, "%s-%s" % (resn, resi)
select cons_BAQ02224.1, resi 221 and 7_BAQ02224.1 or resi 255 and 7_BAQ02224.1
show licorice, cons_BAQ02224.1
color atomic, cons_BAQ02224.1



load data/wzy/alphafold/AFC91472.1/ranked_0.pdb, 7_AFC91472.1
color br6, 7_AFC91472.1
cealign 7_CAB63298.1, 7_AFC91472.1

label n. CA and resi 208 and 7_AFC91472.1, "%s-%s" % (resn, resi)
label n. CA and resi 239 and 7_AFC91472.1, "%s-%s" % (resn, resi)
select cons_AFC91472.1, resi 208 and 7_AFC91472.1 or resi 239 and 7_AFC91472.1
show licorice, cons_AFC91472.1
color atomic, cons_AFC91472.1



load data/wzy/alphafold/ABG81806.1/ranked_0.pdb, 7_ABG81806.1
color red, 7_ABG81806.1
cealign 7_CAB63298.1, 7_ABG81806.1

label n. CA and resi 221 and 7_ABG81806.1, "%s-%s" % (resn, resi)
label n. CA and resi 255 and 7_ABG81806.1, "%s-%s" % (resn, resi)
select cons_ABG81806.1, resi 221 and 7_ABG81806.1 or resi 255 and 7_ABG81806.1
show licorice, cons_ABG81806.1
color atomic, cons_ABG81806.1



load data/wzy/alphafold/CAI33491.1/ranked_0.pdb, 8_CAI33491.1
color teal, 8_CAI33491.1
cealign 7tpg, 8_CAI33491.1

label n. CA and resi 261 and 8_CAI33491.1, "%s-%s" % (resn, resi)
label n. CA and resi 306 and 8_CAI33491.1, "%s-%s" % (resn, resi)
select cons_CAI33491.1, resi 261 and 8_CAI33491.1 or resi 306 and 8_CAI33491.1
show licorice, cons_CAI33491.1
color atomic, cons_CAI33491.1



load data/wzy/alphafold/CAI33029.1/ranked_0.pdb, 8_CAI33029.1
color orange, 8_CAI33029.1
cealign 8_CAI33491.1, 8_CAI33029.1

label n. CA and resi 262 and 8_CAI33029.1, "%s-%s" % (resn, resi)
label n. CA and resi 300 and 8_CAI33029.1, "%s-%s" % (resn, resi)
select cons_CAI33029.1, resi 262 and 8_CAI33029.1 or resi 300 and 8_CAI33029.1
show licorice, cons_CAI33029.1
color atomic, cons_CAI33029.1



load data/wzy/alphafold/AAY28249.1/ranked_0.pdb, 8_AAY28249.1
color green, 8_AAY28249.1
cealign 8_CAI33491.1, 8_AAY28249.1

label n. CA and resi 259 and 8_AAY28249.1, "%s-%s" % (resn, resi)
label n. CA and resi 292 and 8_AAY28249.1, "%s-%s" % (resn, resi)
select cons_AAY28249.1, resi 259 and 8_AAY28249.1 or resi 292 and 8_AAY28249.1
show licorice, cons_AAY28249.1
color atomic, cons_AAY28249.1



load data/wzy/alphafold/CAI33149.1/ranked_0.pdb, 8_CAI33149.1
color br6, 8_CAI33149.1
cealign 8_CAI33491.1, 8_CAI33149.1

label n. CA and resi 265 and 8_CAI33149.1, "%s-%s" % (resn, resi)
label n. CA and resi 307 and 8_CAI33149.1, "%s-%s" % (resn, resi)
select cons_CAI33149.1, resi 265 and 8_CAI33149.1 or resi 307 and 8_CAI33149.1
show licorice, cons_CAI33149.1
color atomic, cons_CAI33149.1


set label_position,(1,1,1)
set label_color,black
center 
disable 
bg_color white 
