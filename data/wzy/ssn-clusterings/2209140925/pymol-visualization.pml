set cartoon_side_chain_helper, on
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


load data/wzy/alphafold/CAI33309.1/ranked_0.pdb, 1_CAI33309.1
color teal, 1_CAI33309.1
cealign 7tpg, 1_CAI33309.1

label n. CA and resi 150 and 1_CAI33309.1, "%s-%s" % (resn, resi)
label n. CA and resi 266 and 1_CAI33309.1, "%s-%s" % (resn, resi)
label n. CA and resi 304 and 1_CAI33309.1, "%s-%s" % (resn, resi)
select cons_CAI33309.1, resi 150 and 1_CAI33309.1 or resi 266 and 1_CAI33309.1 or resi 304 and 1_CAI33309.1
show licorice, cons_CAI33309.1
color atomic, cons_CAI33309.1



load data/wzy/alphafold/CAI34369.1/ranked_0.pdb, 1_CAI34369.1
color orange, 1_CAI34369.1
cealign 1_CAI33309.1, 1_CAI34369.1

label n. CA and resi 151 and 1_CAI34369.1, "%s-%s" % (resn, resi)
label n. CA and resi 268 and 1_CAI34369.1, "%s-%s" % (resn, resi)
label n. CA and resi 308 and 1_CAI34369.1, "%s-%s" % (resn, resi)
select cons_CAI34369.1, resi 151 and 1_CAI34369.1 or resi 268 and 1_CAI34369.1 or resi 308 and 1_CAI34369.1
show licorice, cons_CAI34369.1
color atomic, cons_CAI34369.1



load data/wzy/alphafold/CDF66396.1/ranked_0.pdb, 2_CDF66396.1
color teal, 2_CDF66396.1
cealign 7tpg, 2_CDF66396.1

label n. CA and resi 168 and 2_CDF66396.1, "%s-%s" % (resn, resi)
label n. CA and resi 171 and 2_CDF66396.1, "%s-%s" % (resn, resi)
label n. CA and resi 185 and 2_CDF66396.1, "%s-%s" % (resn, resi)
label n. CA and resi 228 and 2_CDF66396.1, "%s-%s" % (resn, resi)
label n. CA and resi 284 and 2_CDF66396.1, "%s-%s" % (resn, resi)
label n. CA and resi 345 and 2_CDF66396.1, "%s-%s" % (resn, resi)
select cons_CDF66396.1, resi 168 and 2_CDF66396.1 or resi 171 and 2_CDF66396.1 or resi 185 and 2_CDF66396.1 or resi 228 and 2_CDF66396.1 or resi 284 and 2_CDF66396.1 or resi 345 and 2_CDF66396.1
show licorice, cons_CDF66396.1
color atomic, cons_CDF66396.1



load data/wzy/alphafold/ADC54967.1/ranked_0.pdb, 3_ADC54967.1
color teal, 3_ADC54967.1
cealign 7tpg, 3_ADC54967.1

label n. CA and resi 50 and 3_ADC54967.1, "%s-%s" % (resn, resi)
label n. CA and resi 54 and 3_ADC54967.1, "%s-%s" % (resn, resi)
label n. CA and resi 142 and 3_ADC54967.1, "%s-%s" % (resn, resi)
label n. CA and resi 174 and 3_ADC54967.1, "%s-%s" % (resn, resi)
label n. CA and resi 233 and 3_ADC54967.1, "%s-%s" % (resn, resi)
label n. CA and resi 300 and 3_ADC54967.1, "%s-%s" % (resn, resi)
select cons_ADC54967.1, resi 50 and 3_ADC54967.1 or resi 54 and 3_ADC54967.1 or resi 142 and 3_ADC54967.1 or resi 174 and 3_ADC54967.1 or resi 233 and 3_ADC54967.1 or resi 300 and 3_ADC54967.1
show licorice, cons_ADC54967.1
color atomic, cons_ADC54967.1



load data/wzy/alphafold/AHB32215.1/ranked_0.pdb, 4_AHB32215.1
color teal, 4_AHB32215.1
cealign 7tpg, 4_AHB32215.1

label n. CA and resi 43 and 4_AHB32215.1, "%s-%s" % (resn, resi)
label n. CA and resi 49 and 4_AHB32215.1, "%s-%s" % (resn, resi)
label n. CA and resi 53 and 4_AHB32215.1, "%s-%s" % (resn, resi)
label n. CA and resi 137 and 4_AHB32215.1, "%s-%s" % (resn, resi)
label n. CA and resi 138 and 4_AHB32215.1, "%s-%s" % (resn, resi)
label n. CA and resi 171 and 4_AHB32215.1, "%s-%s" % (resn, resi)
label n. CA and resi 219 and 4_AHB32215.1, "%s-%s" % (resn, resi)
label n. CA and resi 232 and 4_AHB32215.1, "%s-%s" % (resn, resi)
label n. CA and resi 282 and 4_AHB32215.1, "%s-%s" % (resn, resi)
label n. CA and resi 283 and 4_AHB32215.1, "%s-%s" % (resn, resi)
select cons_AHB32215.1, resi 43 and 4_AHB32215.1 or resi 49 and 4_AHB32215.1 or resi 53 and 4_AHB32215.1 or resi 137 and 4_AHB32215.1 or resi 138 and 4_AHB32215.1 or resi 171 and 4_AHB32215.1 or resi 219 and 4_AHB32215.1 or resi 232 and 4_AHB32215.1 or resi 282 and 4_AHB32215.1 or resi 283 and 4_AHB32215.1
show licorice, cons_AHB32215.1
color atomic, cons_AHB32215.1



load data/wzy/alphafold/AHB32861.1/ranked_0.pdb, 4_AHB32861.1
color orange, 4_AHB32861.1
cealign 4_AHB32215.1, 4_AHB32861.1

