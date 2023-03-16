
fetch 7tpg, 615_i_7TPG_O-Lig
select chain_B, chain B
hide cartoon, !chain_B
color 0xeeeeee, chain_B
select "cons_615_i_7TPG", resi 265 and chain_B or resi 191 and chain_B or resi 313 and chain_B
show licorice, cons_615_i_7TPG
color atomic, (cons_615_i_7TPG and not elem C)
@src/pymol-visualization/nicify.pml

load data/eca-pol/alphafold/ACH50550.1/ranked_0.pdb, 586_r_ACH50550.1
color 0xeeeeee, 586_r_ACH50550.1
label n. CA and resi 145 and 586_r_ACH50550.1, "%s-%s" % (resn, resi)
label n. CA and resi 204 and 586_r_ACH50550.1, "%s-%s" % (resn, resi)
label n. CA and resi 247 and 586_r_ACH50550.1, "%s-%s" % (resn, resi)
label n. CA and resi 248 and 586_r_ACH50550.1, "%s-%s" % (resn, resi)
label n. CA and resi 321 and 586_r_ACH50550.1, "%s-%s" % (resn, resi)
label n. CA and resi 336 and 586_r_ACH50550.1, "%s-%s" % (resn, resi)
label n. CA and resi 365 and 586_r_ACH50550.1, "%s-%s" % (resn, resi)
label n. CA and resi 399 and 586_r_ACH50550.1, "%s-%s" % (resn, resi)
select cons_586_r_ACH50550.1, resi 145 and 586_r_ACH50550.1 or resi 204 and 586_r_ACH50550.1 or resi 247 and 586_r_ACH50550.1 or resi 248 and 586_r_ACH50550.1 or resi 321 and 586_r_ACH50550.1 or resi 336 and 586_r_ACH50550.1 or resi 365 and 586_r_ACH50550.1 or resi 399 and 586_r_ACH50550.1
show licorice, cons_586_r_ACH50550.1
color atomic, (cons_586_r_ACH50550.1 and not elem C)
super 615_i_7TPG, 586_r_ACH50550.1
fetch 6BAR, 571_i_6BAR
color 0xeeeeee, 571_i_6BAR
label n. CA and resi 105 and 571_i_6BAR, "%s-%s" % (resn, resi)
label n. CA and resi 108 and 571_i_6BAR, "%s-%s" % (resn, resi)
label n. CA and resi 111 and 571_i_6BAR, "%s-%s" % (resn, resi)
label n. CA and resi 203 and 571_i_6BAR, "%s-%s" % (resn, resi)
label n. CA and resi 255 and 571_i_6BAR, "%s-%s" % (resn, resi)
label n. CA and resi 263 and 571_i_6BAR, "%s-%s" % (resn, resi)
label n. CA and resi 333 and 571_i_6BAR, "%s-%s" % (resn, resi)
select cons_571_i_6BAR, resi 105 and 571_i_6BAR or resi 108 and 571_i_6BAR or resi 111 and 571_i_6BAR or resi 203 and 571_i_6BAR or resi 255 and 571_i_6BAR or resi 263 and 571_i_6BAR or resi 333 and 571_i_6BAR
show licorice, cons_571_i_6BAR
color atomic, (cons_571_i_6BAR and not elem C)
super 615_i_7TPG, 571_i_6BAR

load data/wzy/alphafold/AHB32215.1/ranked_0.pdb, 617_i_AHB32215.1
    color 0xeeeeee, 617_i_AHB32215.1
    super 571_i_6BAR, 617_i_AHB32215.1
    label n. CA and resi 49 and 617_i_AHB32215.1, "%s-%s" % (resn, resi)
label n. CA and resi 53 and 617_i_AHB32215.1, "%s-%s" % (resn, resi)
label n. CA and resi 137 and 617_i_AHB32215.1, "%s-%s" % (resn, resi)
label n. CA and resi 171 and 617_i_AHB32215.1, "%s-%s" % (resn, resi)
label n. CA and resi 219 and 617_i_AHB32215.1, "%s-%s" % (resn, resi)
label n. CA and resi 283 and 617_i_AHB32215.1, "%s-%s" % (resn, resi)
select cons_617_i_AHB32215.1, resi 49 and 617_i_AHB32215.1 or resi 53 and 617_i_AHB32215.1 or resi 137 and 617_i_AHB32215.1 or resi 171 and 617_i_AHB32215.1 or resi 219 and 617_i_AHB32215.1 or resi 283 and 617_i_AHB32215.1
show licorice, cons_617_i_AHB32215.1
    color atomic, (cons_617_i_AHB32215.1 and not elem C)
    load data/wzy/alphafold/AHB32334.1/ranked_0.pdb, 617_i_AHB32334.1
    color 0xeeeeee, 617_i_AHB32334.1
    super 617_i_AHB32215.1, 617_i_AHB32334.1
    label n. CA and resi 33 and 617_i_AHB32334.1, "%s-%s" % (resn, resi)
