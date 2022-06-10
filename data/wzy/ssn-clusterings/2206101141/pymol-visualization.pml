set cartoon_side_chain_helper, on
fetch 7tpg
select chain_H, chain H
select chain_L, chain L
select chain_B, chain B
hide cartoon, chain_H
hide cartoon, chain_L
color teal, chain_B
select "arg_7tpg", resi 242 and chain_B or resi 265 and chain_B or resi 191 and chain_B or resi 139 and chain_B
show licorice, arg_7tpg
color atomic, arg_7tpg
center
set_view (     0.129056588,   -0.914879322,   -0.382540226,    -0.931019366,    0.021019539,   -0.364364743,     0.341392726,    0.403177291,   -0.849059284,     0.000000000,    0.000000000, -203.904266357,   134.720489502,  144.012847900,  140.640121460,   160.759674072,  247.048858643,  -20.000000000 )

load data/wzy/alphafold/2202060002-wzy_100/af_out/AHB32861.1/ranked_0.pdb, 0240_9_AHB32861.1
color silver, 0240_9_AHB32861.1
label n. CA and resi 42 and 0240_9_AHB32861.1, "%s-%s" % (resn, resi)
label n. CA and resi 48 and 0240_9_AHB32861.1, "%s-%s" % (resn, resi)
label n. CA and resi 52 and 0240_9_AHB32861.1, "%s-%s" % (resn, resi)
label n. CA and resi 136 and 0240_9_AHB32861.1, "%s-%s" % (resn, resi)
label n. CA and resi 137 and 0240_9_AHB32861.1, "%s-%s" % (resn, resi)
label n. CA and resi 170 and 0240_9_AHB32861.1, "%s-%s" % (resn, resi)
label n. CA and resi 221 and 0240_9_AHB32861.1, "%s-%s" % (resn, resi)
label n. CA and resi 236 and 0240_9_AHB32861.1, "%s-%s" % (resn, resi)
label n. CA and resi 286 and 0240_9_AHB32861.1, "%s-%s" % (resn, resi)
label n. CA and resi 287 and 0240_9_AHB32861.1, "%s-%s" % (resn, resi)
select cons_AHB32861.1, resi 42 and 0240_9_AHB32861.1 or resi 48 and 0240_9_AHB32861.1 or resi 52 and 0240_9_AHB32861.1 or resi 136 and 0240_9_AHB32861.1 or resi 137 and 0240_9_AHB32861.1 or resi 170 and 0240_9_AHB32861.1 or resi 221 and 0240_9_AHB32861.1 or resi 236 and 0240_9_AHB32861.1 or resi 286 and 0240_9_AHB32861.1 or resi 287 and 0240_9_AHB32861.1
show licorice, cons_AHB32861.1
color atomic, cons_AHB32861.1
cealign 7tpg, 0240_9_AHB32861.1


load data/wzy/alphafold/2202060002-wzy_100/af_out/CAI34254.1/ranked_0.pdb, 0119_39_CAI34254.1
color silver, 0119_39_CAI34254.1
label n. CA and resi 182 and 0119_39_CAI34254.1, "%s-%s" % (resn, resi)
label n. CA and resi 183 and 0119_39_CAI34254.1, "%s-%s" % (resn, resi)
label n. CA and resi 189 and 0119_39_CAI34254.1, "%s-%s" % (resn, resi)
label n. CA and resi 277 and 0119_39_CAI34254.1, "%s-%s" % (resn, resi)
select cons_CAI34254.1, resi 182 and 0119_39_CAI34254.1 or resi 183 and 0119_39_CAI34254.1 or resi 189 and 0119_39_CAI34254.1 or resi 277 and 0119_39_CAI34254.1
show licorice, cons_CAI34254.1
color atomic, cons_CAI34254.1
cealign 7tpg, 0119_39_CAI34254.1


load data/wzy/alphafold/2202060002-wzy_100/af_out/ADC54967.1/ranked_0.pdb, 0270_32_ADC54967.1
color silver, 0270_32_ADC54967.1
label n. CA and resi 50 and 0270_32_ADC54967.1, "%s-%s" % (resn, resi)
label n. CA and resi 54 and 0270_32_ADC54967.1, "%s-%s" % (resn, resi)
label n. CA and resi 142 and 0270_32_ADC54967.1, "%s-%s" % (resn, resi)
label n. CA and resi 174 and 0270_32_ADC54967.1, "%s-%s" % (resn, resi)
label n. CA and resi 300 and 0270_32_ADC54967.1, "%s-%s" % (resn, resi)
select cons_ADC54967.1, resi 50 and 0270_32_ADC54967.1 or resi 54 and 0270_32_ADC54967.1 or resi 142 and 0270_32_ADC54967.1 or resi 174 and 0270_32_ADC54967.1 or resi 300 and 0270_32_ADC54967.1
show licorice, cons_ADC54967.1
color atomic, cons_ADC54967.1
cealign 7tpg, 0270_32_ADC54967.1