label n. CA and resi 42 and 4_AHB32861.1, "%s-%s" % (resn, resi)
label n. CA and resi 48 and 4_AHB32861.1, "%s-%s" % (resn, resi)
label n. CA and resi 52 and 4_AHB32861.1, "%s-%s" % (resn, resi)
label n. CA and resi 136 and 4_AHB32861.1, "%s-%s" % (resn, resi)
label n. CA and resi 137 and 4_AHB32861.1, "%s-%s" % (resn, resi)
label n. CA and resi 170 and 4_AHB32861.1, "%s-%s" % (resn, resi)
label n. CA and resi 221 and 4_AHB32861.1, "%s-%s" % (resn, resi)
label n. CA and resi 236 and 4_AHB32861.1, "%s-%s" % (resn, resi)
label n. CA and resi 286 and 4_AHB32861.1, "%s-%s" % (resn, resi)
label n. CA and resi 287 and 4_AHB32861.1, "%s-%s" % (resn, resi)
select cons_AHB32861.1, resi 42 and 4_AHB32861.1 or resi 48 and 4_AHB32861.1 or resi 52 and 4_AHB32861.1 or resi 136 and 4_AHB32861.1 or resi 137 and 4_AHB32861.1 or resi 170 and 4_AHB32861.1 or resi 221 and 4_AHB32861.1 or resi 236 and 4_AHB32861.1 or resi 286 and 4_AHB32861.1 or resi 287 and 4_AHB32861.1
show licorice, cons_AHB32861.1
color atomic, cons_AHB32861.1



load data/wzy/alphafold/CAI34124.1/ranked_0.pdb, 5_CAI34124.1
color teal, 5_CAI34124.1
cealign 7tpg, 5_CAI34124.1

label n. CA and resi 267 and 5_CAI34124.1, "%s-%s" % (resn, resi)
label n. CA and resi 304 and 5_CAI34124.1, "%s-%s" % (resn, resi)
label n. CA and resi 325 and 5_CAI34124.1, "%s-%s" % (resn, resi)
select cons_CAI34124.1, resi 267 and 5_CAI34124.1 or resi 304 and 5_CAI34124.1 or resi 325 and 5_CAI34124.1
show licorice, cons_CAI34124.1
color atomic, cons_CAI34124.1



load data/wzy/alphafold/AHB32411.1/ranked_0.pdb, 8_AHB32411.1
color teal, 8_AHB32411.1
cealign 7tpg, 8_AHB32411.1

label n. CA and resi 162 and 8_AHB32411.1, "%s-%s" % (resn, resi)
label n. CA and resi 207 and 8_AHB32411.1, "%s-%s" % (resn, resi)
label n. CA and resi 242 and 8_AHB32411.1, "%s-%s" % (resn, resi)
label n. CA and resi 244 and 8_AHB32411.1, "%s-%s" % (resn, resi)
label n. CA and resi 251 and 8_AHB32411.1, "%s-%s" % (resn, resi)
select cons_AHB32411.1, resi 162 and 8_AHB32411.1 or resi 207 and 8_AHB32411.1 or resi 242 and 8_AHB32411.1 or resi 244 and 8_AHB32411.1 or resi 251 and 8_AHB32411.1
show licorice, cons_AHB32411.1
color atomic, cons_AHB32411.1



load data/wzy/alphafold/BAQ00795.1/ranked_0.pdb, 9_BAQ00795.1
color teal, 9_BAQ00795.1
cealign 7tpg, 9_BAQ00795.1

label n. CA and resi 30 and 9_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 38 and 9_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 95 and 9_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 97 and 9_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 129 and 9_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 159 and 9_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 160 and 9_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 161 and 9_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 163 and 9_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 164 and 9_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 177 and 9_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 213 and 9_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 222 and 9_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 226 and 9_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 232 and 9_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 258 and 9_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 261 and 9_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 265 and 9_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 276 and 9_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 297 and 9_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 300 and 9_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 307 and 9_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 308 and 9_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 312 and 9_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 313 and 9_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 317 and 9_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 318 and 9_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 321 and 9_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 326 and 9_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 355 and 9_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 366 and 9_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 368 and 9_BAQ00795.1, "%s-%s" % (resn, resi)
select cons_BAQ00795.1, resi 30 and 9_BAQ00795.1 or resi 38 and 9_BAQ00795.1 or resi 95 and 9_BAQ00795.1 or resi 97 and 9_BAQ00795.1 or resi 129 and 9_BAQ00795.1 or resi 159 and 9_BAQ00795.1 or resi 160 and 9_BAQ00795.1 or resi 161 and 9_BAQ00795.1 or resi 163 and 9_BAQ00795.1 or resi 164 and 9_BAQ00795.1 or resi 177 and 9_BAQ00795.1 or resi 213 and 9_BAQ00795.1 or resi 222 and 9_BAQ00795.1 or resi 226 and 9_BAQ00795.1 or resi 232 and 9_BAQ00795.1 or resi 258 and 9_BAQ00795.1 or resi 261 and 9_BAQ00795.1 or resi 265 and 9_BAQ00795.1 or resi 276 and 9_BAQ00795.1 or resi 297 and 9_BAQ00795.1 or resi 300 and 9_BAQ00795.1 or resi 307 and 9_BAQ00795.1 or resi 308 and 9_BAQ00795.1 or resi 312 and 9_BAQ00795.1 or resi 313 and 9_BAQ00795.1 or resi 317 and 9_BAQ00795.1 or resi 318 and 9_BAQ00795.1 or resi 321 and 9_BAQ00795.1 or resi 326 and 9_BAQ00795.1 or resi 355 and 9_BAQ00795.1 or resi 366 and 9_BAQ00795.1 or resi 368 and 9_BAQ00795.1
show licorice, cons_BAQ00795.1
color atomic, cons_BAQ00795.1