label n. CA and resi 37 and 617_i_AHB32334.1, "%s-%s" % (resn, resi)
label n. CA and resi 126 and 617_i_AHB32334.1, "%s-%s" % (resn, resi)
label n. CA and resi 161 and 617_i_AHB32334.1, "%s-%s" % (resn, resi)
label n. CA and resi 219 and 617_i_AHB32334.1, "%s-%s" % (resn, resi)
label n. CA and resi 284 and 617_i_AHB32334.1, "%s-%s" % (resn, resi)
select cons_617_i_AHB32334.1, resi 33 and 617_i_AHB32334.1 or resi 37 and 617_i_AHB32334.1 or resi 126 and 617_i_AHB32334.1 or resi 161 and 617_i_AHB32334.1 or resi 219 and 617_i_AHB32334.1 or resi 284 and 617_i_AHB32334.1
show licorice, cons_617_i_AHB32334.1
    color atomic, (cons_617_i_AHB32334.1 and not elem C)
    load data/wzy/alphafold/AHB32861.1/ranked_0.pdb, 617_i_AHB32861.1
    color 0xeeeeee, 617_i_AHB32861.1
    super 617_i_AHB32215.1, 617_i_AHB32861.1
    label n. CA and resi 48 and 617_i_AHB32861.1, "%s-%s" % (resn, resi)
label n. CA and resi 52 and 617_i_AHB32861.1, "%s-%s" % (resn, resi)
label n. CA and resi 136 and 617_i_AHB32861.1, "%s-%s" % (resn, resi)
label n. CA and resi 170 and 617_i_AHB32861.1, "%s-%s" % (resn, resi)
label n. CA and resi 221 and 617_i_AHB32861.1, "%s-%s" % (resn, resi)
label n. CA and resi 287 and 617_i_AHB32861.1, "%s-%s" % (resn, resi)
select cons_617_i_AHB32861.1, resi 48 and 617_i_AHB32861.1 or resi 52 and 617_i_AHB32861.1 or resi 136 and 617_i_AHB32861.1 or resi 170 and 617_i_AHB32861.1 or resi 221 and 617_i_AHB32861.1 or resi 287 and 617_i_AHB32861.1
show licorice, cons_617_i_AHB32861.1
    color atomic, (cons_617_i_AHB32861.1 and not elem C)
    load data/wzy/alphafold/CAI34008.1/ranked_0.pdb, 617_i_CAI34008.1
    color 0xeeeeee, 617_i_CAI34008.1
    super 617_i_AHB32215.1, 617_i_CAI34008.1
    label n. CA and resi 51 and 617_i_CAI34008.1, "%s-%s" % (resn, resi)
label n. CA and resi 55 and 617_i_CAI34008.1, "%s-%s" % (resn, resi)
label n. CA and resi 153 and 617_i_CAI34008.1, "%s-%s" % (resn, resi)
label n. CA and resi 187 and 617_i_CAI34008.1, "%s-%s" % (resn, resi)
label n. CA and resi 254 and 617_i_CAI34008.1, "%s-%s" % (resn, resi)
label n. CA and resi 315 and 617_i_CAI34008.1, "%s-%s" % (resn, resi)
select cons_617_i_CAI34008.1, resi 51 and 617_i_CAI34008.1 or resi 55 and 617_i_CAI34008.1 or resi 153 and 617_i_CAI34008.1 or resi 187 and 617_i_CAI34008.1 or resi 254 and 617_i_CAI34008.1 or resi 315 and 617_i_CAI34008.1
show licorice, cons_617_i_CAI34008.1
    color atomic, (cons_617_i_CAI34008.1 and not elem C)
    load data/wzy/alphafold/ACH97162.1/ranked_0.pdb, 617_i_ACH97162.1
    color 0xeeeeee, 617_i_ACH97162.1
    super 617_i_AHB32215.1, 617_i_ACH97162.1
    label n. CA and resi 51 and 617_i_ACH97162.1, "%s-%s" % (resn, resi)
