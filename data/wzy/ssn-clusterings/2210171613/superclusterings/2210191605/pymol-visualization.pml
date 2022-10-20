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


load data/wzy/alphafold/ADC54967.1/ranked_0.pdb, 1_ADC54967.1
color teal, 1_ADC54967.1
cealign 7tpg, 1_ADC54967.1

label n. CA and resi 50 and 1_ADC54967.1, "%s-%s" % (resn, resi)
label n. CA and resi 54 and 1_ADC54967.1, "%s-%s" % (resn, resi)
label n. CA and resi 142 and 1_ADC54967.1, "%s-%s" % (resn, resi)
label n. CA and resi 174 and 1_ADC54967.1, "%s-%s" % (resn, resi)
label n. CA and resi 300 and 1_ADC54967.1, "%s-%s" % (resn, resi)
select cons_ADC54967.1, resi 50 and 1_ADC54967.1 or resi 54 and 1_ADC54967.1 or resi 142 and 1_ADC54967.1 or resi 174 and 1_ADC54967.1 or resi 300 and 1_ADC54967.1
show licorice, cons_ADC54967.1
color atomic, cons_ADC54967.1



load data/wzy/alphafold/ACA24821.1/ranked_0.pdb, 1_ACA24821.1
color orange, 1_ACA24821.1
cealign 1_ADC54967.1, 1_ACA24821.1

label n. CA and resi 54 and 1_ACA24821.1, "%s-%s" % (resn, resi)
label n. CA and resi 58 and 1_ACA24821.1, "%s-%s" % (resn, resi)
label n. CA and resi 134 and 1_ACA24821.1, "%s-%s" % (resn, resi)
label n. CA and resi 168 and 1_ACA24821.1, "%s-%s" % (resn, resi)
label n. CA and resi 290 and 1_ACA24821.1, "%s-%s" % (resn, resi)
select cons_ACA24821.1, resi 54 and 1_ACA24821.1 or resi 58 and 1_ACA24821.1 or resi 134 and 1_ACA24821.1 or resi 168 and 1_ACA24821.1 or resi 290 and 1_ACA24821.1
show licorice, cons_ACA24821.1
color atomic, cons_ACA24821.1



load data/wzy/alphafold/AAK64372.1/ranked_0.pdb, 1_AAK64372.1
color green, 1_AAK64372.1
cealign 1_ADC54967.1, 1_AAK64372.1

label n. CA and resi 57 and 1_AAK64372.1, "%s-%s" % (resn, resi)
label n. CA and resi 61 and 1_AAK64372.1, "%s-%s" % (resn, resi)
label n. CA and resi 142 and 1_AAK64372.1, "%s-%s" % (resn, resi)
label n. CA and resi 176 and 1_AAK64372.1, "%s-%s" % (resn, resi)
label n. CA and resi 292 and 1_AAK64372.1, "%s-%s" % (resn, resi)
select cons_AAK64372.1, resi 57 and 1_AAK64372.1 or resi 61 and 1_AAK64372.1 or resi 142 and 1_AAK64372.1 or resi 176 and 1_AAK64372.1 or resi 292 and 1_AAK64372.1
show licorice, cons_AAK64372.1
color atomic, cons_AAK64372.1



load data/wzy/alphafold/CAI34008.1/ranked_0.pdb, 1_CAI34008.1
color br6, 1_CAI34008.1
cealign 1_ADC54967.1, 1_CAI34008.1

label n. CA and resi 51 and 1_CAI34008.1, "%s-%s" % (resn, resi)
label n. CA and resi 55 and 1_CAI34008.1, "%s-%s" % (resn, resi)
label n. CA and resi 153 and 1_CAI34008.1, "%s-%s" % (resn, resi)
label n. CA and resi 187 and 1_CAI34008.1, "%s-%s" % (resn, resi)
label n. CA and resi 315 and 1_CAI34008.1, "%s-%s" % (resn, resi)
select cons_CAI34008.1, resi 51 and 1_CAI34008.1 or resi 55 and 1_CAI34008.1 or resi 153 and 1_CAI34008.1 or resi 187 and 1_CAI34008.1 or resi 315 and 1_CAI34008.1
show licorice, cons_CAI34008.1
color atomic, cons_CAI34008.1