load data/wzy/alphafold/AAT77177.1/ranked_0.pdb, 10_AAT77177.1
color teal, 10_AAT77177.1
cealign 7tpg, 10_AAT77177.1

label n. CA and resi 165 and 10_AAT77177.1, "%s-%s" % (resn, resi)
label n. CA and resi 226 and 10_AAT77177.1, "%s-%s" % (resn, resi)
label n. CA and resi 284 and 10_AAT77177.1, "%s-%s" % (resn, resi)
label n. CA and resi 387 and 10_AAT77177.1, "%s-%s" % (resn, resi)
select cons_AAT77177.1, resi 165 and 10_AAT77177.1 or resi 226 and 10_AAT77177.1 or resi 284 and 10_AAT77177.1 or resi 387 and 10_AAT77177.1
show licorice, cons_AAT77177.1
color atomic, cons_AAT77177.1



load data/wzy/alphafold/CAI34254.1/ranked_0.pdb, 11_CAI34254.1
color teal, 11_CAI34254.1
cealign 7tpg, 11_CAI34254.1

label n. CA and resi 182 and 11_CAI34254.1, "%s-%s" % (resn, resi)
label n. CA and resi 183 and 11_CAI34254.1, "%s-%s" % (resn, resi)
label n. CA and resi 189 and 11_CAI34254.1, "%s-%s" % (resn, resi)
label n. CA and resi 277 and 11_CAI34254.1, "%s-%s" % (resn, resi)
select cons_CAI34254.1, resi 182 and 11_CAI34254.1 or resi 183 and 11_CAI34254.1 or resi 189 and 11_CAI34254.1 or resi 277 and 11_CAI34254.1
show licorice, cons_CAI34254.1
color atomic, cons_CAI34254.1



load data/wzy/alphafold/CAI34198.1/ranked_0.pdb, 11_CAI34198.1
color orange, 11_CAI34198.1
cealign 11_CAI34254.1, 11_CAI34198.1

label n. CA and resi 182 and 11_CAI34198.1, "%s-%s" % (resn, resi)
label n. CA and resi 183 and 11_CAI34198.1, "%s-%s" % (resn, resi)
label n. CA and resi 189 and 11_CAI34198.1, "%s-%s" % (resn, resi)
label n. CA and resi 278 and 11_CAI34198.1, "%s-%s" % (resn, resi)
select cons_CAI34198.1, resi 182 and 11_CAI34198.1 or resi 183 and 11_CAI34198.1 or resi 189 and 11_CAI34198.1 or resi 278 and 11_CAI34198.1
show licorice, cons_CAI34198.1
color atomic, cons_CAI34198.1



load data/wzy/alphafold/CAI34217.1/ranked_0.pdb, 11_CAI34217.1
color green, 11_CAI34217.1
cealign 11_CAI34254.1, 11_CAI34217.1

label n. CA and resi 186 and 11_CAI34217.1, "%s-%s" % (resn, resi)
label n. CA and resi 187 and 11_CAI34217.1, "%s-%s" % (resn, resi)
label n. CA and resi 193 and 11_CAI34217.1, "%s-%s" % (resn, resi)
label n. CA and resi 281 and 11_CAI34217.1, "%s-%s" % (resn, resi)
select cons_CAI34217.1, resi 186 and 11_CAI34217.1 or resi 187 and 11_CAI34217.1 or resi 193 and 11_CAI34217.1 or resi 281 and 11_CAI34217.1
show licorice, cons_CAI34217.1
color atomic, cons_CAI34217.1



load data/wzy/alphafold/BAQ02088.1/ranked_0.pdb, 12_BAQ02088.1
color teal, 12_BAQ02088.1
cealign 7tpg, 12_BAQ02088.1

label n. CA and resi 139 and 12_BAQ02088.1, "%s-%s" % (resn, resi)
label n. CA and resi 175 and 12_BAQ02088.1, "%s-%s" % (resn, resi)
label n. CA and resi 228 and 12_BAQ02088.1, "%s-%s" % (resn, resi)
label n. CA and resi 307 and 12_BAQ02088.1, "%s-%s" % (resn, resi)
label n. CA and resi 343 and 12_BAQ02088.1, "%s-%s" % (resn, resi)
label n. CA and resi 348 and 12_BAQ02088.1, "%s-%s" % (resn, resi)
select cons_BAQ02088.1, resi 139 and 12_BAQ02088.1 or resi 175 and 12_BAQ02088.1 or resi 228 and 12_BAQ02088.1 or resi 307 and 12_BAQ02088.1 or resi 343 and 12_BAQ02088.1 or resi 348 and 12_BAQ02088.1
show licorice, cons_BAQ02088.1
color atomic, cons_BAQ02088.1



load data/wzy/alphafold/ACA24754.1/ranked_0.pdb, 12_ACA24754.1
color orange, 12_ACA24754.1
cealign 12_BAQ02088.1, 12_ACA24754.1

label n. CA and resi 124 and 12_ACA24754.1, "%s-%s" % (resn, resi)
label n. CA and resi 162 and 12_ACA24754.1, "%s-%s" % (resn, resi)
label n. CA and resi 217 and 12_ACA24754.1, "%s-%s" % (resn, resi)
label n. CA and resi 294 and 12_ACA24754.1, "%s-%s" % (resn, resi)
label n. CA and resi 328 and 12_ACA24754.1, "%s-%s" % (resn, resi)
select cons_ACA24754.1, resi 124 and 12_ACA24754.1 or resi 162 and 12_ACA24754.1 or resi 217 and 12_ACA24754.1 or resi 294 and 12_ACA24754.1 or resi 328 and 12_ACA24754.1
show licorice, cons_ACA24754.1
color atomic, cons_ACA24754.1