label n. CA and resi 55 and 617_i_ACH97162.1, "%s-%s" % (resn, resi)
label n. CA and resi 142 and 617_i_ACH97162.1, "%s-%s" % (resn, resi)
label n. CA and resi 176 and 617_i_ACH97162.1, "%s-%s" % (resn, resi)
label n. CA and resi 234 and 617_i_ACH97162.1, "%s-%s" % (resn, resi)
label n. CA and resi 301 and 617_i_ACH97162.1, "%s-%s" % (resn, resi)
select cons_617_i_ACH97162.1, resi 51 and 617_i_ACH97162.1 or resi 55 and 617_i_ACH97162.1 or resi 142 and 617_i_ACH97162.1 or resi 176 and 617_i_ACH97162.1 or resi 234 and 617_i_ACH97162.1 or resi 301 and 617_i_ACH97162.1
show licorice, cons_617_i_ACH97162.1
    color atomic, (cons_617_i_ACH97162.1 and not elem C)
    load data/wzy/alphafold/CAI33309.1/ranked_0.pdb, 613_i_CAI33309.1
    color 0xeeeeee, 613_i_CAI33309.1
    super 571_i_6BAR, 613_i_CAI33309.1
    label n. CA and resi 150 and 613_i_CAI33309.1, "%s-%s" % (resn, resi)
label n. CA and resi 266 and 613_i_CAI33309.1, "%s-%s" % (resn, resi)
label n. CA and resi 304 and 613_i_CAI33309.1, "%s-%s" % (resn, resi)
select cons_613_i_CAI33309.1, resi 150 and 613_i_CAI33309.1 or resi 266 and 613_i_CAI33309.1 or resi 304 and 613_i_CAI33309.1
show licorice, cons_613_i_CAI33309.1
    color atomic, (cons_613_i_CAI33309.1 and not elem C)
    load data/wzy/alphafold/CAI34369.1/ranked_0.pdb, 613_i_CAI34369.1
    color 0xeeeeee, 613_i_CAI34369.1
    super 613_i_CAI33309.1, 613_i_CAI34369.1
    label n. CA and resi 151 and 613_i_CAI34369.1, "%s-%s" % (resn, resi)
label n. CA and resi 268 and 613_i_CAI34369.1, "%s-%s" % (resn, resi)
label n. CA and resi 308 and 613_i_CAI34369.1, "%s-%s" % (resn, resi)
select cons_613_i_CAI34369.1, resi 151 and 613_i_CAI34369.1 or resi 268 and 613_i_CAI34369.1 or resi 308 and 613_i_CAI34369.1
show licorice, cons_613_i_CAI34369.1
    color atomic, (cons_613_i_CAI34369.1 and not elem C)
    load data/wzy/alphafold/AIG62747.1/ranked_0.pdb, 613_i_AIG62747.1
    color 0xeeeeee, 613_i_AIG62747.1
    super 613_i_CAI33309.1, 613_i_AIG62747.1
    label n. CA and resi 134 and 613_i_AIG62747.1, "%s-%s" % (resn, resi)
label n. CA and resi 250 and 613_i_AIG62747.1, "%s-%s" % (resn, resi)
label n. CA and resi 280 and 613_i_AIG62747.1, "%s-%s" % (resn, resi)
select cons_613_i_AIG62747.1, resi 134 and 613_i_AIG62747.1 or resi 250 and 613_i_AIG62747.1 or resi 280 and 613_i_AIG62747.1
show licorice, cons_613_i_AIG62747.1
    color atomic, (cons_613_i_AIG62747.1 and not elem C)
    load data/wzy/alphafold/BAQ00653.1/ranked_0.pdb, 612_r_BAQ00653.1
    color 0xeeeeee, 612_r_BAQ00653.1
    super 586_r_ACH50550.1, 612_r_BAQ00653.1
    label n. CA and resi 246 and 612_r_BAQ00653.1, "%s-%s" % (resn, resi)
