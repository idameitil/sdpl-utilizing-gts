
fetch 7tpg
select chain_B, chain B
hide cartoon, !chain_B
color 0xeeeeee, chain_B
select "cons_7tpg", resi 265 and chain_B or resi 191 and chain_B or resi 313 and chain_B
show licorice, cons_7tpg
color atomic, cons_7tpg
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
color atomic, cons_ECA-Pol_ACH50550.1
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
color atomic, cons_6BAR
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
    color atomic, cons_1_inv_AHB32215.1
    set_view (\
-0.683440149,   -0.663067520,    0.305372268,\
-0.494659185,    0.728278518,    0.474257350,\
-0.536859989,    0.173072219,   -0.825729728,\
0.001152717,   -0.000266055,  -68.808166504,\
142.308670044,  144.785964966,  141.913253784,\
21.062055588,  116.371040344,  -20.000000000 )
    disable
    enable 1_inv_AHB32215.1
    remove hydrogens
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/1_inv_AHB32215.1_labels.png
    hide labels
    deselect
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/1_inv_AHB32215.1.png
    set_view (\
-0.683440149,   -0.663067520,    0.305372268,\
-0.494659185,    0.728278518,    0.474257350,\
-0.536859989,    0.173072219,   -0.825729728,\
0.001152717,   -0.000266055, -209.410827637,\
142.308670044,  144.785964966,  141.913253784,\
161.664825439,  256.973693848,  -20.000000000 )
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/1_inv_AHB32215.1_zoom_out.png
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
    color atomic, cons_1_inv_AHB32334.1
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
    color atomic, cons_1_inv_AHB32861.1
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
    color atomic, cons_1_inv_CAI34008.1
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
    color atomic, cons_1_inv_ACH97162.1
    load data/wzy/alphafold/CAI33309.1/ranked_0.pdb, 3_inv_CAI33309.1
    color 0xeeeeee, 3_inv_CAI33309.1
    cealign 6bar, 3_inv_CAI33309.1
    label n. CA and resi 150 and 3_inv_CAI33309.1, "%s" % (resn)
label n. CA and resi 266 and 3_inv_CAI33309.1, "%s" % (resn)
label n. CA and resi 300 and 3_inv_CAI33309.1, "%s" % (resn)
label n. CA and resi 304 and 3_inv_CAI33309.1, "%s" % (resn)
select cons_3_inv_CAI33309.1, resi 150 and 3_inv_CAI33309.1 or resi 266 and 3_inv_CAI33309.1 or resi 300 and 3_inv_CAI33309.1 or resi 304 and 3_inv_CAI33309.1
show licorice, cons_3_inv_CAI33309.1
    color atomic, cons_3_inv_CAI33309.1
    set_view (\
0.551585853,   -0.249956980,   -0.795785964,\
-0.201193079,   -0.965741575,    0.163889155,\
-0.809491932,    0.069707796,   -0.582981467,\
-0.000338214,    0.001005732,  -73.051330566,\
141.103057861,  137.675796509,  143.691711426,\
25.265157700,  120.574028015,  -20.000000000 )
    disable
    enable 3_inv_CAI33309.1
    remove hydrogens
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/3_inv_CAI33309.1_labels.png
    hide labels
    deselect
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/3_inv_CAI33309.1.png
    set_view (\
0.551585853,   -0.249956980,   -0.795785964,\
-0.201193079,   -0.965741575,    0.163889155,\
-0.809491932,    0.069707796,   -0.582981467,\
-0.000338214,    0.001005732, -183.405883789,\
141.103057861,  137.675796509,  143.691711426,\
135.619613647,  230.928527832,  -20.000000000 )
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/3_inv_CAI33309.1_zoom_out.png
    load data/wzy/alphafold/CAI34369.1/ranked_0.pdb, 3_inv_CAI34369.1
    color 0xeeeeee, 3_inv_CAI34369.1
    cealign 3_inv_CAI33309.1, 3_inv_CAI34369.1
    label n. CA and resi 151 and 3_inv_CAI34369.1, "%s" % (resn)
label n. CA and resi 268 and 3_inv_CAI34369.1, "%s" % (resn)
label n. CA and resi 304 and 3_inv_CAI34369.1, "%s" % (resn)
label n. CA and resi 308 and 3_inv_CAI34369.1, "%s" % (resn)
select cons_3_inv_CAI34369.1, resi 151 and 3_inv_CAI34369.1 or resi 268 and 3_inv_CAI34369.1 or resi 304 and 3_inv_CAI34369.1 or resi 308 and 3_inv_CAI34369.1
show licorice, cons_3_inv_CAI34369.1
    color atomic, cons_3_inv_CAI34369.1
    load data/wzy/alphafold/AIG62747.1/ranked_0.pdb, 3_inv_AIG62747.1
    color 0xeeeeee, 3_inv_AIG62747.1
    cealign 3_inv_CAI33309.1, 3_inv_AIG62747.1
    label n. CA and resi 134 and 3_inv_AIG62747.1, "%s" % (resn)
