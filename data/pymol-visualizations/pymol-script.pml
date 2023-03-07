
fetch 7tpg
select chain_B, chain B
hide cartoon, !chain_B
color 0xeeeeee, chain_B
select "cons_7tpg", resi 265 and chain_B or resi 191 and chain_B or resi 313 and chain_B
show licorice, cons_7tpg
color atomic, (cons_7tpg and not elem C)
@src/pymol-visualization/nicify.pml

load data/eca-pol/alphafold/ACH50550.1/ranked_0.pdb, ECA-Pol_ACH50550.1
color 0xeeeeee, ECA-Pol_ACH50550.1
label n. CA and resi 145 and ECA-Pol_ACH50550.1, "%s-%s" % (resn, resi)
label n. CA and resi 204 and ECA-Pol_ACH50550.1, "%s-%s" % (resn, resi)
label n. CA and resi 247 and ECA-Pol_ACH50550.1, "%s-%s" % (resn, resi)
label n. CA and resi 248 and ECA-Pol_ACH50550.1, "%s-%s" % (resn, resi)
label n. CA and resi 321 and ECA-Pol_ACH50550.1, "%s-%s" % (resn, resi)
label n. CA and resi 336 and ECA-Pol_ACH50550.1, "%s-%s" % (resn, resi)
label n. CA and resi 365 and ECA-Pol_ACH50550.1, "%s-%s" % (resn, resi)
label n. CA and resi 399 and ECA-Pol_ACH50550.1, "%s-%s" % (resn, resi)
select cons_ECA-Pol_ACH50550.1, resi 145 and ECA-Pol_ACH50550.1 or resi 204 and ECA-Pol_ACH50550.1 or resi 247 and ECA-Pol_ACH50550.1 or resi 248 and ECA-Pol_ACH50550.1 or resi 321 and ECA-Pol_ACH50550.1 or resi 336 and ECA-Pol_ACH50550.1 or resi 365 and ECA-Pol_ACH50550.1 or resi 399 and ECA-Pol_ACH50550.1
show licorice, cons_ECA-Pol_ACH50550.1
color atomic, (cons_ECA-Pol_ACH50550.1 and not elem C)
cealign 7tpg, ECA-Pol_ACH50550.1
fetch 6BAR
color 0xeeeeee, 6BAR
label n. CA and resi 105 and 6BAR, "%s-%s" % (resn, resi)
label n. CA and resi 108 and 6BAR, "%s-%s" % (resn, resi)
label n. CA and resi 111 and 6BAR, "%s-%s" % (resn, resi)
label n. CA and resi 203 and 6BAR, "%s-%s" % (resn, resi)
label n. CA and resi 255 and 6BAR, "%s-%s" % (resn, resi)
label n. CA and resi 263 and 6BAR, "%s-%s" % (resn, resi)
label n. CA and resi 333 and 6BAR, "%s-%s" % (resn, resi)
select cons_6BAR, resi 105 and 6BAR or resi 108 and 6BAR or resi 111 and 6BAR or resi 203 and 6BAR or resi 255 and 6BAR or resi 263 and 6BAR or resi 333 and 6BAR
show licorice, cons_6BAR
color atomic, (cons_6BAR and not elem C)
cealign 7tpg, 6BAR

load data/wzy/alphafold/AHB32215.1/ranked_0.pdb, 1_inv_AHB32215.1
    color 0xeeeeee, 1_inv_AHB32215.1
    cealign 6bar, 1_inv_AHB32215.1
    label n. CA and resi 49 and 1_inv_AHB32215.1, "%s" % (resn)
label n. CA and resi 53 and 1_inv_AHB32215.1, "%s" % (resn)
label n. CA and resi 137 and 1_inv_AHB32215.1, "%s" % (resn)
label n. CA and resi 171 and 1_inv_AHB32215.1, "%s" % (resn)
label n. CA and resi 219 and 1_inv_AHB32215.1, "%s" % (resn)
label n. CA and resi 283 and 1_inv_AHB32215.1, "%s" % (resn)
select cons_1_inv_AHB32215.1, resi 49 and 1_inv_AHB32215.1 or resi 53 and 1_inv_AHB32215.1 or resi 137 and 1_inv_AHB32215.1 or resi 171 and 1_inv_AHB32215.1 or resi 219 and 1_inv_AHB32215.1 or resi 283 and 1_inv_AHB32215.1
show licorice, cons_1_inv_AHB32215.1
    color atomic, (cons_1_inv_AHB32215.1 and not elem C)
    load data/wzy/alphafold/AHB32334.1/ranked_0.pdb, 1_inv_AHB32334.1
    color 0xeeeeee, 1_inv_AHB32334.1
    cealign 1_inv_AHB32215.1, 1_inv_AHB32334.1
    label n. CA and resi 33 and 1_inv_AHB32334.1, "%s" % (resn)