label n. CA and resi 301 and 612_r_BAQ00653.1, "%s-%s" % (resn, resi)
select cons_612_r_BAQ00653.1, resi 246 and 612_r_BAQ00653.1 or resi 301 and 612_r_BAQ00653.1
show licorice, cons_612_r_BAQ00653.1
    color atomic, (cons_612_r_BAQ00653.1 and not elem C)
    load data/wzy/alphafold/ADC54950.1/ranked_0.pdb, 612_r_ADC54950.1
    color 0xeeeeee, 612_r_ADC54950.1
    super 612_r_BAQ00653.1, 612_r_ADC54950.1
    label n. CA and resi 249 and 612_r_ADC54950.1, "%s-%s" % (resn, resi)
label n. CA and resi 305 and 612_r_ADC54950.1, "%s-%s" % (resn, resi)
select cons_612_r_ADC54950.1, resi 249 and 612_r_ADC54950.1 or resi 305 and 612_r_ADC54950.1
show licorice, cons_612_r_ADC54950.1
    color atomic, (cons_612_r_ADC54950.1 and not elem C)
    load data/wzy/alphafold/AAZ85718.1/ranked_0.pdb, 612_r_AAZ85718.1
    color 0xeeeeee, 612_r_AAZ85718.1
    super 612_r_BAQ00653.1, 612_r_AAZ85718.1
    label n. CA and resi 269 and 612_r_AAZ85718.1, "%s-%s" % (resn, resi)
label n. CA and resi 329 and 612_r_AAZ85718.1, "%s-%s" % (resn, resi)
select cons_612_r_AAZ85718.1, resi 269 and 612_r_AAZ85718.1 or resi 329 and 612_r_AAZ85718.1
show licorice, cons_612_r_AAZ85718.1
    color atomic, (cons_612_r_AAZ85718.1 and not elem C)
    load data/wzy/alphafold/CDF66396.1/ranked_0.pdb, 611_r_CDF66396.1
    color 0xeeeeee, 611_r_CDF66396.1
    super 586_r_ACH50550.1, 611_r_CDF66396.1
    label n. CA and resi 168 and 611_r_CDF66396.1, "%s-%s" % (resn, resi)
label n. CA and resi 171 and 611_r_CDF66396.1, "%s-%s" % (resn, resi)
label n. CA and resi 185 and 611_r_CDF66396.1, "%s-%s" % (resn, resi)
label n. CA and resi 228 and 611_r_CDF66396.1, "%s-%s" % (resn, resi)
label n. CA and resi 284 and 611_r_CDF66396.1, "%s-%s" % (resn, resi)
label n. CA and resi 345 and 611_r_CDF66396.1, "%s-%s" % (resn, resi)
select cons_611_r_CDF66396.1, resi 168 and 611_r_CDF66396.1 or resi 171 and 611_r_CDF66396.1 or resi 185 and 611_r_CDF66396.1 or resi 228 and 611_r_CDF66396.1 or resi 284 and 611_r_CDF66396.1 or resi 345 and 611_r_CDF66396.1
show licorice, cons_611_r_CDF66396.1
    color atomic, (cons_611_r_CDF66396.1 and not elem C)
    load data/wzy/alphafold/AAA97573.1/ranked_0.pdb, 611_r_AAA97573.1
    color 0xeeeeee, 611_r_AAA97573.1
    super 611_r_CDF66396.1, 611_r_AAA97573.1
    label n. CA and resi 173 and 611_r_AAA97573.1, "%s-%s" % (resn, resi)
label n. CA and resi 176 and 611_r_AAA97573.1, "%s-%s" % (resn, resi)
label n. CA and resi 191 and 611_r_AAA97573.1, "%s-%s" % (resn, resi)
label n. CA and resi 234 and 611_r_AAA97573.1, "%s-%s" % (resn, resi)
label n. CA and resi 291 and 611_r_AAA97573.1, "%s-%s" % (resn, resi)
label n. CA and resi 349 and 611_r_AAA97573.1, "%s-%s" % (resn, resi)
select cons_611_r_AAA97573.1, resi 173 and 611_r_AAA97573.1 or resi 176 and 611_r_AAA97573.1 or resi 191 and 611_r_AAA97573.1 or resi 234 and 611_r_AAA97573.1 or resi 291 and 611_r_AAA97573.1 or resi 349 and 611_r_AAA97573.1
show licorice, cons_611_r_AAA97573.1
    color atomic, (cons_611_r_AAA97573.1 and not elem C)
    load data/wzy/alphafold/AAC45857.1/ranked_0.pdb, 611_r_AAC45857.1
    color 0xeeeeee, 611_r_AAC45857.1
    super 611_r_CDF66396.1, 611_r_AAC45857.1
    label n. CA and resi 173 and 611_r_AAC45857.1, "%s-%s" % (resn, resi)