load data/wzy/alphafold/AHB32490.1/ranked_0.pdb, 14_AHB32490.1
color teal, 14_AHB32490.1
cealign 7tpg, 14_AHB32490.1

label n. CA and resi 175 and 14_AHB32490.1, "%s-%s" % (resn, resi)
label n. CA and resi 238 and 14_AHB32490.1, "%s-%s" % (resn, resi)
label n. CA and resi 287 and 14_AHB32490.1, "%s-%s" % (resn, resi)
select cons_AHB32490.1, resi 175 and 14_AHB32490.1 or resi 238 and 14_AHB32490.1 or resi 287 and 14_AHB32490.1
show licorice, cons_AHB32490.1
color atomic, cons_AHB32490.1



load data/wzy/alphafold/WP_097449287.1/ranked_0.pdb, 15_WP_097449287.1
color teal, 15_WP_097449287.1
cealign 7tpg, 15_WP_097449287.1

label n. CA and resi 44 and 15_WP_097449287.1, "%s-%s" % (resn, resi)
label n. CA and resi 183 and 15_WP_097449287.1, "%s-%s" % (resn, resi)
label n. CA and resi 228 and 15_WP_097449287.1, "%s-%s" % (resn, resi)
label n. CA and resi 258 and 15_WP_097449287.1, "%s-%s" % (resn, resi)
label n. CA and resi 293 and 15_WP_097449287.1, "%s-%s" % (resn, resi)
label n. CA and resi 300 and 15_WP_097449287.1, "%s-%s" % (resn, resi)
label n. CA and resi 326 and 15_WP_097449287.1, "%s-%s" % (resn, resi)
label n. CA and resi 381 and 15_WP_097449287.1, "%s-%s" % (resn, resi)
select cons_WP_097449287.1, resi 44 and 15_WP_097449287.1 or resi 183 and 15_WP_097449287.1 or resi 228 and 15_WP_097449287.1 or resi 258 and 15_WP_097449287.1 or resi 293 and 15_WP_097449287.1 or resi 300 and 15_WP_097449287.1 or resi 326 and 15_WP_097449287.1 or resi 381 and 15_WP_097449287.1
show licorice, cons_WP_097449287.1
color atomic, cons_WP_097449287.1



load data/wzy/alphafold/ADI43263.1/ranked_0.pdb, 16_ADI43263.1
color teal, 16_ADI43263.1
cealign 7tpg, 16_ADI43263.1

label n. CA and resi 158 and 16_ADI43263.1, "%s-%s" % (resn, resi)
label n. CA and resi 160 and 16_ADI43263.1, "%s-%s" % (resn, resi)
label n. CA and resi 241 and 16_ADI43263.1, "%s-%s" % (resn, resi)
label n. CA and resi 245 and 16_ADI43263.1, "%s-%s" % (resn, resi)
label n. CA and resi 253 and 16_ADI43263.1, "%s-%s" % (resn, resi)
label n. CA and resi 305 and 16_ADI43263.1, "%s-%s" % (resn, resi)
label n. CA and resi 308 and 16_ADI43263.1, "%s-%s" % (resn, resi)
label n. CA and resi 315 and 16_ADI43263.1, "%s-%s" % (resn, resi)
label n. CA and resi 319 and 16_ADI43263.1, "%s-%s" % (resn, resi)
select cons_ADI43263.1, resi 158 and 16_ADI43263.1 or resi 160 and 16_ADI43263.1 or resi 241 and 16_ADI43263.1 or resi 245 and 16_ADI43263.1 or resi 253 and 16_ADI43263.1 or resi 305 and 16_ADI43263.1 or resi 308 and 16_ADI43263.1 or resi 315 and 16_ADI43263.1 or resi 319 and 16_ADI43263.1
show licorice, cons_ADI43263.1
color atomic, cons_ADI43263.1



load data/wzy/alphafold/ADR74237.1/ranked_0.pdb, 16_ADR74237.1
color orange, 16_ADR74237.1
cealign 16_ADI43263.1, 16_ADR74237.1

label n. CA and resi 162 and 16_ADR74237.1, "%s-%s" % (resn, resi)
label n. CA and resi 164 and 16_ADR74237.1, "%s-%s" % (resn, resi)
label n. CA and resi 248 and 16_ADR74237.1, "%s-%s" % (resn, resi)
label n. CA and resi 252 and 16_ADR74237.1, "%s-%s" % (resn, resi)
label n. CA and resi 261 and 16_ADR74237.1, "%s-%s" % (resn, resi)
label n. CA and resi 312 and 16_ADR74237.1, "%s-%s" % (resn, resi)
label n. CA and resi 315 and 16_ADR74237.1, "%s-%s" % (resn, resi)
label n. CA and resi 322 and 16_ADR74237.1, "%s-%s" % (resn, resi)
label n. CA and resi 326 and 16_ADR74237.1, "%s-%s" % (resn, resi)
select cons_ADR74237.1, resi 162 and 16_ADR74237.1 or resi 164 and 16_ADR74237.1 or resi 248 and 16_ADR74237.1 or resi 252 and 16_ADR74237.1 or resi 261 and 16_ADR74237.1 or resi 312 and 16_ADR74237.1 or resi 315 and 16_ADR74237.1 or resi 322 and 16_ADR74237.1 or resi 326 and 16_ADR74237.1
show licorice, cons_ADR74237.1
color atomic, cons_ADR74237.1



load data/wzy/alphafold/AAM27615.1/ranked_0.pdb, 17_AAM27615.1
color teal, 17_AAM27615.1
cealign 7tpg, 17_AAM27615.1