label n. CA and resi 37 and 1_inv_AHB32334.1, "%s" % (resn)
label n. CA and resi 126 and 1_inv_AHB32334.1, "%s" % (resn)
label n. CA and resi 161 and 1_inv_AHB32334.1, "%s" % (resn)
label n. CA and resi 219 and 1_inv_AHB32334.1, "%s" % (resn)
label n. CA and resi 284 and 1_inv_AHB32334.1, "%s" % (resn)
select cons_1_inv_AHB32334.1, resi 33 and 1_inv_AHB32334.1 or resi 37 and 1_inv_AHB32334.1 or resi 126 and 1_inv_AHB32334.1 or resi 161 and 1_inv_AHB32334.1 or resi 219 and 1_inv_AHB32334.1 or resi 284 and 1_inv_AHB32334.1
show licorice, cons_1_inv_AHB32334.1
    color atomic, (cons_1_inv_AHB32334.1 and not elem C)
    load data/wzy/alphafold/AHB32861.1/ranked_0.pdb, 1_inv_AHB32861.1
    color 0xeeeeee, 1_inv_AHB32861.1
    cealign 1_inv_AHB32215.1, 1_inv_AHB32861.1
    label n. CA and resi 48 and 1_inv_AHB32861.1, "%s" % (resn)
label n. CA and resi 52 and 1_inv_AHB32861.1, "%s" % (resn)
label n. CA and resi 136 and 1_inv_AHB32861.1, "%s" % (resn)
label n. CA and resi 170 and 1_inv_AHB32861.1, "%s" % (resn)
label n. CA and resi 221 and 1_inv_AHB32861.1, "%s" % (resn)
label n. CA and resi 287 and 1_inv_AHB32861.1, "%s" % (resn)
select cons_1_inv_AHB32861.1, resi 48 and 1_inv_AHB32861.1 or resi 52 and 1_inv_AHB32861.1 or resi 136 and 1_inv_AHB32861.1 or resi 170 and 1_inv_AHB32861.1 or resi 221 and 1_inv_AHB32861.1 or resi 287 and 1_inv_AHB32861.1
show licorice, cons_1_inv_AHB32861.1
    color atomic, (cons_1_inv_AHB32861.1 and not elem C)
    load data/wzy/alphafold/CAI34008.1/ranked_0.pdb, 1_inv_CAI34008.1
    color 0xeeeeee, 1_inv_CAI34008.1
    cealign 1_inv_AHB32215.1, 1_inv_CAI34008.1
    label n. CA and resi 51 and 1_inv_CAI34008.1, "%s" % (resn)
label n. CA and resi 55 and 1_inv_CAI34008.1, "%s" % (resn)
label n. CA and resi 153 and 1_inv_CAI34008.1, "%s" % (resn)
label n. CA and resi 187 and 1_inv_CAI34008.1, "%s" % (resn)
label n. CA and resi 254 and 1_inv_CAI34008.1, "%s" % (resn)
label n. CA and resi 315 and 1_inv_CAI34008.1, "%s" % (resn)
select cons_1_inv_CAI34008.1, resi 51 and 1_inv_CAI34008.1 or resi 55 and 1_inv_CAI34008.1 or resi 153 and 1_inv_CAI34008.1 or resi 187 and 1_inv_CAI34008.1 or resi 254 and 1_inv_CAI34008.1 or resi 315 and 1_inv_CAI34008.1
show licorice, cons_1_inv_CAI34008.1
    color atomic, (cons_1_inv_CAI34008.1 and not elem C)
    load data/wzy/alphafold/ACH97162.1/ranked_0.pdb, 1_inv_ACH97162.1
    color 0xeeeeee, 1_inv_ACH97162.1
    cealign 1_inv_AHB32215.1, 1_inv_ACH97162.1
    label n. CA and resi 51 and 1_inv_ACH97162.1, "%s" % (resn)