label n. CA and resi 176 and 611_r_AAC45857.1, "%s-%s" % (resn, resi)
label n. CA and resi 191 and 611_r_AAC45857.1, "%s-%s" % (resn, resi)
label n. CA and resi 234 and 611_r_AAC45857.1, "%s-%s" % (resn, resi)
label n. CA and resi 291 and 611_r_AAC45857.1, "%s-%s" % (resn, resi)
label n. CA and resi 349 and 611_r_AAC45857.1, "%s-%s" % (resn, resi)
select cons_611_r_AAC45857.1, resi 173 and 611_r_AAC45857.1 or resi 176 and 611_r_AAC45857.1 or resi 191 and 611_r_AAC45857.1 or resi 234 and 611_r_AAC45857.1 or resi 291 and 611_r_AAC45857.1 or resi 349 and 611_r_AAC45857.1
show licorice, cons_611_r_AAC45857.1
    color atomic, (cons_611_r_AAC45857.1 and not elem C)
    load data/wzy/alphafold/BAQ00795.1/ranked_0.pdb, 605_i_BAQ00795.1
    color 0xeeeeee, 605_i_BAQ00795.1
    super 571_i_6BAR, 605_i_BAQ00795.1
    label n. CA and resi 213 and 605_i_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 276 and 605_i_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 308 and 605_i_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 312 and 605_i_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 317 and 605_i_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 366 and 605_i_BAQ00795.1, "%s-%s" % (resn, resi)
select cons_605_i_BAQ00795.1, resi 213 and 605_i_BAQ00795.1 or resi 276 and 605_i_BAQ00795.1 or resi 308 and 605_i_BAQ00795.1 or resi 312 and 605_i_BAQ00795.1 or resi 317 and 605_i_BAQ00795.1 or resi 366 and 605_i_BAQ00795.1
show licorice, cons_605_i_BAQ00795.1
    color atomic, (cons_605_i_BAQ00795.1 and not elem C)
    load data/wzy/alphafold/BAQ01659.1/ranked_0.pdb, 605_i_BAQ01659.1
    color 0xeeeeee, 605_i_BAQ01659.1
    super 605_i_BAQ00795.1, 605_i_BAQ01659.1
    label n. CA and resi 211 and 605_i_BAQ01659.1, "%s-%s" % (resn, resi)
label n. CA and resi 279 and 605_i_BAQ01659.1, "%s-%s" % (resn, resi)
label n. CA and resi 315 and 605_i_BAQ01659.1, "%s-%s" % (resn, resi)
label n. CA and resi 367 and 605_i_BAQ01659.1, "%s-%s" % (resn, resi)
select cons_605_i_BAQ01659.1, resi 211 and 605_i_BAQ01659.1 or resi 279 and 605_i_BAQ01659.1 or resi 315 and 605_i_BAQ01659.1 or resi 367 and 605_i_BAQ01659.1
show licorice, cons_605_i_BAQ01659.1
    color atomic, (cons_605_i_BAQ01659.1 and not elem C)
    load data/wzy/alphafold/BAQ02088.1/ranked_0.pdb, 605_i_BAQ02088.1
    color 0xeeeeee, 605_i_BAQ02088.1
    super 605_i_BAQ00795.1, 605_i_BAQ02088.1
    label n. CA and resi 228 and 605_i_BAQ02088.1, "%s-%s" % (resn, resi)
label n. CA and resi 307 and 605_i_BAQ02088.1, "%s-%s" % (resn, resi)
label n. CA and resi 339 and 605_i_BAQ02088.1, "%s-%s" % (resn, resi)
label n. CA and resi 343 and 605_i_BAQ02088.1, "%s-%s" % (resn, resi)
label n. CA and resi 348 and 605_i_BAQ02088.1, "%s-%s" % (resn, resi)
label n. CA and resi 395 and 605_i_BAQ02088.1, "%s-%s" % (resn, resi)
select cons_605_i_BAQ02088.1, resi 228 and 605_i_BAQ02088.1 or resi 307 and 605_i_BAQ02088.1 or resi 339 and 605_i_BAQ02088.1 or resi 343 and 605_i_BAQ02088.1 or resi 348 and 605_i_BAQ02088.1 or resi 395 and 605_i_BAQ02088.1
show licorice, cons_605_i_BAQ02088.1
    color atomic, (cons_605_i_BAQ02088.1 and not elem C)
    load data/wzy/alphafold/ACA24754.1/ranked_0.pdb, 605_i_ACA24754.1
    color 0xeeeeee, 605_i_ACA24754.1
    super 605_i_BAQ00795.1, 605_i_ACA24754.1
    label n. CA and resi 217 and 605_i_ACA24754.1, "%s-%s" % (resn, resi)