load data/wzy/alphafold/2205031317-wzy_missing/af_out/ACH50550.1/ranked_0.pdb, 0548_8_ACH50550.1
color silver, 0548_8_ACH50550.1
label n. CA and resi 89 and 0548_8_ACH50550.1, "%s-%s" % (resn, resi)
label n. CA and resi 145 and 0548_8_ACH50550.1, "%s-%s" % (resn, resi)
label n. CA and resi 163 and 0548_8_ACH50550.1, "%s-%s" % (resn, resi)
label n. CA and resi 197 and 0548_8_ACH50550.1, "%s-%s" % (resn, resi)
label n. CA and resi 204 and 0548_8_ACH50550.1, "%s-%s" % (resn, resi)
label n. CA and resi 247 and 0548_8_ACH50550.1, "%s-%s" % (resn, resi)
label n. CA and resi 248 and 0548_8_ACH50550.1, "%s-%s" % (resn, resi)
label n. CA and resi 267 and 0548_8_ACH50550.1, "%s-%s" % (resn, resi)
label n. CA and resi 270 and 0548_8_ACH50550.1, "%s-%s" % (resn, resi)
label n. CA and resi 315 and 0548_8_ACH50550.1, "%s-%s" % (resn, resi)
label n. CA and resi 321 and 0548_8_ACH50550.1, "%s-%s" % (resn, resi)
label n. CA and resi 334 and 0548_8_ACH50550.1, "%s-%s" % (resn, resi)
label n. CA and resi 336 and 0548_8_ACH50550.1, "%s-%s" % (resn, resi)
label n. CA and resi 340 and 0548_8_ACH50550.1, "%s-%s" % (resn, resi)
label n. CA and resi 365 and 0548_8_ACH50550.1, "%s-%s" % (resn, resi)
label n. CA and resi 399 and 0548_8_ACH50550.1, "%s-%s" % (resn, resi)
select cons_ACH50550.1, resi 89 and 0548_8_ACH50550.1 or resi 145 and 0548_8_ACH50550.1 or resi 163 and 0548_8_ACH50550.1 or resi 197 and 0548_8_ACH50550.1 or resi 204 and 0548_8_ACH50550.1 or resi 247 and 0548_8_ACH50550.1 or resi 248 and 0548_8_ACH50550.1 or resi 267 and 0548_8_ACH50550.1 or resi 270 and 0548_8_ACH50550.1 or resi 315 and 0548_8_ACH50550.1 or resi 321 and 0548_8_ACH50550.1 or resi 334 and 0548_8_ACH50550.1 or resi 336 and 0548_8_ACH50550.1 or resi 340 and 0548_8_ACH50550.1 or resi 365 and 0548_8_ACH50550.1 or resi 399 and 0548_8_ACH50550.1
show licorice, cons_ACH50550.1
color atomic, cons_ACH50550.1
cealign 7tpg, 0548_8_ACH50550.1


load data/wzy/alphafold/2205031317-wzy/af_out/WP_163049471.1/ranked_0.pdb, 0134_23_WP_163049471.1
color silver, 0134_23_WP_163049471.1
label n. CA and resi 41 and 0134_23_WP_163049471.1, "%s-%s" % (resn, resi)
label n. CA and resi 48 and 0134_23_WP_163049471.1, "%s-%s" % (resn, resi)
label n. CA and resi 52 and 0134_23_WP_163049471.1, "%s-%s" % (resn, resi)
label n. CA and resi 136 and 0134_23_WP_163049471.1, "%s-%s" % (resn, resi)
label n. CA and resi 170 and 0134_23_WP_163049471.1, "%s-%s" % (resn, resi)
label n. CA and resi 287 and 0134_23_WP_163049471.1, "%s-%s" % (resn, resi)
select cons_WP_163049471.1, resi 41 and 0134_23_WP_163049471.1 or resi 48 and 0134_23_WP_163049471.1 or resi 52 and 0134_23_WP_163049471.1 or resi 136 and 0134_23_WP_163049471.1 or resi 170 and 0134_23_WP_163049471.1 or resi 287 and 0134_23_WP_163049471.1
show licorice, cons_WP_163049471.1
color atomic, cons_WP_163049471.1
cealign 7tpg, 0134_23_WP_163049471.1