label n. CA and resi 55 and 1_inv_ACH97162.1, "%s" % (resn)
label n. CA and resi 142 and 1_inv_ACH97162.1, "%s" % (resn)
label n. CA and resi 176 and 1_inv_ACH97162.1, "%s" % (resn)
label n. CA and resi 234 and 1_inv_ACH97162.1, "%s" % (resn)
label n. CA and resi 301 and 1_inv_ACH97162.1, "%s" % (resn)
select cons_1_inv_ACH97162.1, resi 51 and 1_inv_ACH97162.1 or resi 55 and 1_inv_ACH97162.1 or resi 142 and 1_inv_ACH97162.1 or resi 176 and 1_inv_ACH97162.1 or resi 234 and 1_inv_ACH97162.1 or resi 301 and 1_inv_ACH97162.1
show licorice, cons_1_inv_ACH97162.1
    color atomic, (cons_1_inv_ACH97162.1 and not elem C)
    load data/wzy/alphafold/CAI33309.1/ranked_0.pdb, 3_inv_CAI33309.1
    color 0xeeeeee, 3_inv_CAI33309.1
    cealign 6bar, 3_inv_CAI33309.1
    label n. CA and resi 150 and 3_inv_CAI33309.1, "%s" % (resn)
label n. CA and resi 266 and 3_inv_CAI33309.1, "%s" % (resn)
label n. CA and resi 304 and 3_inv_CAI33309.1, "%s" % (resn)
select cons_3_inv_CAI33309.1, resi 150 and 3_inv_CAI33309.1 or resi 266 and 3_inv_CAI33309.1 or resi 304 and 3_inv_CAI33309.1
show licorice, cons_3_inv_CAI33309.1
    color atomic, (cons_3_inv_CAI33309.1 and not elem C)
    load data/wzy/alphafold/CAI34369.1/ranked_0.pdb, 3_inv_CAI34369.1
    color 0xeeeeee, 3_inv_CAI34369.1
    cealign 3_inv_CAI33309.1, 3_inv_CAI34369.1
    label n. CA and resi 151 and 3_inv_CAI34369.1, "%s" % (resn)
label n. CA and resi 268 and 3_inv_CAI34369.1, "%s" % (resn)
label n. CA and resi 308 and 3_inv_CAI34369.1, "%s" % (resn)
select cons_3_inv_CAI34369.1, resi 151 and 3_inv_CAI34369.1 or resi 268 and 3_inv_CAI34369.1 or resi 308 and 3_inv_CAI34369.1
show licorice, cons_3_inv_CAI34369.1
    color atomic, (cons_3_inv_CAI34369.1 and not elem C)
    load data/wzy/alphafold/AIG62747.1/ranked_0.pdb, 3_inv_AIG62747.1
    color 0xeeeeee, 3_inv_AIG62747.1
    cealign 3_inv_CAI33309.1, 3_inv_AIG62747.1
    label n. CA and resi 134 and 3_inv_AIG62747.1, "%s" % (resn)
label n. CA and resi 250 and 3_inv_AIG62747.1, "%s" % (resn)
label n. CA and resi 280 and 3_inv_AIG62747.1, "%s" % (resn)
select cons_3_inv_AIG62747.1, resi 134 and 3_inv_AIG62747.1 or resi 250 and 3_inv_AIG62747.1 or resi 280 and 3_inv_AIG62747.1
show licorice, cons_3_inv_AIG62747.1
    color atomic, (cons_3_inv_AIG62747.1 and not elem C)
    load data/wzy/alphafold/BAQ00653.1/ranked_0.pdb, 2_ret_BAQ00653.1
    color 0xeeeeee, 2_ret_BAQ00653.1
    cealign ECA-Pol_ACH50550.1, 2_ret_BAQ00653.1
    label n. CA and resi 246 and 2_ret_BAQ00653.1, "%s" % (resn)
label n. CA and resi 301 and 2_ret_BAQ00653.1, "%s" % (resn)
select cons_2_ret_BAQ00653.1, resi 246 and 2_ret_BAQ00653.1 or resi 301 and 2_ret_BAQ00653.1
show licorice, cons_2_ret_BAQ00653.1
    color atomic, (cons_2_ret_BAQ00653.1 and not elem C)
    load data/wzy/alphafold/ADC54950.1/ranked_0.pdb, 2_ret_ADC54950.1
    color 0xeeeeee, 2_ret_ADC54950.1
    cealign 2_ret_BAQ00653.1, 2_ret_ADC54950.1
    label n. CA and resi 249 and 2_ret_ADC54950.1, "%s" % (resn)