label n. CA and resi 187 and 17_AAM27615.1, "%s-%s" % (resn, resi)
label n. CA and resi 188 and 17_AAM27615.1, "%s-%s" % (resn, resi)
label n. CA and resi 260 and 17_AAM27615.1, "%s-%s" % (resn, resi)
label n. CA and resi 263 and 17_AAM27615.1, "%s-%s" % (resn, resi)
label n. CA and resi 289 and 17_AAM27615.1, "%s-%s" % (resn, resi)
label n. CA and resi 298 and 17_AAM27615.1, "%s-%s" % (resn, resi)
label n. CA and resi 301 and 17_AAM27615.1, "%s-%s" % (resn, resi)
select cons_AAM27615.1, resi 187 and 17_AAM27615.1 or resi 188 and 17_AAM27615.1 or resi 260 and 17_AAM27615.1 or resi 263 and 17_AAM27615.1 or resi 289 and 17_AAM27615.1 or resi 298 and 17_AAM27615.1 or resi 301 and 17_AAM27615.1
show licorice, cons_AAM27615.1
color atomic, cons_AAM27615.1



load data/wzy/alphafold/ADC54950.1/ranked_0.pdb, 18_ADC54950.1
color teal, 18_ADC54950.1
cealign 7tpg, 18_ADC54950.1

label n. CA and resi 133 and 18_ADC54950.1, "%s-%s" % (resn, resi)
label n. CA and resi 190 and 18_ADC54950.1, "%s-%s" % (resn, resi)
label n. CA and resi 233 and 18_ADC54950.1, "%s-%s" % (resn, resi)
label n. CA and resi 249 and 18_ADC54950.1, "%s-%s" % (resn, resi)
label n. CA and resi 305 and 18_ADC54950.1, "%s-%s" % (resn, resi)
label n. CA and resi 316 and 18_ADC54950.1, "%s-%s" % (resn, resi)
label n. CA and resi 352 and 18_ADC54950.1, "%s-%s" % (resn, resi)
select cons_ADC54950.1, resi 133 and 18_ADC54950.1 or resi 190 and 18_ADC54950.1 or resi 233 and 18_ADC54950.1 or resi 249 and 18_ADC54950.1 or resi 305 and 18_ADC54950.1 or resi 316 and 18_ADC54950.1 or resi 352 and 18_ADC54950.1
show licorice, cons_ADC54950.1
color atomic, cons_ADC54950.1



load data/wzy/alphafold/ABG81806.1/ranked_0.pdb, 20_ABG81806.1
color teal, 20_ABG81806.1
cealign 7tpg, 20_ABG81806.1

label n. CA and resi 138 and 20_ABG81806.1, "%s-%s" % (resn, resi)
label n. CA and resi 167 and 20_ABG81806.1, "%s-%s" % (resn, resi)
label n. CA and resi 171 and 20_ABG81806.1, "%s-%s" % (resn, resi)
label n. CA and resi 217 and 20_ABG81806.1, "%s-%s" % (resn, resi)
label n. CA and resi 221 and 20_ABG81806.1, "%s-%s" % (resn, resi)
label n. CA and resi 255 and 20_ABG81806.1, "%s-%s" % (resn, resi)
label n. CA and resi 257 and 20_ABG81806.1, "%s-%s" % (resn, resi)
select cons_ABG81806.1, resi 138 and 20_ABG81806.1 or resi 167 and 20_ABG81806.1 or resi 171 and 20_ABG81806.1 or resi 217 and 20_ABG81806.1 or resi 221 and 20_ABG81806.1 or resi 255 and 20_ABG81806.1 or resi 257 and 20_ABG81806.1
show licorice, cons_ABG81806.1
color atomic, cons_ABG81806.1



load data/wzy/alphafold/AFC91472.1/ranked_0.pdb, 20_AFC91472.1
color orange, 20_AFC91472.1
cealign 20_ABG81806.1, 20_AFC91472.1

label n. CA and resi 126 and 20_AFC91472.1, "%s-%s" % (resn, resi)
label n. CA and resi 152 and 20_AFC91472.1, "%s-%s" % (resn, resi)
label n. CA and resi 156 and 20_AFC91472.1, "%s-%s" % (resn, resi)
label n. CA and resi 204 and 20_AFC91472.1, "%s-%s" % (resn, resi)
label n. CA and resi 208 and 20_AFC91472.1, "%s-%s" % (resn, resi)
label n. CA and resi 239 and 20_AFC91472.1, "%s-%s" % (resn, resi)
label n. CA and resi 241 and 20_AFC91472.1, "%s-%s" % (resn, resi)
select cons_AFC91472.1, resi 126 and 20_AFC91472.1 or resi 152 and 20_AFC91472.1 or resi 156 and 20_AFC91472.1 or resi 204 and 20_AFC91472.1 or resi 208 and 20_AFC91472.1 or resi 239 and 20_AFC91472.1 or resi 241 and 20_AFC91472.1
show licorice, cons_AFC91472.1
color atomic, cons_AFC91472.1



load data/wzy/alphafold/BAQ02224.1/ranked_0.pdb, 20_BAQ02224.1
color green, 20_BAQ02224.1
cealign 20_ABG81806.1, 20_BAQ02224.1

label n. CA and resi 138 and 20_BAQ02224.1, "%s-%s" % (resn, resi)
label n. CA and resi 167 and 20_BAQ02224.1, "%s-%s" % (resn, resi)
label n. CA and resi 171 and 20_BAQ02224.1, "%s-%s" % (resn, resi)
label n. CA and resi 217 and 20_BAQ02224.1, "%s-%s" % (resn, resi)
label n. CA and resi 221 and 20_BAQ02224.1, "%s-%s" % (resn, resi)
label n. CA and resi 255 and 20_BAQ02224.1, "%s-%s" % (resn, resi)
label n. CA and resi 257 and 20_BAQ02224.1, "%s-%s" % (resn, resi)
select cons_BAQ02224.1, resi 138 and 20_BAQ02224.1 or resi 167 and 20_BAQ02224.1 or resi 171 and 20_BAQ02224.1 or resi 217 and 20_BAQ02224.1 or resi 221 and 20_BAQ02224.1 or resi 255 and 20_BAQ02224.1 or resi 257 and 20_BAQ02224.1
show licorice, cons_BAQ02224.1
color atomic, cons_BAQ02224.1