load data/wzy/alphafold/2205031317-wzy/af_out/CAI34124.1/ranked_0.pdb, 0152_11_CAI34124.1
color silver, 0152_11_CAI34124.1
label n. CA and resi 267 and 0152_11_CAI34124.1, "%s-%s" % (resn, resi)
label n. CA and resi 304 and 0152_11_CAI34124.1, "%s-%s" % (resn, resi)
label n. CA and resi 325 and 0152_11_CAI34124.1, "%s-%s" % (resn, resi)
select cons_CAI34124.1, resi 267 and 0152_11_CAI34124.1 or resi 304 and 0152_11_CAI34124.1 or resi 325 and 0152_11_CAI34124.1
show licorice, cons_CAI34124.1
color atomic, cons_CAI34124.1
cealign 7tpg, 0152_11_CAI34124.1


load data/wzy/alphafold/2202060002-wzy_100/af_out/AHB32411.1/ranked_0.pdb, 0136_29_AHB32411.1
color silver, 0136_29_AHB32411.1
label n. CA and resi 162 and 0136_29_AHB32411.1, "%s-%s" % (resn, resi)
label n. CA and resi 207 and 0136_29_AHB32411.1, "%s-%s" % (resn, resi)
label n. CA and resi 242 and 0136_29_AHB32411.1, "%s-%s" % (resn, resi)
label n. CA and resi 244 and 0136_29_AHB32411.1, "%s-%s" % (resn, resi)
label n. CA and resi 251 and 0136_29_AHB32411.1, "%s-%s" % (resn, resi)
select cons_AHB32411.1, resi 162 and 0136_29_AHB32411.1 or resi 207 and 0136_29_AHB32411.1 or resi 242 and 0136_29_AHB32411.1 or resi 244 and 0136_29_AHB32411.1 or resi 251 and 0136_29_AHB32411.1
show licorice, cons_AHB32411.1
color atomic, cons_AHB32411.1
cealign 7tpg, 0136_29_AHB32411.1


load data/wzy/alphafold/2205031317-wzy/af_out/CDF66396.1/ranked_0.pdb, 0258_15_CDF66396.1
color silver, 0258_15_CDF66396.1
label n. CA and resi 168 and 0258_15_CDF66396.1, "%s-%s" % (resn, resi)
label n. CA and resi 171 and 0258_15_CDF66396.1, "%s-%s" % (resn, resi)
label n. CA and resi 185 and 0258_15_CDF66396.1, "%s-%s" % (resn, resi)
label n. CA and resi 228 and 0258_15_CDF66396.1, "%s-%s" % (resn, resi)
label n. CA and resi 284 and 0258_15_CDF66396.1, "%s-%s" % (resn, resi)
label n. CA and resi 345 and 0258_15_CDF66396.1, "%s-%s" % (resn, resi)
select cons_CDF66396.1, resi 168 and 0258_15_CDF66396.1 or resi 171 and 0258_15_CDF66396.1 or resi 185 and 0258_15_CDF66396.1 or resi 228 and 0258_15_CDF66396.1 or resi 284 and 0258_15_CDF66396.1 or resi 345 and 0258_15_CDF66396.1
show licorice, cons_CDF66396.1
color atomic, cons_CDF66396.1
cealign 7tpg, 0258_15_CDF66396.1


load data/wzy/alphafold/2202060002-wzy_100/af_out/AAT77177.1/ranked_0.pdb, 0129_50_AAT77177.1
color silver, 0129_50_AAT77177.1
label n. CA and resi 165 and 0129_50_AAT77177.1, "%s-%s" % (resn, resi)
label n. CA and resi 226 and 0129_50_AAT77177.1, "%s-%s" % (resn, resi)
label n. CA and resi 284 and 0129_50_AAT77177.1, "%s-%s" % (resn, resi)
label n. CA and resi 387 and 0129_50_AAT77177.1, "%s-%s" % (resn, resi)
select cons_AAT77177.1, resi 165 and 0129_50_AAT77177.1 or resi 226 and 0129_50_AAT77177.1 or resi 284 and 0129_50_AAT77177.1 or resi 387 and 0129_50_AAT77177.1
show licorice, cons_AAT77177.1
color atomic, cons_AAT77177.1
cealign 7tpg, 0129_50_AAT77177.1