label n. CA and resi 305 and 2_ret_ADC54950.1, "%s" % (resn)
select cons_2_ret_ADC54950.1, resi 249 and 2_ret_ADC54950.1 or resi 305 and 2_ret_ADC54950.1
show licorice, cons_2_ret_ADC54950.1
    color atomic, (cons_2_ret_ADC54950.1 and not elem C)
    load data/wzy/alphafold/AAZ85718.1/ranked_0.pdb, 2_ret_AAZ85718.1
    color 0xeeeeee, 2_ret_AAZ85718.1
    cealign 2_ret_BAQ00653.1, 2_ret_AAZ85718.1
    label n. CA and resi 269 and 2_ret_AAZ85718.1, "%s" % (resn)
label n. CA and resi 329 and 2_ret_AAZ85718.1, "%s" % (resn)
select cons_2_ret_AAZ85718.1, resi 269 and 2_ret_AAZ85718.1 or resi 329 and 2_ret_AAZ85718.1
show licorice, cons_2_ret_AAZ85718.1
    color atomic, (cons_2_ret_AAZ85718.1 and not elem C)
    load data/wzy/alphafold/CDF66396.1/ranked_0.pdb, 9_ret_CDF66396.1
    color 0xeeeeee, 9_ret_CDF66396.1
    cealign ECA-Pol_ACH50550.1, 9_ret_CDF66396.1
    label n. CA and resi 168 and 9_ret_CDF66396.1, "%s" % (resn)
label n. CA and resi 171 and 9_ret_CDF66396.1, "%s" % (resn)
label n. CA and resi 185 and 9_ret_CDF66396.1, "%s" % (resn)
label n. CA and resi 228 and 9_ret_CDF66396.1, "%s" % (resn)
label n. CA and resi 284 and 9_ret_CDF66396.1, "%s" % (resn)
label n. CA and resi 345 and 9_ret_CDF66396.1, "%s" % (resn)
select cons_9_ret_CDF66396.1, resi 168 and 9_ret_CDF66396.1 or resi 171 and 9_ret_CDF66396.1 or resi 185 and 9_ret_CDF66396.1 or resi 228 and 9_ret_CDF66396.1 or resi 284 and 9_ret_CDF66396.1 or resi 345 and 9_ret_CDF66396.1
show licorice, cons_9_ret_CDF66396.1
    color atomic, (cons_9_ret_CDF66396.1 and not elem C)
    load data/wzy/alphafold/AAA97573.1/ranked_0.pdb, 9_ret_AAA97573.1
    color 0xeeeeee, 9_ret_AAA97573.1
    cealign 9_ret_CDF66396.1, 9_ret_AAA97573.1
    label n. CA and resi 173 and 9_ret_AAA97573.1, "%s" % (resn)
label n. CA and resi 176 and 9_ret_AAA97573.1, "%s" % (resn)
label n. CA and resi 191 and 9_ret_AAA97573.1, "%s" % (resn)
label n. CA and resi 234 and 9_ret_AAA97573.1, "%s" % (resn)
label n. CA and resi 291 and 9_ret_AAA97573.1, "%s" % (resn)
label n. CA and resi 349 and 9_ret_AAA97573.1, "%s" % (resn)
select cons_9_ret_AAA97573.1, resi 173 and 9_ret_AAA97573.1 or resi 176 and 9_ret_AAA97573.1 or resi 191 and 9_ret_AAA97573.1 or resi 234 and 9_ret_AAA97573.1 or resi 291 and 9_ret_AAA97573.1 or resi 349 and 9_ret_AAA97573.1
show licorice, cons_9_ret_AAA97573.1
    color atomic, (cons_9_ret_AAA97573.1 and not elem C)
    load data/wzy/alphafold/AAC45857.1/ranked_0.pdb, 9_ret_AAC45857.1
    color 0xeeeeee, 9_ret_AAC45857.1
    cealign 9_ret_CDF66396.1, 9_ret_AAC45857.1
    label n. CA and resi 173 and 9_ret_AAC45857.1, "%s" % (resn)