label n. CA and resi 250 and 3_inv_AIG62747.1, "%s" % (resn)
label n. CA and resi 280 and 3_inv_AIG62747.1, "%s" % (resn)
select cons_3_inv_AIG62747.1, resi 134 and 3_inv_AIG62747.1 or resi 250 and 3_inv_AIG62747.1 or resi 280 and 3_inv_AIG62747.1
show licorice, cons_3_inv_AIG62747.1
    color atomic, cons_3_inv_AIG62747.1
    load data/wzy/alphafold/BAQ00653.1/ranked_0.pdb, 2_ret_BAQ00653.1
    color 0xeeeeee, 2_ret_BAQ00653.1
    cealign ECA-Pol_ACH50550.1, 2_ret_BAQ00653.1
    label n. CA and resi 246 and 2_ret_BAQ00653.1, "%s" % (resn)
label n. CA and resi 301 and 2_ret_BAQ00653.1, "%s" % (resn)
label n. CA and resi 303 and 2_ret_BAQ00653.1, "%s" % (resn)
select cons_2_ret_BAQ00653.1, resi 246 and 2_ret_BAQ00653.1 or resi 301 and 2_ret_BAQ00653.1 or resi 303 and 2_ret_BAQ00653.1
show licorice, cons_2_ret_BAQ00653.1
    color atomic, cons_2_ret_BAQ00653.1
    set_view (\
0.946789801,   -0.075684562,   -0.312827319,\
-0.149829328,   -0.963861048,   -0.220266923,\
-0.284851670,    0.255417824,   -0.923918664,\
-0.000236109,    0.001249277,  -71.888755798,\
132.471527100,  158.386001587,  146.606842041,\
24.035516739,  119.344490051,  -20.000000000 )
    disable
    enable 2_ret_BAQ00653.1
    remove hydrogens
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/2_ret_BAQ00653.1_labels.png
    hide labels
    deselect
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/2_ret_BAQ00653.1.png
    set_view (\
0.946789801,   -0.075684562,   -0.312827319,\
-0.149829328,   -0.963861048,   -0.220266923,\
-0.284851670,    0.255417824,   -0.923918664,\
-0.000236109,    0.001249277, -210.621795654,\
132.471527100,  158.386001587,  146.606842041,\
162.768554688,  258.077545166,  -20.000000000 )
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/2_ret_BAQ00653.1_zoom_out.png
    load data/wzy/alphafold/ADC54950.1/ranked_0.pdb, 2_ret_ADC54950.1
    color 0xeeeeee, 2_ret_ADC54950.1
    cealign 2_ret_BAQ00653.1, 2_ret_ADC54950.1
    label n. CA and resi 249 and 2_ret_ADC54950.1, "%s" % (resn)
label n. CA and resi 305 and 2_ret_ADC54950.1, "%s" % (resn)
label n. CA and resi 307 and 2_ret_ADC54950.1, "%s" % (resn)
select cons_2_ret_ADC54950.1, resi 249 and 2_ret_ADC54950.1 or resi 305 and 2_ret_ADC54950.1 or resi 307 and 2_ret_ADC54950.1
show licorice, cons_2_ret_ADC54950.1
    color atomic, cons_2_ret_ADC54950.1
    load data/wzy/alphafold/AAZ85718.1/ranked_0.pdb, 2_ret_AAZ85718.1
    color 0xeeeeee, 2_ret_AAZ85718.1
    cealign 2_ret_BAQ00653.1, 2_ret_AAZ85718.1
    label n. CA and resi 269 and 2_ret_AAZ85718.1, "%s" % (resn)