load data/wzy/alphafold/CAI34369.1/ranked_0.pdb, 5_CAI34369.1
color teal, 5_CAI34369.1
cealign 7tpg, 5_CAI34369.1

label n. CA and resi 151 and 5_CAI34369.1, "%s-%s" % (resn, resi)
label n. CA and resi 268 and 5_CAI34369.1, "%s-%s" % (resn, resi)
label n. CA and resi 308 and 5_CAI34369.1, "%s-%s" % (resn, resi)
select cons_CAI34369.1, resi 151 and 5_CAI34369.1 or resi 268 and 5_CAI34369.1 or resi 308 and 5_CAI34369.1
show licorice, cons_CAI34369.1
color atomic, cons_CAI34369.1



load data/wzy/alphafold/CAI33309.1/ranked_0.pdb, 5_CAI33309.1
color orange, 5_CAI33309.1
cealign 5_CAI34369.1, 5_CAI33309.1

label n. CA and resi 150 and 5_CAI33309.1, "%s-%s" % (resn, resi)
label n. CA and resi 266 and 5_CAI33309.1, "%s-%s" % (resn, resi)
label n. CA and resi 304 and 5_CAI33309.1, "%s-%s" % (resn, resi)
select cons_CAI33309.1, resi 150 and 5_CAI33309.1 or resi 266 and 5_CAI33309.1 or resi 304 and 5_CAI33309.1
show licorice, cons_CAI33309.1
color atomic, cons_CAI33309.1



load data/wzy/alphafold/CDF66396.1/ranked_0.pdb, 2_CDF66396.1
color teal, 2_CDF66396.1
cealign 7tpg, 2_CDF66396.1

label n. CA and resi 168 and 2_CDF66396.1, "%s-%s" % (resn, resi)
label n. CA and resi 171 and 2_CDF66396.1, "%s-%s" % (resn, resi)
label n. CA and resi 228 and 2_CDF66396.1, "%s-%s" % (resn, resi)
label n. CA and resi 284 and 2_CDF66396.1, "%s-%s" % (resn, resi)
label n. CA and resi 345 and 2_CDF66396.1, "%s-%s" % (resn, resi)
select cons_CDF66396.1, resi 168 and 2_CDF66396.1 or resi 171 and 2_CDF66396.1 or resi 228 and 2_CDF66396.1 or resi 284 and 2_CDF66396.1 or resi 345 and 2_CDF66396.1
show licorice, cons_CDF66396.1
color atomic, cons_CDF66396.1



load data/wzy/alphafold/AAC45857.1/ranked_0.pdb, 2_AAC45857.1
color orange, 2_AAC45857.1
cealign 2_CDF66396.1, 2_AAC45857.1

label n. CA and resi 173 and 2_AAC45857.1, "%s-%s" % (resn, resi)
label n. CA and resi 176 and 2_AAC45857.1, "%s-%s" % (resn, resi)
label n. CA and resi 234 and 2_AAC45857.1, "%s-%s" % (resn, resi)
label n. CA and resi 291 and 2_AAC45857.1, "%s-%s" % (resn, resi)
label n. CA and resi 349 and 2_AAC45857.1, "%s-%s" % (resn, resi)
select cons_AAC45857.1, resi 173 and 2_AAC45857.1 or resi 176 and 2_AAC45857.1 or resi 234 and 2_AAC45857.1 or resi 291 and 2_AAC45857.1 or resi 349 and 2_AAC45857.1
show licorice, cons_AAC45857.1
color atomic, cons_AAC45857.1



load data/wzy/alphafold/AAA97573.1/ranked_0.pdb, 2_AAA97573.1
color green, 2_AAA97573.1
cealign 2_CDF66396.1, 2_AAA97573.1

label n. CA and resi 173 and 2_AAA97573.1, "%s-%s" % (resn, resi)
label n. CA and resi 176 and 2_AAA97573.1, "%s-%s" % (resn, resi)
label n. CA and resi 234 and 2_AAA97573.1, "%s-%s" % (resn, resi)
label n. CA and resi 291 and 2_AAA97573.1, "%s-%s" % (resn, resi)
label n. CA and resi 349 and 2_AAA97573.1, "%s-%s" % (resn, resi)
select cons_AAA97573.1, resi 173 and 2_AAA97573.1 or resi 176 and 2_AAA97573.1 or resi 234 and 2_AAA97573.1 or resi 291 and 2_AAA97573.1 or resi 349 and 2_AAA97573.1
show licorice, cons_AAA97573.1
color atomic, cons_AAA97573.1