label n. CA and resi 176 and 9_ret_AAC45857.1, "%s" % (resn)
label n. CA and resi 191 and 9_ret_AAC45857.1, "%s" % (resn)
label n. CA and resi 234 and 9_ret_AAC45857.1, "%s" % (resn)
label n. CA and resi 291 and 9_ret_AAC45857.1, "%s" % (resn)
label n. CA and resi 349 and 9_ret_AAC45857.1, "%s" % (resn)
select cons_9_ret_AAC45857.1, resi 173 and 9_ret_AAC45857.1 or resi 176 and 9_ret_AAC45857.1 or resi 191 and 9_ret_AAC45857.1 or resi 234 and 9_ret_AAC45857.1 or resi 291 and 9_ret_AAC45857.1 or resi 349 and 9_ret_AAC45857.1
show licorice, cons_9_ret_AAC45857.1
    color atomic, (cons_9_ret_AAC45857.1 and not elem C)
    load data/wzy/alphafold/BAQ00795.1/ranked_0.pdb, 5_inv_BAQ00795.1
    color 0xeeeeee, 5_inv_BAQ00795.1
    cealign 6bar, 5_inv_BAQ00795.1
    label n. CA and resi 213 and 5_inv_BAQ00795.1, "%s" % (resn)
label n. CA and resi 276 and 5_inv_BAQ00795.1, "%s" % (resn)
label n. CA and resi 308 and 5_inv_BAQ00795.1, "%s" % (resn)
label n. CA and resi 312 and 5_inv_BAQ00795.1, "%s" % (resn)
label n. CA and resi 317 and 5_inv_BAQ00795.1, "%s" % (resn)
label n. CA and resi 366 and 5_inv_BAQ00795.1, "%s" % (resn)
select cons_5_inv_BAQ00795.1, resi 213 and 5_inv_BAQ00795.1 or resi 276 and 5_inv_BAQ00795.1 or resi 308 and 5_inv_BAQ00795.1 or resi 312 and 5_inv_BAQ00795.1 or resi 317 and 5_inv_BAQ00795.1 or resi 366 and 5_inv_BAQ00795.1
show licorice, cons_5_inv_BAQ00795.1
    color atomic, (cons_5_inv_BAQ00795.1 and not elem C)
    load data/wzy/alphafold/BAQ01659.1/ranked_0.pdb, 5_inv_BAQ01659.1
    color 0xeeeeee, 5_inv_BAQ01659.1
    cealign 5_inv_BAQ00795.1, 5_inv_BAQ01659.1
    label n. CA and resi 211 and 5_inv_BAQ01659.1, "%s" % (resn)
label n. CA and resi 279 and 5_inv_BAQ01659.1, "%s" % (resn)
label n. CA and resi 315 and 5_inv_BAQ01659.1, "%s" % (resn)
label n. CA and resi 367 and 5_inv_BAQ01659.1, "%s" % (resn)
select cons_5_inv_BAQ01659.1, resi 211 and 5_inv_BAQ01659.1 or resi 279 and 5_inv_BAQ01659.1 or resi 315 and 5_inv_BAQ01659.1 or resi 367 and 5_inv_BAQ01659.1
show licorice, cons_5_inv_BAQ01659.1
    color atomic, (cons_5_inv_BAQ01659.1 and not elem C)
    load data/wzy/alphafold/BAQ02088.1/ranked_0.pdb, 5_inv_BAQ02088.1
    color 0xeeeeee, 5_inv_BAQ02088.1
    cealign 5_inv_BAQ00795.1, 5_inv_BAQ02088.1
    label n. CA and resi 228 and 5_inv_BAQ02088.1, "%s" % (resn)