label n. CA and resi 329 and 2_ret_AAZ85718.1, "%s" % (resn)
select cons_2_ret_AAZ85718.1, resi 269 and 2_ret_AAZ85718.1 or resi 329 and 2_ret_AAZ85718.1
show licorice, cons_2_ret_AAZ85718.1
    color atomic, cons_2_ret_AAZ85718.1
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
    color atomic, cons_9_ret_CDF66396.1
    set_view (\
0.729139209,   -0.539685309,   -0.420827150,\
-0.620575964,   -0.780631423,   -0.074111812,\
-0.288515359,    0.315193832,   -0.904110909,\
0.000364890,    0.001526102,  -96.566925049,\
139.692199707,  148.061309814,  146.306762695,\
48.654132843,  143.963043213,  -20.000000000 )
    disable
    enable 9_ret_CDF66396.1
    remove hydrogens
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/9_ret_CDF66396.1_labels.png
    hide labels
    deselect
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/9_ret_CDF66396.1.png
    set_view (\
0.729139209,   -0.539685309,   -0.420827150,\
-0.620575964,   -0.780631423,   -0.074111812,\
-0.288515359,    0.315193832,   -0.904110909,\
0.000364890,    0.001526102, -194.636520386,\
139.692199707,  148.061309814,  146.306762695,\
146.723709106,  242.032669067,  -20.000000000 )
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/9_ret_CDF66396.1_zoom_out.png
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
    color atomic, cons_9_ret_AAA97573.1
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
    color atomic, cons_9_ret_AAC45857.1
    load data/wzy/alphafold/BAQ00795.1/ranked_0.pdb, 5_inv_BAQ00795.1
    color 0xeeeeee, 5_inv_BAQ00795.1
    cealign 6bar, 5_inv_BAQ00795.1
    label n. CA and resi 164 and 5_inv_BAQ00795.1, "%s" % (resn)
label n. CA and resi 213 and 5_inv_BAQ00795.1, "%s" % (resn)
label n. CA and resi 276 and 5_inv_BAQ00795.1, "%s" % (resn)
label n. CA and resi 297 and 5_inv_BAQ00795.1, "%s" % (resn)
label n. CA and resi 307 and 5_inv_BAQ00795.1, "%s" % (resn)
label n. CA and resi 308 and 5_inv_BAQ00795.1, "%s" % (resn)
label n. CA and resi 312 and 5_inv_BAQ00795.1, "%s" % (resn)
label n. CA and resi 317 and 5_inv_BAQ00795.1, "%s" % (resn)
label n. CA and resi 366 and 5_inv_BAQ00795.1, "%s" % (resn)
select cons_5_inv_BAQ00795.1, resi 164 and 5_inv_BAQ00795.1 or resi 213 and 5_inv_BAQ00795.1 or resi 276 and 5_inv_BAQ00795.1 or resi 297 and 5_inv_BAQ00795.1 or resi 307 and 5_inv_BAQ00795.1 or resi 308 and 5_inv_BAQ00795.1 or resi 312 and 5_inv_BAQ00795.1 or resi 317 and 5_inv_BAQ00795.1 or resi 366 and 5_inv_BAQ00795.1
show licorice, cons_5_inv_BAQ00795.1
    color atomic, cons_5_inv_BAQ00795.1
    set_view (\
0.952562153,    0.299962610,    0.051453240,\
0.091571696,   -0.121261142,   -0.988384247,\
-0.290240526,    0.946213603,   -0.142980069,\
-0.000644388,    0.000822656,  -99.102546692,\
124.888572693,  146.041732788,  143.484436035,\
51.510082245,  146.819198608,  -20.000000000 )
    disable
    enable 5_inv_BAQ00795.1
    remove hydrogens
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/5_inv_BAQ00795.1_labels.png
    hide labels
    deselect
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/5_inv_BAQ00795.1.png
    set_view (\
0.952562153,    0.299962610,    0.051453240,\
0.091571696,   -0.121261142,   -0.988384247,\
-0.290240526,    0.946213603,   -0.142980069,\
-0.000644388,    0.000822656, -252.046905518,\
124.888572693,  146.041732788,  143.484436035,\
204.454437256,  299.763580322,  -20.000000000 )
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/5_inv_BAQ00795.1_zoom_out.png
    load data/wzy/alphafold/BAQ01659.1/ranked_0.pdb, 5_inv_BAQ01659.1
    color 0xeeeeee, 5_inv_BAQ01659.1
    cealign 5_inv_BAQ00795.1, 5_inv_BAQ01659.1
    label n. CA and resi 162 and 5_inv_BAQ01659.1, "%s" % (resn)