label n. CA and resi 294 and 605_i_ACA24754.1, "%s-%s" % (resn, resi)
select cons_605_i_ACA24754.1, resi 217 and 605_i_ACA24754.1 or resi 294 and 605_i_ACA24754.1
show licorice, cons_605_i_ACA24754.1
    color atomic, (cons_605_i_ACA24754.1 and not elem C)
    load data/wzy/alphafold/ACD37165.1/ranked_0.pdb, 614_i_ACD37165.1
    color 0xeeeeee, 614_i_ACD37165.1
    super 571_i_6BAR, 614_i_ACD37165.1
    label n. CA and resi 206 and 614_i_ACD37165.1, "%s-%s" % (resn, resi)
label n. CA and resi 258 and 614_i_ACD37165.1, "%s-%s" % (resn, resi)
label n. CA and resi 291 and 614_i_ACD37165.1, "%s-%s" % (resn, resi)
label n. CA and resi 346 and 614_i_ACD37165.1, "%s-%s" % (resn, resi)
select cons_614_i_ACD37165.1, resi 206 and 614_i_ACD37165.1 or resi 258 and 614_i_ACD37165.1 or resi 291 and 614_i_ACD37165.1 or resi 346 and 614_i_ACD37165.1
show licorice, cons_614_i_ACD37165.1
    color atomic, (cons_614_i_ACD37165.1 and not elem C)
    load data/wzy/alphafold/AAM27615.1/ranked_0.pdb, 614_i_AAM27615.1
    color 0xeeeeee, 614_i_AAM27615.1
    super 614_i_ACD37165.1, 614_i_AAM27615.1
    label n. CA and resi 188 and 614_i_AAM27615.1, "%s-%s" % (resn, resi)
label n. CA and resi 260 and 614_i_AAM27615.1, "%s-%s" % (resn, resi)
label n. CA and resi 298 and 614_i_AAM27615.1, "%s-%s" % (resn, resi)
label n. CA and resi 357 and 614_i_AAM27615.1, "%s-%s" % (resn, resi)
select cons_614_i_AAM27615.1, resi 188 and 614_i_AAM27615.1 or resi 260 and 614_i_AAM27615.1 or resi 298 and 614_i_AAM27615.1 or resi 357 and 614_i_AAM27615.1
show licorice, cons_614_i_AAM27615.1
    color atomic, (cons_614_i_AAM27615.1 and not elem C)
    load data/wzy/alphafold/CBN82200.1/ranked_0.pdb, 606_r_CBN82200.1
    color 0xeeeeee, 606_r_CBN82200.1
    super 586_r_ACH50550.1, 606_r_CBN82200.1
    label n. CA and resi 211 and 606_r_CBN82200.1, "%s-%s" % (resn, resi)
label n. CA and resi 270 and 606_r_CBN82200.1, "%s-%s" % (resn, resi)
select cons_606_r_CBN82200.1, resi 211 and 606_r_CBN82200.1 or resi 270 and 606_r_CBN82200.1
show licorice, cons_606_r_CBN82200.1
    color atomic, (cons_606_r_CBN82200.1 and not elem C)
    load data/wzy/alphafold/AAT77177.1/ranked_0.pdb, 606_r_AAT77177.1
    color 0xeeeeee, 606_r_AAT77177.1
    super 606_r_CBN82200.1, 606_r_AAT77177.1
    label n. CA and resi 226 and 606_r_AAT77177.1, "%s-%s" % (resn, resi)