label n. CA and resi 307 and 5_inv_BAQ02088.1, "%s" % (resn)
label n. CA and resi 339 and 5_inv_BAQ02088.1, "%s" % (resn)
label n. CA and resi 343 and 5_inv_BAQ02088.1, "%s" % (resn)
label n. CA and resi 348 and 5_inv_BAQ02088.1, "%s" % (resn)
label n. CA and resi 395 and 5_inv_BAQ02088.1, "%s" % (resn)
select cons_5_inv_BAQ02088.1, resi 228 and 5_inv_BAQ02088.1 or resi 307 and 5_inv_BAQ02088.1 or resi 339 and 5_inv_BAQ02088.1 or resi 343 and 5_inv_BAQ02088.1 or resi 348 and 5_inv_BAQ02088.1 or resi 395 and 5_inv_BAQ02088.1
show licorice, cons_5_inv_BAQ02088.1
    color atomic, (cons_5_inv_BAQ02088.1 and not elem C)
    load data/wzy/alphafold/ACA24754.1/ranked_0.pdb, 5_inv_ACA24754.1
    color 0xeeeeee, 5_inv_ACA24754.1
    cealign 5_inv_BAQ00795.1, 5_inv_ACA24754.1
    label n. CA and resi 217 and 5_inv_ACA24754.1, "%s" % (resn)
label n. CA and resi 294 and 5_inv_ACA24754.1, "%s" % (resn)
select cons_5_inv_ACA24754.1, resi 217 and 5_inv_ACA24754.1 or resi 294 and 5_inv_ACA24754.1
show licorice, cons_5_inv_ACA24754.1
    color atomic, (cons_5_inv_ACA24754.1 and not elem C)
    load data/wzy/alphafold/ACD37165.1/ranked_0.pdb, 4_inv_ACD37165.1
    color 0xeeeeee, 4_inv_ACD37165.1
    cealign 6bar, 4_inv_ACD37165.1
    label n. CA and resi 206 and 4_inv_ACD37165.1, "%s" % (resn)
label n. CA and resi 258 and 4_inv_ACD37165.1, "%s" % (resn)
label n. CA and resi 291 and 4_inv_ACD37165.1, "%s" % (resn)
label n. CA and resi 346 and 4_inv_ACD37165.1, "%s" % (resn)
select cons_4_inv_ACD37165.1, resi 206 and 4_inv_ACD37165.1 or resi 258 and 4_inv_ACD37165.1 or resi 291 and 4_inv_ACD37165.1 or resi 346 and 4_inv_ACD37165.1
show licorice, cons_4_inv_ACD37165.1
    color atomic, (cons_4_inv_ACD37165.1 and not elem C)
    load data/wzy/alphafold/AAM27615.1/ranked_0.pdb, 4_inv_AAM27615.1
    color 0xeeeeee, 4_inv_AAM27615.1
    cealign 4_inv_ACD37165.1, 4_inv_AAM27615.1
    label n. CA and resi 188 and 4_inv_AAM27615.1, "%s" % (resn)
label n. CA and resi 260 and 4_inv_AAM27615.1, "%s" % (resn)
label n. CA and resi 298 and 4_inv_AAM27615.1, "%s" % (resn)
label n. CA and resi 357 and 4_inv_AAM27615.1, "%s" % (resn)
select cons_4_inv_AAM27615.1, resi 188 and 4_inv_AAM27615.1 or resi 260 and 4_inv_AAM27615.1 or resi 298 and 4_inv_AAM27615.1 or resi 357 and 4_inv_AAM27615.1
show licorice, cons_4_inv_AAM27615.1
    color atomic, (cons_4_inv_AAM27615.1 and not elem C)
    load data/wzy/alphafold/CBN82200.1/ranked_0.pdb, 14_ret_CBN82200.1
    color 0xeeeeee, 14_ret_CBN82200.1
    cealign ECA-Pol_ACH50550.1, 14_ret_CBN82200.1
    label n. CA and resi 211 and 14_ret_CBN82200.1, "%s" % (resn)
label n. CA and resi 270 and 14_ret_CBN82200.1, "%s" % (resn)
select cons_14_ret_CBN82200.1, resi 211 and 14_ret_CBN82200.1 or resi 270 and 14_ret_CBN82200.1
show licorice, cons_14_ret_CBN82200.1
    color atomic, (cons_14_ret_CBN82200.1 and not elem C)
    load data/wzy/alphafold/AAT77177.1/ranked_0.pdb, 14_ret_AAT77177.1
    color 0xeeeeee, 14_ret_AAT77177.1
    cealign 14_ret_CBN82200.1, 14_ret_AAT77177.1
    label n. CA and resi 226 and 14_ret_AAT77177.1, "%s" % (resn)