label n. CA and resi 211 and 5_inv_BAQ01659.1, "%s" % (resn)
label n. CA and resi 279 and 5_inv_BAQ01659.1, "%s" % (resn)
label n. CA and resi 315 and 5_inv_BAQ01659.1, "%s" % (resn)
label n. CA and resi 367 and 5_inv_BAQ01659.1, "%s" % (resn)
select cons_5_inv_BAQ01659.1, resi 162 and 5_inv_BAQ01659.1 or resi 211 and 5_inv_BAQ01659.1 or resi 279 and 5_inv_BAQ01659.1 or resi 315 and 5_inv_BAQ01659.1 or resi 367 and 5_inv_BAQ01659.1
show licorice, cons_5_inv_BAQ01659.1
    color atomic, cons_5_inv_BAQ01659.1
    load data/wzy/alphafold/BAQ02088.1/ranked_0.pdb, 5_inv_BAQ02088.1
    color 0xeeeeee, 5_inv_BAQ02088.1
    cealign 5_inv_BAQ00795.1, 5_inv_BAQ02088.1
    label n. CA and resi 175 and 5_inv_BAQ02088.1, "%s" % (resn)
label n. CA and resi 228 and 5_inv_BAQ02088.1, "%s" % (resn)
label n. CA and resi 307 and 5_inv_BAQ02088.1, "%s" % (resn)
label n. CA and resi 327 and 5_inv_BAQ02088.1, "%s" % (resn)
label n. CA and resi 338 and 5_inv_BAQ02088.1, "%s" % (resn)
label n. CA and resi 339 and 5_inv_BAQ02088.1, "%s" % (resn)
label n. CA and resi 343 and 5_inv_BAQ02088.1, "%s" % (resn)
label n. CA and resi 348 and 5_inv_BAQ02088.1, "%s" % (resn)
label n. CA and resi 395 and 5_inv_BAQ02088.1, "%s" % (resn)
select cons_5_inv_BAQ02088.1, resi 175 and 5_inv_BAQ02088.1 or resi 228 and 5_inv_BAQ02088.1 or resi 307 and 5_inv_BAQ02088.1 or resi 327 and 5_inv_BAQ02088.1 or resi 338 and 5_inv_BAQ02088.1 or resi 339 and 5_inv_BAQ02088.1 or resi 343 and 5_inv_BAQ02088.1 or resi 348 and 5_inv_BAQ02088.1 or resi 395 and 5_inv_BAQ02088.1
show licorice, cons_5_inv_BAQ02088.1
    color atomic, cons_5_inv_BAQ02088.1
    load data/wzy/alphafold/ACA24754.1/ranked_0.pdb, 5_inv_ACA24754.1
    color 0xeeeeee, 5_inv_ACA24754.1
    cealign 5_inv_BAQ00795.1, 5_inv_ACA24754.1
    label n. CA and resi 162 and 5_inv_ACA24754.1, "%s" % (resn)
label n. CA and resi 217 and 5_inv_ACA24754.1, "%s" % (resn)
label n. CA and resi 294 and 5_inv_ACA24754.1, "%s" % (resn)
select cons_5_inv_ACA24754.1, resi 162 and 5_inv_ACA24754.1 or resi 217 and 5_inv_ACA24754.1 or resi 294 and 5_inv_ACA24754.1
show licorice, cons_5_inv_ACA24754.1
    color atomic, cons_5_inv_ACA24754.1
    load data/wzy/alphafold/ACD37165.1/ranked_0.pdb, 4_inv_ACD37165.1
    color 0xeeeeee, 4_inv_ACD37165.1
    cealign 6bar, 4_inv_ACD37165.1
    label n. CA and resi 206 and 4_inv_ACD37165.1, "%s" % (resn)
label n. CA and resi 258 and 4_inv_ACD37165.1, "%s" % (resn)
label n. CA and resi 291 and 4_inv_ACD37165.1, "%s" % (resn)
label n. CA and resi 346 and 4_inv_ACD37165.1, "%s" % (resn)
select cons_4_inv_ACD37165.1, resi 206 and 4_inv_ACD37165.1 or resi 258 and 4_inv_ACD37165.1 or resi 291 and 4_inv_ACD37165.1 or resi 346 and 4_inv_ACD37165.1
show licorice, cons_4_inv_ACD37165.1
    color atomic, cons_4_inv_ACD37165.1
    set_view (\
0.889429271,    0.456946433,    0.010788713,\
0.301802963,   -0.569397390,   -0.764653385,\
-0.343263775,    0.683362782,   -0.644350410,\
-0.000595946,    0.000829549,  -56.411224365,\
126.094604492,  149.727966309,  140.648681641,\
8.833254814,  104.142395020,  -20.000000000 )
    disable
    enable 4_inv_ACD37165.1
    remove hydrogens
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/4_inv_ACD37165.1_labels.png
    hide labels
    deselect
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/4_inv_ACD37165.1.png
    set_view (\
0.889429271,    0.456946433,    0.010788713,\
0.301802963,   -0.569397390,   -0.764653385,\
-0.343263775,    0.683362782,   -0.644350410,\
-0.000595946,    0.000829549, -278.857788086,\
126.094604492,  149.727966309,  140.648681641,\
231.279754639,  326.589019775,  -20.000000000 )
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/4_inv_ACD37165.1_zoom_out.png
    load data/wzy/alphafold/AAM27615.1/ranked_0.pdb, 4_inv_AAM27615.1
    color 0xeeeeee, 4_inv_AAM27615.1
    cealign 4_inv_ACD37165.1, 4_inv_AAM27615.1
    label n. CA and resi 188 and 4_inv_AAM27615.1, "%s" % (resn)