load data/wzy/alphafold/AHB32538.1/ranked_0.pdb, 19_AHB32538.1
color teal, 19_AHB32538.1
cealign 7tpg, 19_AHB32538.1

label n. CA and resi 141 and 19_AHB32538.1, "%s-%s" % (resn, resi)
label n. CA and resi 155 and 19_AHB32538.1, "%s-%s" % (resn, resi)
label n. CA and resi 162 and 19_AHB32538.1, "%s-%s" % (resn, resi)
label n. CA and resi 163 and 19_AHB32538.1, "%s-%s" % (resn, resi)
label n. CA and resi 164 and 19_AHB32538.1, "%s-%s" % (resn, resi)
label n. CA and resi 205 and 19_AHB32538.1, "%s-%s" % (resn, resi)
label n. CA and resi 206 and 19_AHB32538.1, "%s-%s" % (resn, resi)
label n. CA and resi 258 and 19_AHB32538.1, "%s-%s" % (resn, resi)
label n. CA and resi 260 and 19_AHB32538.1, "%s-%s" % (resn, resi)
label n. CA and resi 264 and 19_AHB32538.1, "%s-%s" % (resn, resi)
label n. CA and resi 302 and 19_AHB32538.1, "%s-%s" % (resn, resi)
label n. CA and resi 311 and 19_AHB32538.1, "%s-%s" % (resn, resi)
select cons_AHB32538.1, resi 141 and 19_AHB32538.1 or resi 155 and 19_AHB32538.1 or resi 162 and 19_AHB32538.1 or resi 163 and 19_AHB32538.1 or resi 164 and 19_AHB32538.1 or resi 205 and 19_AHB32538.1 or resi 206 and 19_AHB32538.1 or resi 258 and 19_AHB32538.1 or resi 260 and 19_AHB32538.1 or resi 264 and 19_AHB32538.1 or resi 302 and 19_AHB32538.1 or resi 311 and 19_AHB32538.1
show licorice, cons_AHB32538.1
color atomic, cons_AHB32538.1



load data/wzy/alphafold/ACD37014.1/ranked_0.pdb, 19_ACD37014.1
color orange, 19_ACD37014.1
cealign 19_AHB32538.1, 19_ACD37014.1

label n. CA and resi 123 and 19_ACD37014.1, "%s-%s" % (resn, resi)
label n. CA and resi 149 and 19_ACD37014.1, "%s-%s" % (resn, resi)
label n. CA and resi 156 and 19_ACD37014.1, "%s-%s" % (resn, resi)
label n. CA and resi 157 and 19_ACD37014.1, "%s-%s" % (resn, resi)
label n. CA and resi 158 and 19_ACD37014.1, "%s-%s" % (resn, resi)
label n. CA and resi 197 and 19_ACD37014.1, "%s-%s" % (resn, resi)
label n. CA and resi 198 and 19_ACD37014.1, "%s-%s" % (resn, resi)
label n. CA and resi 247 and 19_ACD37014.1, "%s-%s" % (resn, resi)
label n. CA and resi 249 and 19_ACD37014.1, "%s-%s" % (resn, resi)
label n. CA and resi 253 and 19_ACD37014.1, "%s-%s" % (resn, resi)
label n. CA and resi 290 and 19_ACD37014.1, "%s-%s" % (resn, resi)
label n. CA and resi 299 and 19_ACD37014.1, "%s-%s" % (resn, resi)
select cons_ACD37014.1, resi 123 and 19_ACD37014.1 or resi 149 and 19_ACD37014.1 or resi 156 and 19_ACD37014.1 or resi 157 and 19_ACD37014.1 or resi 158 and 19_ACD37014.1 or resi 197 and 19_ACD37014.1 or resi 198 and 19_ACD37014.1 or resi 247 and 19_ACD37014.1 or resi 249 and 19_ACD37014.1 or resi 253 and 19_ACD37014.1 or resi 290 and 19_ACD37014.1 or resi 299 and 19_ACD37014.1
show licorice, cons_ACD37014.1
color atomic, cons_ACD37014.1



load data/wzy/alphafold/ACD37157.1/ranked_0.pdb, 19_ACD37157.1
color green, 19_ACD37157.1
cealign 19_AHB32538.1, 19_ACD37157.1

label n. CA and resi 137 and 19_ACD37157.1, "%s-%s" % (resn, resi)
label n. CA and resi 152 and 19_ACD37157.1, "%s-%s" % (resn, resi)
label n. CA and resi 159 and 19_ACD37157.1, "%s-%s" % (resn, resi)
label n. CA and resi 160 and 19_ACD37157.1, "%s-%s" % (resn, resi)
label n. CA and resi 161 and 19_ACD37157.1, "%s-%s" % (resn, resi)
label n. CA and resi 201 and 19_ACD37157.1, "%s-%s" % (resn, resi)
label n. CA and resi 202 and 19_ACD37157.1, "%s-%s" % (resn, resi)
label n. CA and resi 254 and 19_ACD37157.1, "%s-%s" % (resn, resi)
label n. CA and resi 256 and 19_ACD37157.1, "%s-%s" % (resn, resi)
label n. CA and resi 260 and 19_ACD37157.1, "%s-%s" % (resn, resi)
label n. CA and resi 297 and 19_ACD37157.1, "%s-%s" % (resn, resi)
label n. CA and resi 306 and 19_ACD37157.1, "%s-%s" % (resn, resi)
select cons_ACD37157.1, resi 137 and 19_ACD37157.1 or resi 152 and 19_ACD37157.1 or resi 159 and 19_ACD37157.1 or resi 160 and 19_ACD37157.1 or resi 161 and 19_ACD37157.1 or resi 201 and 19_ACD37157.1 or resi 202 and 19_ACD37157.1 or resi 254 and 19_ACD37157.1 or resi 256 and 19_ACD37157.1 or resi 260 and 19_ACD37157.1 or resi 297 and 19_ACD37157.1 or resi 306 and 19_ACD37157.1
show licorice, cons_ACD37157.1
color atomic, cons_ACD37157.1