label n. CA and resi 284 and 14_ret_AAT77177.1, "%s" % (resn)
select cons_14_ret_AAT77177.1, resi 226 and 14_ret_AAT77177.1 or resi 284 and 14_ret_AAT77177.1
show licorice, cons_14_ret_AAT77177.1
    color atomic, (cons_14_ret_AAT77177.1 and not elem C)
    load data/wzy/alphafold/CAI34124.1/ranked_0.pdb, 28_inv_CAI34124.1
    color 0xeeeeee, 28_inv_CAI34124.1
    cealign 6bar, 28_inv_CAI34124.1
    label n. CA and resi 267 and 28_inv_CAI34124.1, "%s" % (resn)
label n. CA and resi 301 and 28_inv_CAI34124.1, "%s" % (resn)
label n. CA and resi 304 and 28_inv_CAI34124.1, "%s" % (resn)
label n. CA and resi 325 and 28_inv_CAI34124.1, "%s" % (resn)
select cons_28_inv_CAI34124.1, resi 267 and 28_inv_CAI34124.1 or resi 301 and 28_inv_CAI34124.1 or resi 304 and 28_inv_CAI34124.1 or resi 325 and 28_inv_CAI34124.1
show licorice, cons_28_inv_CAI34124.1
    color atomic, (cons_28_inv_CAI34124.1 and not elem C)
    load data/wzy/alphafold/AHB32490.1/ranked_0.pdb, 6_ret_AHB32490.1
    color 0xeeeeee, 6_ret_AHB32490.1
    cealign ECA-Pol_ACH50550.1, 6_ret_AHB32490.1
    label n. CA and resi 175 and 6_ret_AHB32490.1, "%s" % (resn)
label n. CA and resi 238 and 6_ret_AHB32490.1, "%s" % (resn)
label n. CA and resi 287 and 6_ret_AHB32490.1, "%s" % (resn)
label n. CA and resi 429 and 6_ret_AHB32490.1, "%s" % (resn)
select cons_6_ret_AHB32490.1, resi 175 and 6_ret_AHB32490.1 or resi 238 and 6_ret_AHB32490.1 or resi 287 and 6_ret_AHB32490.1 or resi 429 and 6_ret_AHB32490.1
show licorice, cons_6_ret_AHB32490.1
    color atomic, (cons_6_ret_AHB32490.1 and not elem C)
    load data/wzy/alphafold/CAI32772.1/ranked_0.pdb, 6_ret_CAI32772.1
    color 0xeeeeee, 6_ret_CAI32772.1
    cealign 6_ret_AHB32490.1, 6_ret_CAI32772.1
    label n. CA and resi 184 and 6_ret_CAI32772.1, "%s" % (resn)
label n. CA and resi 242 and 6_ret_CAI32772.1, "%s" % (resn)
label n. CA and resi 290 and 6_ret_CAI32772.1, "%s" % (resn)
label n. CA and resi 441 and 6_ret_CAI32772.1, "%s" % (resn)
select cons_6_ret_CAI32772.1, resi 184 and 6_ret_CAI32772.1 or resi 242 and 6_ret_CAI32772.1 or resi 290 and 6_ret_CAI32772.1 or resi 441 and 6_ret_CAI32772.1
show licorice, cons_6_ret_CAI32772.1
    color atomic, (cons_6_ret_CAI32772.1 and not elem C)
    load data/wzy/alphafold/AHB32411.1/ranked_0.pdb, 29_ret_AHB32411.1
    color 0xeeeeee, 29_ret_AHB32411.1
    cealign ECA-Pol_ACH50550.1, 29_ret_AHB32411.1
    label n. CA and resi 162 and 29_ret_AHB32411.1, "%s" % (resn)
label n. CA and resi 207 and 29_ret_AHB32411.1, "%s" % (resn)
label n. CA and resi 242 and 29_ret_AHB32411.1, "%s" % (resn)
label n. CA and resi 244 and 29_ret_AHB32411.1, "%s" % (resn)
label n. CA and resi 251 and 29_ret_AHB32411.1, "%s" % (resn)
select cons_29_ret_AHB32411.1, resi 162 and 29_ret_AHB32411.1 or resi 207 and 29_ret_AHB32411.1 or resi 242 and 29_ret_AHB32411.1 or resi 244 and 29_ret_AHB32411.1 or resi 251 and 29_ret_AHB32411.1
show licorice, cons_29_ret_AHB32411.1
    color atomic, (cons_29_ret_AHB32411.1 and not elem C)
    load data/wzy/alphafold/CAI34254.1/ranked_0.pdb, 30_inv_CAI34254.1
    color 0xeeeeee, 30_inv_CAI34254.1
    cealign 6bar, 30_inv_CAI34254.1
    label n. CA and resi 171 and 30_inv_CAI34254.1, "%s" % (resn)