load data/wzy/alphafold/BAQ02088.1/ranked_0.pdb, 3_BAQ02088.1
color teal, 3_BAQ02088.1
cealign 7tpg, 3_BAQ02088.1

label n. CA and resi 228 and 3_BAQ02088.1, "%s-%s" % (resn, resi)
label n. CA and resi 307 and 3_BAQ02088.1, "%s-%s" % (resn, resi)
label n. CA and resi 343 and 3_BAQ02088.1, "%s-%s" % (resn, resi)
label n. CA and resi 348 and 3_BAQ02088.1, "%s-%s" % (resn, resi)
label n. CA and resi 395 and 3_BAQ02088.1, "%s-%s" % (resn, resi)
select cons_BAQ02088.1, resi 228 and 3_BAQ02088.1 or resi 307 and 3_BAQ02088.1 or resi 343 and 3_BAQ02088.1 or resi 348 and 3_BAQ02088.1 or resi 395 and 3_BAQ02088.1
show licorice, cons_BAQ02088.1
color atomic, cons_BAQ02088.1



load data/wzy/alphafold/BAQ00795.1/ranked_0.pdb, 3_BAQ00795.1
color orange, 3_BAQ00795.1
cealign 3_BAQ02088.1, 3_BAQ00795.1

label n. CA and resi 213 and 3_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 276 and 3_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 312 and 3_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 317 and 3_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 366 and 3_BAQ00795.1, "%s-%s" % (resn, resi)
select cons_BAQ00795.1, resi 213 and 3_BAQ00795.1 or resi 276 and 3_BAQ00795.1 or resi 312 and 3_BAQ00795.1 or resi 317 and 3_BAQ00795.1 or resi 366 and 3_BAQ00795.1
show licorice, cons_BAQ00795.1
color atomic, cons_BAQ00795.1



load data/wzy/alphafold/ACA24754.1/ranked_0.pdb, 3_ACA24754.1
color green, 3_ACA24754.1
cealign 3_BAQ02088.1, 3_ACA24754.1

label n. CA and resi 217 and 3_ACA24754.1, "%s-%s" % (resn, resi)
label n. CA and resi 294 and 3_ACA24754.1, "%s-%s" % (resn, resi)
select cons_ACA24754.1, resi 217 and 3_ACA24754.1 or resi 294 and 3_ACA24754.1
show licorice, cons_ACA24754.1
color atomic, cons_ACA24754.1



load data/wzy/alphafold/AHB32215.1/ranked_0.pdb, 17_AHB32215.1
color teal, 17_AHB32215.1
cealign 7tpg, 17_AHB32215.1

label n. CA and resi 43 and 17_AHB32215.1, "%s-%s" % (resn, resi)
label n. CA and resi 49 and 17_AHB32215.1, "%s-%s" % (resn, resi)
label n. CA and resi 53 and 17_AHB32215.1, "%s-%s" % (resn, resi)
label n. CA and resi 137 and 17_AHB32215.1, "%s-%s" % (resn, resi)
label n. CA and resi 138 and 17_AHB32215.1, "%s-%s" % (resn, resi)
label n. CA and resi 171 and 17_AHB32215.1, "%s-%s" % (resn, resi)
label n. CA and resi 219 and 17_AHB32215.1, "%s-%s" % (resn, resi)
label n. CA and resi 232 and 17_AHB32215.1, "%s-%s" % (resn, resi)
label n. CA and resi 282 and 17_AHB32215.1, "%s-%s" % (resn, resi)
label n. CA and resi 283 and 17_AHB32215.1, "%s-%s" % (resn, resi)
select cons_AHB32215.1, resi 43 and 17_AHB32215.1 or resi 49 and 17_AHB32215.1 or resi 53 and 17_AHB32215.1 or resi 137 and 17_AHB32215.1 or resi 138 and 17_AHB32215.1 or resi 171 and 17_AHB32215.1 or resi 219 and 17_AHB32215.1 or resi 232 and 17_AHB32215.1 or resi 282 and 17_AHB32215.1 or resi 283 and 17_AHB32215.1
show licorice, cons_AHB32215.1
color atomic, cons_AHB32215.1