load data/wzy/alphafold/BAQ00994.1/ranked_0.pdb, 21_BAQ00994.1
color teal, 21_BAQ00994.1
cealign 7tpg, 21_BAQ00994.1

label n. CA and resi 134 and 21_BAQ00994.1, "%s-%s" % (resn, resi)
label n. CA and resi 146 and 21_BAQ00994.1, "%s-%s" % (resn, resi)
label n. CA and resi 157 and 21_BAQ00994.1, "%s-%s" % (resn, resi)
label n. CA and resi 165 and 21_BAQ00994.1, "%s-%s" % (resn, resi)
label n. CA and resi 172 and 21_BAQ00994.1, "%s-%s" % (resn, resi)
label n. CA and resi 210 and 21_BAQ00994.1, "%s-%s" % (resn, resi)
label n. CA and resi 257 and 21_BAQ00994.1, "%s-%s" % (resn, resi)
label n. CA and resi 266 and 21_BAQ00994.1, "%s-%s" % (resn, resi)
label n. CA and resi 268 and 21_BAQ00994.1, "%s-%s" % (resn, resi)
label n. CA and resi 272 and 21_BAQ00994.1, "%s-%s" % (resn, resi)
label n. CA and resi 309 and 21_BAQ00994.1, "%s-%s" % (resn, resi)
label n. CA and resi 354 and 21_BAQ00994.1, "%s-%s" % (resn, resi)
select cons_BAQ00994.1, resi 134 and 21_BAQ00994.1 or resi 146 and 21_BAQ00994.1 or resi 157 and 21_BAQ00994.1 or resi 165 and 21_BAQ00994.1 or resi 172 and 21_BAQ00994.1 or resi 210 and 21_BAQ00994.1 or resi 257 and 21_BAQ00994.1 or resi 266 and 21_BAQ00994.1 or resi 268 and 21_BAQ00994.1 or resi 272 and 21_BAQ00994.1 or resi 309 and 21_BAQ00994.1 or resi 354 and 21_BAQ00994.1
show licorice, cons_BAQ00994.1
color atomic, cons_BAQ00994.1



load data/wzy/alphafold/BAQ01917.1/ranked_0.pdb, 21_BAQ01917.1
color orange, 21_BAQ01917.1
cealign 21_BAQ00994.1, 21_BAQ01917.1

label n. CA and resi 131 and 21_BAQ01917.1, "%s-%s" % (resn, resi)
label n. CA and resi 143 and 21_BAQ01917.1, "%s-%s" % (resn, resi)
label n. CA and resi 154 and 21_BAQ01917.1, "%s-%s" % (resn, resi)
label n. CA and resi 167 and 21_BAQ01917.1, "%s-%s" % (resn, resi)
label n. CA and resi 174 and 21_BAQ01917.1, "%s-%s" % (resn, resi)
label n. CA and resi 213 and 21_BAQ01917.1, "%s-%s" % (resn, resi)
label n. CA and resi 257 and 21_BAQ01917.1, "%s-%s" % (resn, resi)
label n. CA and resi 266 and 21_BAQ01917.1, "%s-%s" % (resn, resi)
label n. CA and resi 268 and 21_BAQ01917.1, "%s-%s" % (resn, resi)
label n. CA and resi 272 and 21_BAQ01917.1, "%s-%s" % (resn, resi)
label n. CA and resi 306 and 21_BAQ01917.1, "%s-%s" % (resn, resi)
label n. CA and resi 352 and 21_BAQ01917.1, "%s-%s" % (resn, resi)
select cons_BAQ01917.1, resi 131 and 21_BAQ01917.1 or resi 143 and 21_BAQ01917.1 or resi 154 and 21_BAQ01917.1 or resi 167 and 21_BAQ01917.1 or resi 174 and 21_BAQ01917.1 or resi 213 and 21_BAQ01917.1 or resi 257 and 21_BAQ01917.1 or resi 266 and 21_BAQ01917.1 or resi 268 and 21_BAQ01917.1 or resi 272 and 21_BAQ01917.1 or resi 306 and 21_BAQ01917.1 or resi 352 and 21_BAQ01917.1
show licorice, cons_BAQ01917.1
color atomic, cons_BAQ01917.1



load data/wzy/alphafold/ACA24821.1/ranked_0.pdb, 22_ACA24821.1
color teal, 22_ACA24821.1
cealign 7tpg, 22_ACA24821.1

label n. CA and resi 48 and 22_ACA24821.1, "%s-%s" % (resn, resi)
label n. CA and resi 54 and 22_ACA24821.1, "%s-%s" % (resn, resi)
label n. CA and resi 58 and 22_ACA24821.1, "%s-%s" % (resn, resi)
label n. CA and resi 73 and 22_ACA24821.1, "%s-%s" % (resn, resi)
label n. CA and resi 134 and 22_ACA24821.1, "%s-%s" % (resn, resi)
label n. CA and resi 168 and 22_ACA24821.1, "%s-%s" % (resn, resi)
label n. CA and resi 221 and 22_ACA24821.1, "%s-%s" % (resn, resi)
label n. CA and resi 290 and 22_ACA24821.1, "%s-%s" % (resn, resi)
label n. CA and resi 351 and 22_ACA24821.1, "%s-%s" % (resn, resi)
select cons_ACA24821.1, resi 48 and 22_ACA24821.1 or resi 54 and 22_ACA24821.1 or resi 58 and 22_ACA24821.1 or resi 73 and 22_ACA24821.1 or resi 134 and 22_ACA24821.1 or resi 168 and 22_ACA24821.1 or resi 221 and 22_ACA24821.1 or resi 290 and 22_ACA24821.1 or resi 351 and 22_ACA24821.1
show licorice, cons_ACA24821.1
color atomic, cons_ACA24821.1