label n. CA and resi 182 and 30_inv_CAI34254.1, "%s" % (resn)
label n. CA and resi 183 and 30_inv_CAI34254.1, "%s" % (resn)
label n. CA and resi 189 and 30_inv_CAI34254.1, "%s" % (resn)
label n. CA and resi 272 and 30_inv_CAI34254.1, "%s" % (resn)
label n. CA and resi 277 and 30_inv_CAI34254.1, "%s" % (resn)
label n. CA and resi 281 and 30_inv_CAI34254.1, "%s" % (resn)
select cons_30_inv_CAI34254.1, resi 171 and 30_inv_CAI34254.1 or resi 182 and 30_inv_CAI34254.1 or resi 183 and 30_inv_CAI34254.1 or resi 189 and 30_inv_CAI34254.1 or resi 272 and 30_inv_CAI34254.1 or resi 277 and 30_inv_CAI34254.1 or resi 281 and 30_inv_CAI34254.1
show licorice, cons_30_inv_CAI34254.1
    color atomic, (cons_30_inv_CAI34254.1 and not elem C)
    load data/wzy/alphafold/CAI34198.1/ranked_0.pdb, 30_inv_CAI34198.1
    color 0xeeeeee, 30_inv_CAI34198.1
    cealign 30_inv_CAI34254.1, 30_inv_CAI34198.1
    label n. CA and resi 171 and 30_inv_CAI34198.1, "%s" % (resn)
label n. CA and resi 182 and 30_inv_CAI34198.1, "%s" % (resn)
label n. CA and resi 183 and 30_inv_CAI34198.1, "%s" % (resn)
label n. CA and resi 189 and 30_inv_CAI34198.1, "%s" % (resn)
label n. CA and resi 273 and 30_inv_CAI34198.1, "%s" % (resn)
label n. CA and resi 278 and 30_inv_CAI34198.1, "%s" % (resn)
label n. CA and resi 282 and 30_inv_CAI34198.1, "%s" % (resn)
select cons_30_inv_CAI34198.1, resi 171 and 30_inv_CAI34198.1 or resi 182 and 30_inv_CAI34198.1 or resi 183 and 30_inv_CAI34198.1 or resi 189 and 30_inv_CAI34198.1 or resi 273 and 30_inv_CAI34198.1 or resi 278 and 30_inv_CAI34198.1 or resi 282 and 30_inv_CAI34198.1
show licorice, cons_30_inv_CAI34198.1
    color atomic, (cons_30_inv_CAI34198.1 and not elem C)
    load data/wzy/alphafold/CAI34217.1/ranked_0.pdb, 30_inv_CAI34217.1
    color 0xeeeeee, 30_inv_CAI34217.1
    cealign 30_inv_CAI34254.1, 30_inv_CAI34217.1
    label n. CA and resi 175 and 30_inv_CAI34217.1, "%s" % (resn)
label n. CA and resi 186 and 30_inv_CAI34217.1, "%s" % (resn)
label n. CA and resi 187 and 30_inv_CAI34217.1, "%s" % (resn)
label n. CA and resi 193 and 30_inv_CAI34217.1, "%s" % (resn)
label n. CA and resi 276 and 30_inv_CAI34217.1, "%s" % (resn)
label n. CA and resi 281 and 30_inv_CAI34217.1, "%s" % (resn)
label n. CA and resi 285 and 30_inv_CAI34217.1, "%s" % (resn)
select cons_30_inv_CAI34217.1, resi 175 and 30_inv_CAI34217.1 or resi 186 and 30_inv_CAI34217.1 or resi 187 and 30_inv_CAI34217.1 or resi 193 and 30_inv_CAI34217.1 or resi 276 and 30_inv_CAI34217.1 or resi 281 and 30_inv_CAI34217.1 or resi 285 and 30_inv_CAI34217.1
show licorice, cons_30_inv_CAI34217.1
    color atomic, (cons_30_inv_CAI34217.1 and not elem C)
    @src/pymol-visualization/nicify.pml