label n. CA and resi 260 and 4_inv_AAM27615.1, "%s" % (resn)
label n. CA and resi 298 and 4_inv_AAM27615.1, "%s" % (resn)
label n. CA and resi 357 and 4_inv_AAM27615.1, "%s" % (resn)
select cons_4_inv_AAM27615.1, resi 188 and 4_inv_AAM27615.1 or resi 260 and 4_inv_AAM27615.1 or resi 298 and 4_inv_AAM27615.1 or resi 357 and 4_inv_AAM27615.1
show licorice, cons_4_inv_AAM27615.1
    color atomic, cons_4_inv_AAM27615.1
    load data/wzy/alphafold/CBN82200.1/ranked_0.pdb, 14_ret_CBN82200.1
    color 0xeeeeee, 14_ret_CBN82200.1
    cealign ECA-Pol_ACH50550.1, 14_ret_CBN82200.1
    label n. CA and resi 211 and 14_ret_CBN82200.1, "%s" % (resn)
label n. CA and resi 270 and 14_ret_CBN82200.1, "%s" % (resn)
label n. CA and resi 275 and 14_ret_CBN82200.1, "%s" % (resn)
label n. CA and resi 330 and 14_ret_CBN82200.1, "%s" % (resn)
label n. CA and resi 369 and 14_ret_CBN82200.1, "%s" % (resn)
select cons_14_ret_CBN82200.1, resi 211 and 14_ret_CBN82200.1 or resi 270 and 14_ret_CBN82200.1 or resi 275 and 14_ret_CBN82200.1 or resi 330 and 14_ret_CBN82200.1 or resi 369 and 14_ret_CBN82200.1
show licorice, cons_14_ret_CBN82200.1
    color atomic, cons_14_ret_CBN82200.1
    set_view (\
0.844245791,    0.395286381,   -0.361938119,\
0.357063174,   -0.918441117,   -0.170189112,\
-0.399693757,    0.014444711,   -0.916536272,\
-0.000488803,    0.000909319,  -50.432785034,\
129.836624146,  157.125335693,  127.491699219,\
2.837754488,   98.147041321,  -20.000000000 )
    disable
    enable 14_ret_CBN82200.1
    remove hydrogens
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/14_ret_CBN82200.1_labels.png
    hide labels
    deselect
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/14_ret_CBN82200.1.png
    set_view (\
0.844245791,    0.395286381,   -0.361938119,\
0.357063174,   -0.918441117,   -0.170189112,\
-0.399693757,    0.014444711,   -0.916536272,\
-0.000488803,    0.000909319, -203.953628540,\
129.836624146,  157.125335693,  127.491699219,\
156.358596802,  251.667892456,  -20.000000000 )
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/14_ret_CBN82200.1_zoom_out.png
    load data/wzy/alphafold/AAT77177.1/ranked_0.pdb, 14_ret_AAT77177.1
    color 0xeeeeee, 14_ret_AAT77177.1
    cealign 14_ret_CBN82200.1, 14_ret_AAT77177.1
    label n. CA and resi 226 and 14_ret_AAT77177.1, "%s" % (resn)
label n. CA and resi 284 and 14_ret_AAT77177.1, "%s" % (resn)
label n. CA and resi 289 and 14_ret_AAT77177.1, "%s" % (resn)
label n. CA and resi 348 and 14_ret_AAT77177.1, "%s" % (resn)
label n. CA and resi 387 and 14_ret_AAT77177.1, "%s" % (resn)
select cons_14_ret_AAT77177.1, resi 226 and 14_ret_AAT77177.1 or resi 284 and 14_ret_AAT77177.1 or resi 289 and 14_ret_AAT77177.1 or resi 348 and 14_ret_AAT77177.1 or resi 387 and 14_ret_AAT77177.1
show licorice, cons_14_ret_AAT77177.1
    color atomic, cons_14_ret_AAT77177.1
    load data/wzy/alphafold/CAI34124.1/ranked_0.pdb, 28_inv_CAI34124.1
    color 0xeeeeee, 28_inv_CAI34124.1
    cealign 6bar, 28_inv_CAI34124.1
    label n. CA and resi 37 and 28_inv_CAI34124.1, "%s" % (resn)