load data/wzy/alphafold/AHB32687.1/ranked_0.pdb, 23_AHB32687.1
color teal, 23_AHB32687.1
cealign 7tpg, 23_AHB32687.1

label n. CA and resi 32 and 23_AHB32687.1, "%s-%s" % (resn, resi)
label n. CA and resi 55 and 23_AHB32687.1, "%s-%s" % (resn, resi)
label n. CA and resi 72 and 23_AHB32687.1, "%s-%s" % (resn, resi)
label n. CA and resi 83 and 23_AHB32687.1, "%s-%s" % (resn, resi)
label n. CA and resi 111 and 23_AHB32687.1, "%s-%s" % (resn, resi)
label n. CA and resi 184 and 23_AHB32687.1, "%s-%s" % (resn, resi)
label n. CA and resi 185 and 23_AHB32687.1, "%s-%s" % (resn, resi)
label n. CA and resi 218 and 23_AHB32687.1, "%s-%s" % (resn, resi)
label n. CA and resi 272 and 23_AHB32687.1, "%s-%s" % (resn, resi)
label n. CA and resi 335 and 23_AHB32687.1, "%s-%s" % (resn, resi)
select cons_AHB32687.1, resi 32 and 23_AHB32687.1 or resi 55 and 23_AHB32687.1 or resi 72 and 23_AHB32687.1 or resi 83 and 23_AHB32687.1 or resi 111 and 23_AHB32687.1 or resi 184 and 23_AHB32687.1 or resi 185 and 23_AHB32687.1 or resi 218 and 23_AHB32687.1 or resi 272 and 23_AHB32687.1 or resi 335 and 23_AHB32687.1
show licorice, cons_AHB32687.1
color atomic, cons_AHB32687.1



load data/wzy/alphafold/BAQ01743.1/ranked_0.pdb, 23_BAQ01743.1
color orange, 23_BAQ01743.1
cealign 23_AHB32687.1, 23_BAQ01743.1

label n. CA and resi 32 and 23_BAQ01743.1, "%s-%s" % (resn, resi)
label n. CA and resi 55 and 23_BAQ01743.1, "%s-%s" % (resn, resi)
label n. CA and resi 72 and 23_BAQ01743.1, "%s-%s" % (resn, resi)
label n. CA and resi 82 and 23_BAQ01743.1, "%s-%s" % (resn, resi)
label n. CA and resi 109 and 23_BAQ01743.1, "%s-%s" % (resn, resi)
label n. CA and resi 181 and 23_BAQ01743.1, "%s-%s" % (resn, resi)
label n. CA and resi 182 and 23_BAQ01743.1, "%s-%s" % (resn, resi)
label n. CA and resi 215 and 23_BAQ01743.1, "%s-%s" % (resn, resi)
label n. CA and resi 268 and 23_BAQ01743.1, "%s-%s" % (resn, resi)
label n. CA and resi 330 and 23_BAQ01743.1, "%s-%s" % (resn, resi)
select cons_BAQ01743.1, resi 32 and 23_BAQ01743.1 or resi 55 and 23_BAQ01743.1 or resi 72 and 23_BAQ01743.1 or resi 82 and 23_BAQ01743.1 or resi 109 and 23_BAQ01743.1 or resi 181 and 23_BAQ01743.1 or resi 182 and 23_BAQ01743.1 or resi 215 and 23_BAQ01743.1 or resi 268 and 23_BAQ01743.1 or resi 330 and 23_BAQ01743.1
show licorice, cons_BAQ01743.1
color atomic, cons_BAQ01743.1



load data/wzy/alphafold/ABI55342.1/ranked_0.pdb, 23_ABI55342.1
color green, 23_ABI55342.1
cealign 23_AHB32687.1, 23_ABI55342.1

label n. CA and resi 34 and 23_ABI55342.1, "%s-%s" % (resn, resi)
label n. CA and resi 58 and 23_ABI55342.1, "%s-%s" % (resn, resi)
label n. CA and resi 75 and 23_ABI55342.1, "%s-%s" % (resn, resi)
label n. CA and resi 85 and 23_ABI55342.1, "%s-%s" % (resn, resi)
label n. CA and resi 112 and 23_ABI55342.1, "%s-%s" % (resn, resi)
label n. CA and resi 184 and 23_ABI55342.1, "%s-%s" % (resn, resi)
label n. CA and resi 185 and 23_ABI55342.1, "%s-%s" % (resn, resi)
label n. CA and resi 214 and 23_ABI55342.1, "%s-%s" % (resn, resi)
label n. CA and resi 272 and 23_ABI55342.1, "%s-%s" % (resn, resi)
label n. CA and resi 336 and 23_ABI55342.1, "%s-%s" % (resn, resi)
select cons_ABI55342.1, resi 34 and 23_ABI55342.1 or resi 58 and 23_ABI55342.1 or resi 75 and 23_ABI55342.1 or resi 85 and 23_ABI55342.1 or resi 112 and 23_ABI55342.1 or resi 184 and 23_ABI55342.1 or resi 185 and 23_ABI55342.1 or resi 214 and 23_ABI55342.1 or resi 272 and 23_ABI55342.1 or resi 336 and 23_ABI55342.1
show licorice, cons_ABI55342.1
color atomic, cons_ABI55342.1


set label_position,(1,1,1)
set label_color,black
center 
disable 
bg_color white 