load data/wzy/alphafold/AHB32861.1/ranked_0.pdb, 17_AHB32861.1
color orange, 17_AHB32861.1
cealign 17_AHB32215.1, 17_AHB32861.1

label n. CA and resi 42 and 17_AHB32861.1, "%s-%s" % (resn, resi)
label n. CA and resi 48 and 17_AHB32861.1, "%s-%s" % (resn, resi)
label n. CA and resi 52 and 17_AHB32861.1, "%s-%s" % (resn, resi)
label n. CA and resi 136 and 17_AHB32861.1, "%s-%s" % (resn, resi)
label n. CA and resi 137 and 17_AHB32861.1, "%s-%s" % (resn, resi)
label n. CA and resi 170 and 17_AHB32861.1, "%s-%s" % (resn, resi)
label n. CA and resi 221 and 17_AHB32861.1, "%s-%s" % (resn, resi)
label n. CA and resi 236 and 17_AHB32861.1, "%s-%s" % (resn, resi)
label n. CA and resi 286 and 17_AHB32861.1, "%s-%s" % (resn, resi)
label n. CA and resi 287 and 17_AHB32861.1, "%s-%s" % (resn, resi)
select cons_AHB32861.1, resi 42 and 17_AHB32861.1 or resi 48 and 17_AHB32861.1 or resi 52 and 17_AHB32861.1 or resi 136 and 17_AHB32861.1 or resi 137 and 17_AHB32861.1 or resi 170 and 17_AHB32861.1 or resi 221 and 17_AHB32861.1 or resi 236 and 17_AHB32861.1 or resi 286 and 17_AHB32861.1 or resi 287 and 17_AHB32861.1
show licorice, cons_AHB32861.1
color atomic, cons_AHB32861.1



load data/wzy/alphafold/CAI34124.1/ranked_0.pdb, 18_CAI34124.1
color teal, 18_CAI34124.1
cealign 7tpg, 18_CAI34124.1

label n. CA and resi 267 and 18_CAI34124.1, "%s-%s" % (resn, resi)
label n. CA and resi 304 and 18_CAI34124.1, "%s-%s" % (resn, resi)
label n. CA and resi 325 and 18_CAI34124.1, "%s-%s" % (resn, resi)
select cons_CAI34124.1, resi 267 and 18_CAI34124.1 or resi 304 and 18_CAI34124.1 or resi 325 and 18_CAI34124.1
show licorice, cons_CAI34124.1
color atomic, cons_CAI34124.1



load data/wzy/alphafold/AHB32411.1/ranked_0.pdb, 19_AHB32411.1
color teal, 19_AHB32411.1
cealign 7tpg, 19_AHB32411.1

label n. CA and resi 162 and 19_AHB32411.1, "%s-%s" % (resn, resi)
label n. CA and resi 207 and 19_AHB32411.1, "%s-%s" % (resn, resi)
label n. CA and resi 242 and 19_AHB32411.1, "%s-%s" % (resn, resi)
label n. CA and resi 244 and 19_AHB32411.1, "%s-%s" % (resn, resi)
label n. CA and resi 251 and 19_AHB32411.1, "%s-%s" % (resn, resi)
select cons_AHB32411.1, resi 162 and 19_AHB32411.1 or resi 207 and 19_AHB32411.1 or resi 242 and 19_AHB32411.1 or resi 244 and 19_AHB32411.1 or resi 251 and 19_AHB32411.1
show licorice, cons_AHB32411.1
color atomic, cons_AHB32411.1



load data/wzy/alphafold/AAT77177.1/ranked_0.pdb, 20_AAT77177.1
color teal, 20_AAT77177.1
cealign 7tpg, 20_AAT77177.1

label n. CA and resi 165 and 20_AAT77177.1, "%s-%s" % (resn, resi)
label n. CA and resi 226 and 20_AAT77177.1, "%s-%s" % (resn, resi)
label n. CA and resi 284 and 20_AAT77177.1, "%s-%s" % (resn, resi)
label n. CA and resi 387 and 20_AAT77177.1, "%s-%s" % (resn, resi)
select cons_AAT77177.1, resi 165 and 20_AAT77177.1 or resi 226 and 20_AAT77177.1 or resi 284 and 20_AAT77177.1 or resi 387 and 20_AAT77177.1
show licorice, cons_AAT77177.1
color atomic, cons_AAT77177.1