label n. CA and resi 101 and 28_inv_CAI34124.1, "%s" % (resn)
label n. CA and resi 158 and 28_inv_CAI34124.1, "%s" % (resn)
label n. CA and resi 267 and 28_inv_CAI34124.1, "%s" % (resn)
label n. CA and resi 300 and 28_inv_CAI34124.1, "%s" % (resn)
label n. CA and resi 301 and 28_inv_CAI34124.1, "%s" % (resn)
label n. CA and resi 304 and 28_inv_CAI34124.1, "%s" % (resn)
label n. CA and resi 325 and 28_inv_CAI34124.1, "%s" % (resn)
select cons_28_inv_CAI34124.1, resi 37 and 28_inv_CAI34124.1 or resi 101 and 28_inv_CAI34124.1 or resi 158 and 28_inv_CAI34124.1 or resi 267 and 28_inv_CAI34124.1 or resi 300 and 28_inv_CAI34124.1 or resi 301 and 28_inv_CAI34124.1 or resi 304 and 28_inv_CAI34124.1 or resi 325 and 28_inv_CAI34124.1
show licorice, cons_28_inv_CAI34124.1
    color atomic, cons_28_inv_CAI34124.1
    set_view (\
0.638226330,    0.435204893,   -0.635031223,\
0.332030773,   -0.899820089,   -0.282970726,\
-0.694565356,   -0.030251486,   -0.718794286,\
-0.000473529,    0.000802059,  -91.329643250,\
124.750480652,  138.521148682,  132.980804443,\
43.696250916,  139.005523682,  -20.000000000 )
    disable
    enable 28_inv_CAI34124.1
    remove hydrogens
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/28_inv_CAI34124.1_labels.png
    hide labels
    deselect
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/28_inv_CAI34124.1.png
    set_view (\
0.638226330,    0.435204893,   -0.635031223,\
0.332030773,   -0.899820089,   -0.282970726,\
-0.694565356,   -0.030251486,   -0.718794286,\
-0.000473529,    0.000802059, -155.392791748,\
124.750480652,  138.521148682,  132.980804443,\
107.759399414,  203.068695068,  -20.000000000 )
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/28_inv_CAI34124.1_zoom_out.png
    load data/wzy/alphafold/AHB32490.1/ranked_0.pdb, 6_ret_AHB32490.1
    color 0xeeeeee, 6_ret_AHB32490.1
    cealign ECA-Pol_ACH50550.1, 6_ret_AHB32490.1
    label n. CA and resi 175 and 6_ret_AHB32490.1, "%s" % (resn)
label n. CA and resi 238 and 6_ret_AHB32490.1, "%s" % (resn)
label n. CA and resi 287 and 6_ret_AHB32490.1, "%s" % (resn)
label n. CA and resi 429 and 6_ret_AHB32490.1, "%s" % (resn)
select cons_6_ret_AHB32490.1, resi 175 and 6_ret_AHB32490.1 or resi 238 and 6_ret_AHB32490.1 or resi 287 and 6_ret_AHB32490.1 or resi 429 and 6_ret_AHB32490.1
show licorice, cons_6_ret_AHB32490.1
    color atomic, cons_6_ret_AHB32490.1
    set_view (\
0.645065784,    0.335653991,   -0.686459959,\
0.316698968,   -0.935001910,   -0.159580246,\
-0.695406854,   -0.114462890,   -0.709442794,\
-0.000555143,    0.000912797,  -50.077732086,\
129.130661011,  155.730438232,  122.186187744,\
2.402042866,   97.711326599,  -20.000000000 )
    disable
    enable 6_ret_AHB32490.1
    remove hydrogens
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/6_ret_AHB32490.1_labels.png
    hide labels
    deselect
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/6_ret_AHB32490.1.png
    set_view (\
0.645065784,    0.335653991,   -0.686459959,\
0.316698968,   -0.935001910,   -0.159580246,\
-0.695406854,   -0.114462890,   -0.709442794,\
-0.000555143,    0.000912797, -190.433761597,\
129.130661011,  155.730438232,  122.186187744,\
142.758056641,  238.067367554,  -20.000000000 )
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/6_ret_AHB32490.1_zoom_out.png
    load data/wzy/alphafold/CAI32772.1/ranked_0.pdb, 6_ret_CAI32772.1
    color 0xeeeeee, 6_ret_CAI32772.1
    cealign 6_ret_AHB32490.1, 6_ret_CAI32772.1
    label n. CA and resi 184 and 6_ret_CAI32772.1, "%s" % (resn)