label n. CA and resi 284 and 606_r_AAT77177.1, "%s-%s" % (resn, resi)
select cons_606_r_AAT77177.1, resi 226 and 606_r_AAT77177.1 or resi 284 and 606_r_AAT77177.1
show licorice, cons_606_r_AAT77177.1
    color atomic, (cons_606_r_AAT77177.1 and not elem C)
    load data/wzy/alphafold/CAI34124.1/ranked_0.pdb, 607_i_CAI34124.1
    color 0xeeeeee, 607_i_CAI34124.1
    super 571_i_6BAR, 607_i_CAI34124.1
    label n. CA and resi 267 and 607_i_CAI34124.1, "%s-%s" % (resn, resi)
label n. CA and resi 301 and 607_i_CAI34124.1, "%s-%s" % (resn, resi)
label n. CA and resi 304 and 607_i_CAI34124.1, "%s-%s" % (resn, resi)
label n. CA and resi 325 and 607_i_CAI34124.1, "%s-%s" % (resn, resi)
select cons_607_i_CAI34124.1, resi 267 and 607_i_CAI34124.1 or resi 301 and 607_i_CAI34124.1 or resi 304 and 607_i_CAI34124.1 or resi 325 and 607_i_CAI34124.1
show licorice, cons_607_i_CAI34124.1
    color atomic, (cons_607_i_CAI34124.1 and not elem C)
    load data/wzy/alphafold/AHB32490.1/ranked_0.pdb, 608_r_AHB32490.1
    color 0xeeeeee, 608_r_AHB32490.1
    super 586_r_ACH50550.1, 608_r_AHB32490.1
    label n. CA and resi 175 and 608_r_AHB32490.1, "%s-%s" % (resn, resi)
label n. CA and resi 238 and 608_r_AHB32490.1, "%s-%s" % (resn, resi)
label n. CA and resi 287 and 608_r_AHB32490.1, "%s-%s" % (resn, resi)
label n. CA and resi 429 and 608_r_AHB32490.1, "%s-%s" % (resn, resi)
select cons_608_r_AHB32490.1, resi 175 and 608_r_AHB32490.1 or resi 238 and 608_r_AHB32490.1 or resi 287 and 608_r_AHB32490.1 or resi 429 and 608_r_AHB32490.1
show licorice, cons_608_r_AHB32490.1
    color atomic, (cons_608_r_AHB32490.1 and not elem C)
    load data/wzy/alphafold/CAI32772.1/ranked_0.pdb, 608_r_CAI32772.1
    color 0xeeeeee, 608_r_CAI32772.1
    super 608_r_AHB32490.1, 608_r_CAI32772.1
    label n. CA and resi 184 and 608_r_CAI32772.1, "%s-%s" % (resn, resi)
label n. CA and resi 242 and 608_r_CAI32772.1, "%s-%s" % (resn, resi)
label n. CA and resi 290 and 608_r_CAI32772.1, "%s-%s" % (resn, resi)
label n. CA and resi 441 and 608_r_CAI32772.1, "%s-%s" % (resn, resi)
select cons_608_r_CAI32772.1, resi 184 and 608_r_CAI32772.1 or resi 242 and 608_r_CAI32772.1 or resi 290 and 608_r_CAI32772.1 or resi 441 and 608_r_CAI32772.1
show licorice, cons_608_r_CAI32772.1
    color atomic, (cons_608_r_CAI32772.1 and not elem C)
    load data/wzy/alphafold/AHB32411.1/ranked_0.pdb, 610_r_AHB32411.1
    color 0xeeeeee, 610_r_AHB32411.1
    super 586_r_ACH50550.1, 610_r_AHB32411.1
    label n. CA and resi 162 and 610_r_AHB32411.1, "%s-%s" % (resn, resi)
label n. CA and resi 207 and 610_r_AHB32411.1, "%s-%s" % (resn, resi)
label n. CA and resi 242 and 610_r_AHB32411.1, "%s-%s" % (resn, resi)
label n. CA and resi 244 and 610_r_AHB32411.1, "%s-%s" % (resn, resi)
label n. CA and resi 251 and 610_r_AHB32411.1, "%s-%s" % (resn, resi)
select cons_610_r_AHB32411.1, resi 162 and 610_r_AHB32411.1 or resi 207 and 610_r_AHB32411.1 or resi 242 and 610_r_AHB32411.1 or resi 244 and 610_r_AHB32411.1 or resi 251 and 610_r_AHB32411.1
show licorice, cons_610_r_AHB32411.1
    color atomic, (cons_610_r_AHB32411.1 and not elem C)
    load data/wzy/alphafold/CAI34254.1/ranked_0.pdb, 609_i_CAI34254.1
    color 0xeeeeee, 609_i_CAI34254.1
    super 571_i_6BAR, 609_i_CAI34254.1
    label n. CA and resi 171 and 609_i_CAI34254.1, "%s-%s" % (resn, resi)