load data/wzy/alphafold/CAI34198.1/ranked_0.pdb, 21_CAI34198.1
color teal, 21_CAI34198.1
cealign 7tpg, 21_CAI34198.1

label n. CA and resi 182 and 21_CAI34198.1, "%s-%s" % (resn, resi)
label n. CA and resi 183 and 21_CAI34198.1, "%s-%s" % (resn, resi)
label n. CA and resi 189 and 21_CAI34198.1, "%s-%s" % (resn, resi)
label n. CA and resi 278 and 21_CAI34198.1, "%s-%s" % (resn, resi)
select cons_CAI34198.1, resi 182 and 21_CAI34198.1 or resi 183 and 21_CAI34198.1 or resi 189 and 21_CAI34198.1 or resi 278 and 21_CAI34198.1
show licorice, cons_CAI34198.1
color atomic, cons_CAI34198.1



load data/wzy/alphafold/CAI34217.1/ranked_0.pdb, 21_CAI34217.1
color orange, 21_CAI34217.1
cealign 21_CAI34198.1, 21_CAI34217.1

label n. CA and resi 186 and 21_CAI34217.1, "%s-%s" % (resn, resi)
label n. CA and resi 187 and 21_CAI34217.1, "%s-%s" % (resn, resi)
label n. CA and resi 193 and 21_CAI34217.1, "%s-%s" % (resn, resi)
label n. CA and resi 281 and 21_CAI34217.1, "%s-%s" % (resn, resi)
select cons_CAI34217.1, resi 186 and 21_CAI34217.1 or resi 187 and 21_CAI34217.1 or resi 193 and 21_CAI34217.1 or resi 281 and 21_CAI34217.1
show licorice, cons_CAI34217.1
color atomic, cons_CAI34217.1



load data/wzy/alphafold/CAI34254.1/ranked_0.pdb, 21_CAI34254.1
color green, 21_CAI34254.1
cealign 21_CAI34198.1, 21_CAI34254.1

label n. CA and resi 182 and 21_CAI34254.1, "%s-%s" % (resn, resi)
label n. CA and resi 183 and 21_CAI34254.1, "%s-%s" % (resn, resi)
label n. CA and resi 189 and 21_CAI34254.1, "%s-%s" % (resn, resi)
label n. CA and resi 277 and 21_CAI34254.1, "%s-%s" % (resn, resi)
select cons_CAI34254.1, resi 182 and 21_CAI34254.1 or resi 183 and 21_CAI34254.1 or resi 189 and 21_CAI34254.1 or resi 277 and 21_CAI34254.1
show licorice, cons_CAI34254.1
color atomic, cons_CAI34254.1



load data/wzy/alphafold/CAI33412.1/ranked_0.pdb, 7_CAI33412.1
color teal, 7_CAI33412.1
cealign 7tpg, 7_CAI33412.1

label n. CA and resi 149 and 7_CAI33412.1, "%s-%s" % (resn, resi)
label n. CA and resi 205 and 7_CAI33412.1, "%s-%s" % (resn, resi)
label n. CA and resi 281 and 7_CAI33412.1, "%s-%s" % (resn, resi)
select cons_CAI33412.1, resi 149 and 7_CAI33412.1 or resi 205 and 7_CAI33412.1 or resi 281 and 7_CAI33412.1
show licorice, cons_CAI33412.1
color atomic, cons_CAI33412.1



load data/wzy/alphafold/AHB32490.1/ranked_0.pdb, 22_AHB32490.1
color teal, 22_AHB32490.1
cealign 7tpg, 22_AHB32490.1

label n. CA and resi 175 and 22_AHB32490.1, "%s-%s" % (resn, resi)
label n. CA and resi 238 and 22_AHB32490.1, "%s-%s" % (resn, resi)
label n. CA and resi 287 and 22_AHB32490.1, "%s-%s" % (resn, resi)
select cons_AHB32490.1, resi 175 and 22_AHB32490.1 or resi 238 and 22_AHB32490.1 or resi 287 and 22_AHB32490.1
show licorice, cons_AHB32490.1
color atomic, cons_AHB32490.1


set label_position,(1,1,1)
set label_color,black
center 
disable 
bg_color white 