label n. CA and resi 242 and 6_ret_CAI32772.1, "%s" % (resn)
label n. CA and resi 290 and 6_ret_CAI32772.1, "%s" % (resn)
label n. CA and resi 441 and 6_ret_CAI32772.1, "%s" % (resn)
select cons_6_ret_CAI32772.1, resi 184 and 6_ret_CAI32772.1 or resi 242 and 6_ret_CAI32772.1 or resi 290 and 6_ret_CAI32772.1 or resi 441 and 6_ret_CAI32772.1
show licorice, cons_6_ret_CAI32772.1
    color atomic, cons_6_ret_CAI32772.1
    load data/wzy/alphafold/AHB32411.1/ranked_0.pdb, 29_ret_AHB32411.1
    color 0xeeeeee, 29_ret_AHB32411.1
    cealign ECA-Pol_ACH50550.1, 29_ret_AHB32411.1
    label n. CA and resi 110 and 29_ret_AHB32411.1, "%s" % (resn)
label n. CA and resi 162 and 29_ret_AHB32411.1, "%s" % (resn)
label n. CA and resi 207 and 29_ret_AHB32411.1, "%s" % (resn)
label n. CA and resi 242 and 29_ret_AHB32411.1, "%s" % (resn)
label n. CA and resi 244 and 29_ret_AHB32411.1, "%s" % (resn)
label n. CA and resi 251 and 29_ret_AHB32411.1, "%s" % (resn)
select cons_29_ret_AHB32411.1, resi 110 and 29_ret_AHB32411.1 or resi 162 and 29_ret_AHB32411.1 or resi 207 and 29_ret_AHB32411.1 or resi 242 and 29_ret_AHB32411.1 or resi 244 and 29_ret_AHB32411.1 or resi 251 and 29_ret_AHB32411.1
show licorice, cons_29_ret_AHB32411.1
    color atomic, cons_29_ret_AHB32411.1
    set_view (\
0.737176716,    0.180990621,   -0.651009977,\
0.233920187,   -0.972237051,   -0.005415322,\
-0.633917689,   -0.148294136,   -0.759051025,\
-0.000327793,    0.000875022,  -68.232856750,\
128.964675903,  156.658279419,  122.363311768,\
20.525758743,  115.835044861,  -20.000000000 )
    disable
    enable 29_ret_AHB32411.1
    remove hydrogens
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/29_ret_AHB32411.1_labels.png
    hide labels
    deselect
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/29_ret_AHB32411.1.png
    set_view (\
0.737176716,    0.180990621,   -0.651009977,\
0.233920187,   -0.972237051,   -0.005415322,\
-0.633917689,   -0.148294136,   -0.759051025,\
-0.000327793,    0.000875022, -153.836700439,\
128.964675903,  156.658279419,  122.363311768,\
106.129623413,  201.438934326,  -20.000000000 )
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/29_ret_AHB32411.1_zoom_out.png
    load data/wzy/alphafold/CAI34254.1/ranked_0.pdb, 30_inv_CAI34254.1
    color 0xeeeeee, 30_inv_CAI34254.1
    cealign 6bar, 30_inv_CAI34254.1
    label n. CA and resi 131 and 30_inv_CAI34254.1, "%s" % (resn)