label n. CA and resi 182 and 609_i_CAI34254.1, "%s-%s" % (resn, resi)
label n. CA and resi 183 and 609_i_CAI34254.1, "%s-%s" % (resn, resi)
label n. CA and resi 189 and 609_i_CAI34254.1, "%s-%s" % (resn, resi)
label n. CA and resi 272 and 609_i_CAI34254.1, "%s-%s" % (resn, resi)
label n. CA and resi 277 and 609_i_CAI34254.1, "%s-%s" % (resn, resi)
label n. CA and resi 281 and 609_i_CAI34254.1, "%s-%s" % (resn, resi)
select cons_609_i_CAI34254.1, resi 171 and 609_i_CAI34254.1 or resi 182 and 609_i_CAI34254.1 or resi 183 and 609_i_CAI34254.1 or resi 189 and 609_i_CAI34254.1 or resi 272 and 609_i_CAI34254.1 or resi 277 and 609_i_CAI34254.1 or resi 281 and 609_i_CAI34254.1
show licorice, cons_609_i_CAI34254.1
    color atomic, (cons_609_i_CAI34254.1 and not elem C)
    load data/wzy/alphafold/CAI34198.1/ranked_0.pdb, 609_i_CAI34198.1
    color 0xeeeeee, 609_i_CAI34198.1
    super 609_i_CAI34254.1, 609_i_CAI34198.1
    label n. CA and resi 171 and 609_i_CAI34198.1, "%s-%s" % (resn, resi)
label n. CA and resi 182 and 609_i_CAI34198.1, "%s-%s" % (resn, resi)
label n. CA and resi 183 and 609_i_CAI34198.1, "%s-%s" % (resn, resi)
label n. CA and resi 189 and 609_i_CAI34198.1, "%s-%s" % (resn, resi)
label n. CA and resi 273 and 609_i_CAI34198.1, "%s-%s" % (resn, resi)
label n. CA and resi 278 and 609_i_CAI34198.1, "%s-%s" % (resn, resi)
label n. CA and resi 282 and 609_i_CAI34198.1, "%s-%s" % (resn, resi)
select cons_609_i_CAI34198.1, resi 171 and 609_i_CAI34198.1 or resi 182 and 609_i_CAI34198.1 or resi 183 and 609_i_CAI34198.1 or resi 189 and 609_i_CAI34198.1 or resi 273 and 609_i_CAI34198.1 or resi 278 and 609_i_CAI34198.1 or resi 282 and 609_i_CAI34198.1
show licorice, cons_609_i_CAI34198.1
    color atomic, (cons_609_i_CAI34198.1 and not elem C)
    load data/wzy/alphafold/CAI34217.1/ranked_0.pdb, 609_i_CAI34217.1
    color 0xeeeeee, 609_i_CAI34217.1
    super 609_i_CAI34254.1, 609_i_CAI34217.1
    label n. CA and resi 175 and 609_i_CAI34217.1, "%s-%s" % (resn, resi)
label n. CA and resi 186 and 609_i_CAI34217.1, "%s-%s" % (resn, resi)
label n. CA and resi 187 and 609_i_CAI34217.1, "%s-%s" % (resn, resi)
label n. CA and resi 193 and 609_i_CAI34217.1, "%s-%s" % (resn, resi)
label n. CA and resi 276 and 609_i_CAI34217.1, "%s-%s" % (resn, resi)
label n. CA and resi 281 and 609_i_CAI34217.1, "%s-%s" % (resn, resi)
label n. CA and resi 285 and 609_i_CAI34217.1, "%s-%s" % (resn, resi)
select cons_609_i_CAI34217.1, resi 175 and 609_i_CAI34217.1 or resi 186 and 609_i_CAI34217.1 or resi 187 and 609_i_CAI34217.1 or resi 193 and 609_i_CAI34217.1 or resi 276 and 609_i_CAI34217.1 or resi 281 and 609_i_CAI34217.1 or resi 285 and 609_i_CAI34217.1
show licorice, cons_609_i_CAI34217.1
    color atomic, (cons_609_i_CAI34217.1 and not elem C)
    @src/pymol-visualization/nicify.pml