load data/wzy/alphafold/2202060002-wzy_100/af_out/BAQ00795.1/ranked_0.pdb, 0129_33_BAQ00795.1
color silver, 0129_33_BAQ00795.1
label n. CA and resi 30 and 0129_33_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 38 and 0129_33_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 95 and 0129_33_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 97 and 0129_33_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 129 and 0129_33_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 159 and 0129_33_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 160 and 0129_33_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 161 and 0129_33_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 163 and 0129_33_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 164 and 0129_33_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 169 and 0129_33_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 177 and 0129_33_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 213 and 0129_33_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 222 and 0129_33_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 226 and 0129_33_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 232 and 0129_33_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 258 and 0129_33_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 261 and 0129_33_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 265 and 0129_33_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 276 and 0129_33_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 292 and 0129_33_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 297 and 0129_33_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 300 and 0129_33_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 307 and 0129_33_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 308 and 0129_33_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 312 and 0129_33_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 313 and 0129_33_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 317 and 0129_33_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 318 and 0129_33_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 321 and 0129_33_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 326 and 0129_33_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 355 and 0129_33_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 366 and 0129_33_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 368 and 0129_33_BAQ00795.1, "%s-%s" % (resn, resi)
select cons_BAQ00795.1, resi 30 and 0129_33_BAQ00795.1 or resi 38 and 0129_33_BAQ00795.1 or resi 95 and 0129_33_BAQ00795.1 or resi 97 and 0129_33_BAQ00795.1 or resi 129 and 0129_33_BAQ00795.1 or resi 159 and 0129_33_BAQ00795.1 or resi 160 and 0129_33_BAQ00795.1 or resi 161 and 0129_33_BAQ00795.1 or resi 163 and 0129_33_BAQ00795.1 or resi 164 and 0129_33_BAQ00795.1 or resi 169 and 0129_33_BAQ00795.1 or resi 177 and 0129_33_BAQ00795.1 or resi 213 and 0129_33_BAQ00795.1 or resi 222 and 0129_33_BAQ00795.1 or resi 226 and 0129_33_BAQ00795.1 or resi 232 and 0129_33_BAQ00795.1 or resi 258 and 0129_33_BAQ00795.1 or resi 261 and 0129_33_BAQ00795.1 or resi 265 and 0129_33_BAQ00795.1 or resi 276 and 0129_33_BAQ00795.1 or resi 292 and 0129_33_BAQ00795.1 or resi 297 and 0129_33_BAQ00795.1 or resi 300 and 0129_33_BAQ00795.1 or resi 307 and 0129_33_BAQ00795.1 or resi 308 and 0129_33_BAQ00795.1 or resi 312 and 0129_33_BAQ00795.1 or resi 313 and 0129_33_BAQ00795.1 or resi 317 and 0129_33_BAQ00795.1 or resi 318 and 0129_33_BAQ00795.1 or resi 321 and 0129_33_BAQ00795.1 or resi 326 and 0129_33_BAQ00795.1 or resi 355 and 0129_33_BAQ00795.1 or resi 366 and 0129_33_BAQ00795.1 or resi 368 and 0129_33_BAQ00795.1
show licorice, cons_BAQ00795.1
color atomic, cons_BAQ00795.1
cealign 7tpg, 0129_33_BAQ00795.1


load data/wzy/alphafold/2202060002-wzy_100/af_out/BAQ02088.1/ranked_0.pdb, 0107_2_BAQ02088.1
color silver, 0107_2_BAQ02088.1
label n. CA and resi 139 and 0107_2_BAQ02088.1, "%s-%s" % (resn, resi)
label n. CA and resi 175 and 0107_2_BAQ02088.1, "%s-%s" % (resn, resi)
label n. CA and resi 228 and 0107_2_BAQ02088.1, "%s-%s" % (resn, resi)
label n. CA and resi 307 and 0107_2_BAQ02088.1, "%s-%s" % (resn, resi)
label n. CA and resi 343 and 0107_2_BAQ02088.1, "%s-%s" % (resn, resi)
label n. CA and resi 348 and 0107_2_BAQ02088.1, "%s-%s" % (resn, resi)
select cons_BAQ02088.1, resi 139 and 0107_2_BAQ02088.1 or resi 175 and 0107_2_BAQ02088.1 or resi 228 and 0107_2_BAQ02088.1 or resi 307 and 0107_2_BAQ02088.1 or resi 343 and 0107_2_BAQ02088.1 or resi 348 and 0107_2_BAQ02088.1
show licorice, cons_BAQ02088.1
color atomic, cons_BAQ02088.1
cealign 7tpg, 0107_2_BAQ02088.1


load data/wzy/alphafold/2202060002-wzy_100/af_out/CAI33309.1/ranked_0.pdb, 0478_3_CAI33309.1
color silver, 0478_3_CAI33309.1
label n. CA and resi 150 and 0478_3_CAI33309.1, "%s-%s" % (resn, resi)
label n. CA and resi 266 and 0478_3_CAI33309.1, "%s-%s" % (resn, resi)
label n. CA and resi 304 and 0478_3_CAI33309.1, "%s-%s" % (resn, resi)
select cons_CAI33309.1, resi 150 and 0478_3_CAI33309.1 or resi 266 and 0478_3_CAI33309.1 or resi 304 and 0478_3_CAI33309.1
show licorice, cons_CAI33309.1
color atomic, cons_CAI33309.1
cealign 7tpg, 0478_3_CAI33309.1

set label_position,(1,1,1)
set label_color,black
center 
disable 
bg_color white 