label n. CA and resi 171 and 30_inv_CAI34254.1, "%s" % (resn)
label n. CA and resi 182 and 30_inv_CAI34254.1, "%s" % (resn)
label n. CA and resi 183 and 30_inv_CAI34254.1, "%s" % (resn)
label n. CA and resi 189 and 30_inv_CAI34254.1, "%s" % (resn)
label n. CA and resi 225 and 30_inv_CAI34254.1, "%s" % (resn)
label n. CA and resi 272 and 30_inv_CAI34254.1, "%s" % (resn)
label n. CA and resi 277 and 30_inv_CAI34254.1, "%s" % (resn)
label n. CA and resi 281 and 30_inv_CAI34254.1, "%s" % (resn)
select cons_30_inv_CAI34254.1, resi 131 and 30_inv_CAI34254.1 or resi 171 and 30_inv_CAI34254.1 or resi 182 and 30_inv_CAI34254.1 or resi 183 and 30_inv_CAI34254.1 or resi 189 and 30_inv_CAI34254.1 or resi 225 and 30_inv_CAI34254.1 or resi 272 and 30_inv_CAI34254.1 or resi 277 and 30_inv_CAI34254.1 or resi 281 and 30_inv_CAI34254.1
show licorice, cons_30_inv_CAI34254.1
    color atomic, cons_30_inv_CAI34254.1
    set_view (\
0.902921855,   -0.295819551,   -0.311817378,\
-0.114745617,   -0.865042210,    0.488395095,\
-0.414212555,   -0.405204207,   -0.815009654,\
0.000668594,    0.000097368,  -57.465919495,\
128.440216064,  144.652923584,  124.431320190,\
9.651292801,  104.960548401,  -20.000000000 )
    disable
    enable 30_inv_CAI34254.1
    remove hydrogens
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/30_inv_CAI34254.1_labels.png
    hide labels
    deselect
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/30_inv_CAI34254.1.png
    set_view (\
0.902921855,   -0.295819551,   -0.311817378,\
-0.114745617,   -0.865042210,    0.488395095,\
-0.414212555,   -0.405204207,   -0.815009654,\
0.000668594,    0.000097368, -198.928100586,\
128.440216064,  144.652923584,  124.431320190,\
151.113449097,  246.422698975,  -20.000000000 )
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/30_inv_CAI34254.1_zoom_out.png
    load data/wzy/alphafold/CAI34198.1/ranked_0.pdb, 30_inv_CAI34198.1
    color 0xeeeeee, 30_inv_CAI34198.1
    cealign 30_inv_CAI34254.1, 30_inv_CAI34198.1
    label n. CA and resi 131 and 30_inv_CAI34198.1, "%s" % (resn)
label n. CA and resi 171 and 30_inv_CAI34198.1, "%s" % (resn)
label n. CA and resi 182 and 30_inv_CAI34198.1, "%s" % (resn)
label n. CA and resi 183 and 30_inv_CAI34198.1, "%s" % (resn)
label n. CA and resi 189 and 30_inv_CAI34198.1, "%s" % (resn)
label n. CA and resi 226 and 30_inv_CAI34198.1, "%s" % (resn)
label n. CA and resi 273 and 30_inv_CAI34198.1, "%s" % (resn)
label n. CA and resi 278 and 30_inv_CAI34198.1, "%s" % (resn)
label n. CA and resi 282 and 30_inv_CAI34198.1, "%s" % (resn)
select cons_30_inv_CAI34198.1, resi 131 and 30_inv_CAI34198.1 or resi 171 and 30_inv_CAI34198.1 or resi 182 and 30_inv_CAI34198.1 or resi 183 and 30_inv_CAI34198.1 or resi 189 and 30_inv_CAI34198.1 or resi 226 and 30_inv_CAI34198.1 or resi 273 and 30_inv_CAI34198.1 or resi 278 and 30_inv_CAI34198.1 or resi 282 and 30_inv_CAI34198.1
show licorice, cons_30_inv_CAI34198.1
    color atomic, cons_30_inv_CAI34198.1
    load data/wzy/alphafold/CAI34217.1/ranked_0.pdb, 30_inv_CAI34217.1
    color 0xeeeeee, 30_inv_CAI34217.1
    cealign 30_inv_CAI34254.1, 30_inv_CAI34217.1
    label n. CA and resi 135 and 30_inv_CAI34217.1, "%s" % (resn)
label n. CA and resi 175 and 30_inv_CAI34217.1, "%s" % (resn)
label n. CA and resi 186 and 30_inv_CAI34217.1, "%s" % (resn)
label n. CA and resi 187 and 30_inv_CAI34217.1, "%s" % (resn)
label n. CA and resi 193 and 30_inv_CAI34217.1, "%s" % (resn)
label n. CA and resi 230 and 30_inv_CAI34217.1, "%s" % (resn)
label n. CA and resi 276 and 30_inv_CAI34217.1, "%s" % (resn)
label n. CA and resi 281 and 30_inv_CAI34217.1, "%s" % (resn)
label n. CA and resi 285 and 30_inv_CAI34217.1, "%s" % (resn)
select cons_30_inv_CAI34217.1, resi 135 and 30_inv_CAI34217.1 or resi 175 and 30_inv_CAI34217.1 or resi 186 and 30_inv_CAI34217.1 or resi 187 and 30_inv_CAI34217.1 or resi 193 and 30_inv_CAI34217.1 or resi 230 and 30_inv_CAI34217.1 or resi 276 and 30_inv_CAI34217.1 or resi 281 and 30_inv_CAI34217.1 or resi 285 and 30_inv_CAI34217.1
show licorice, cons_30_inv_CAI34217.1
    color atomic, cons_30_inv_CAI34217.1
    @src/pymol-visualization/nicify.pml