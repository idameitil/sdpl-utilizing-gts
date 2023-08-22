
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
    label n. CA and resi 49 and 1_inv_AHB32215.1, "%s-%s" % (resn, resi)
label n. CA and resi 53 and 1_inv_AHB32215.1, "%s-%s" % (resn, resi)
label n. CA and resi 137 and 1_inv_AHB32215.1, "%s-%s" % (resn, resi)
label n. CA and resi 171 and 1_inv_AHB32215.1, "%s-%s" % (resn, resi)
label n. CA and resi 219 and 1_inv_AHB32215.1, "%s-%s" % (resn, resi)
label n. CA and resi 283 and 1_inv_AHB32215.1, "%s-%s" % (resn, resi)
select cons_1_inv_AHB32215.1, resi 49 and 1_inv_AHB32215.1 or resi 53 and 1_inv_AHB32215.1 or resi 137 and 1_inv_AHB32215.1 or resi 171 and 1_inv_AHB32215.1 or resi 219 and 1_inv_AHB32215.1 or resi 283 and 1_inv_AHB32215.1
show licorice, cons_1_inv_AHB32215.1
    color atomic, (cons_1_inv_AHB32215.1 and not elem C)
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
    png /Users/idamei/phd/data/pymol-visualizations/figures/zoom_in_labels/1_inv_AHB32215.1_labels.png
    hide labels
    deselect
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/zoom_in/1_inv_AHB32215.1.png
    set_view (\
-0.683440149,   -0.663067520,    0.305372268,\
-0.494659185,    0.728278518,    0.474257350,\
-0.536859989,    0.173072219,   -0.825729728,\
0.001152717,   -0.000266055, -209.410827637,\
142.308670044,  144.785964966,  141.913253784,\
161.664825439,  256.973693848,  -20.000000000 )
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/zoom_out/1_inv_AHB32215.1_zoom_out.png
    load data/wzy/alphafold/AHB32334.1/ranked_0.pdb, 1_inv_AHB32334.1
    color 0xeeeeee, 1_inv_AHB32334.1
    cealign 1_inv_AHB32215.1, 1_inv_AHB32334.1
    label n. CA and resi 33 and 1_inv_AHB32334.1, "%s-%s" % (resn, resi)
label n. CA and resi 37 and 1_inv_AHB32334.1, "%s-%s" % (resn, resi)
label n. CA and resi 126 and 1_inv_AHB32334.1, "%s-%s" % (resn, resi)
label n. CA and resi 161 and 1_inv_AHB32334.1, "%s-%s" % (resn, resi)
label n. CA and resi 219 and 1_inv_AHB32334.1, "%s-%s" % (resn, resi)
label n. CA and resi 284 and 1_inv_AHB32334.1, "%s-%s" % (resn, resi)
select cons_1_inv_AHB32334.1, resi 33 and 1_inv_AHB32334.1 or resi 37 and 1_inv_AHB32334.1 or resi 126 and 1_inv_AHB32334.1 or resi 161 and 1_inv_AHB32334.1 or resi 219 and 1_inv_AHB32334.1 or resi 284 and 1_inv_AHB32334.1
show licorice, cons_1_inv_AHB32334.1
    color atomic, (cons_1_inv_AHB32334.1 and not elem C)
    load data/wzy/alphafold/AHB32861.1/ranked_0.pdb, 1_inv_AHB32861.1
    color 0xeeeeee, 1_inv_AHB32861.1
    cealign 1_inv_AHB32215.1, 1_inv_AHB32861.1
    label n. CA and resi 48 and 1_inv_AHB32861.1, "%s-%s" % (resn, resi)
label n. CA and resi 52 and 1_inv_AHB32861.1, "%s-%s" % (resn, resi)
label n. CA and resi 136 and 1_inv_AHB32861.1, "%s-%s" % (resn, resi)
label n. CA and resi 170 and 1_inv_AHB32861.1, "%s-%s" % (resn, resi)
label n. CA and resi 221 and 1_inv_AHB32861.1, "%s-%s" % (resn, resi)
label n. CA and resi 287 and 1_inv_AHB32861.1, "%s-%s" % (resn, resi)
select cons_1_inv_AHB32861.1, resi 48 and 1_inv_AHB32861.1 or resi 52 and 1_inv_AHB32861.1 or resi 136 and 1_inv_AHB32861.1 or resi 170 and 1_inv_AHB32861.1 or resi 221 and 1_inv_AHB32861.1 or resi 287 and 1_inv_AHB32861.1
show licorice, cons_1_inv_AHB32861.1
    color atomic, (cons_1_inv_AHB32861.1 and not elem C)
    load data/wzy/alphafold/CAI34008.1/ranked_0.pdb, 1_inv_CAI34008.1
    color 0xeeeeee, 1_inv_CAI34008.1
    cealign 1_inv_AHB32215.1, 1_inv_CAI34008.1
    label n. CA and resi 51 and 1_inv_CAI34008.1, "%s-%s" % (resn, resi)
label n. CA and resi 55 and 1_inv_CAI34008.1, "%s-%s" % (resn, resi)
label n. CA and resi 153 and 1_inv_CAI34008.1, "%s-%s" % (resn, resi)
label n. CA and resi 187 and 1_inv_CAI34008.1, "%s-%s" % (resn, resi)
label n. CA and resi 254 and 1_inv_CAI34008.1, "%s-%s" % (resn, resi)
label n. CA and resi 315 and 1_inv_CAI34008.1, "%s-%s" % (resn, resi)
select cons_1_inv_CAI34008.1, resi 51 and 1_inv_CAI34008.1 or resi 55 and 1_inv_CAI34008.1 or resi 153 and 1_inv_CAI34008.1 or resi 187 and 1_inv_CAI34008.1 or resi 254 and 1_inv_CAI34008.1 or resi 315 and 1_inv_CAI34008.1
show licorice, cons_1_inv_CAI34008.1
    color atomic, (cons_1_inv_CAI34008.1 and not elem C)
    load data/wzy/alphafold/ACH97162.1/ranked_0.pdb, 1_inv_ACH97162.1
    color 0xeeeeee, 1_inv_ACH97162.1
    cealign 1_inv_AHB32215.1, 1_inv_ACH97162.1
    label n. CA and resi 51 and 1_inv_ACH97162.1, "%s-%s" % (resn, resi)
label n. CA and resi 55 and 1_inv_ACH97162.1, "%s-%s" % (resn, resi)
label n. CA and resi 142 and 1_inv_ACH97162.1, "%s-%s" % (resn, resi)
label n. CA and resi 176 and 1_inv_ACH97162.1, "%s-%s" % (resn, resi)
label n. CA and resi 234 and 1_inv_ACH97162.1, "%s-%s" % (resn, resi)
label n. CA and resi 301 and 1_inv_ACH97162.1, "%s-%s" % (resn, resi)
select cons_1_inv_ACH97162.1, resi 51 and 1_inv_ACH97162.1 or resi 55 and 1_inv_ACH97162.1 or resi 142 and 1_inv_ACH97162.1 or resi 176 and 1_inv_ACH97162.1 or resi 234 and 1_inv_ACH97162.1 or resi 301 and 1_inv_ACH97162.1
show licorice, cons_1_inv_ACH97162.1
    color atomic, (cons_1_inv_ACH97162.1 and not elem C)
    load data/wzy/alphafold/CAI33309.1/ranked_0.pdb, 3_inv_CAI33309.1
    color 0xeeeeee, 3_inv_CAI33309.1
    cealign 6bar, 3_inv_CAI33309.1
    label n. CA and resi 150 and 3_inv_CAI33309.1, "%s-%s" % (resn, resi)
label n. CA and resi 266 and 3_inv_CAI33309.1, "%s-%s" % (resn, resi)
label n. CA and resi 304 and 3_inv_CAI33309.1, "%s-%s" % (resn, resi)
select cons_3_inv_CAI33309.1, resi 150 and 3_inv_CAI33309.1 or resi 266 and 3_inv_CAI33309.1 or resi 304 and 3_inv_CAI33309.1
show licorice, cons_3_inv_CAI33309.1
    color atomic, (cons_3_inv_CAI33309.1 and not elem C)
    set_view (\
0.822875202,    0.002506510,   -0.568214953,\
-0.360731304,   -0.770325780,   -0.525801659,\
-0.439029992,    0.637643456,   -0.632979572,\
0.000010717,    0.000299536,  -51.217681885,\
131.743667603,  142.391632080,  136.021255493,\
3.582074881,   98.891075134,  -20.000000000 )
    disable
    enable 3_inv_CAI33309.1
    remove hydrogens
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/zoom_in_labels/3_inv_CAI33309.1_labels.png
    hide labels
    deselect
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/zoom_in/3_inv_CAI33309.1.png
    set_view (\
0.822875202,    0.002506510,   -0.568214953,\
-0.360731304,   -0.770325780,   -0.525801659,\
-0.439029992,    0.637643456,   -0.632979572,\
0.000010717,    0.000299536, -191.657852173,\
131.743667603,  142.391632080,  136.021255493,\
144.022232056,  239.331222534,  -20.000000000 )
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/zoom_out/3_inv_CAI33309.1_zoom_out.png
    load data/wzy/alphafold/CAI34369.1/ranked_0.pdb, 3_inv_CAI34369.1
    color 0xeeeeee, 3_inv_CAI34369.1
    cealign 3_inv_CAI33309.1, 3_inv_CAI34369.1
    label n. CA and resi 151 and 3_inv_CAI34369.1, "%s-%s" % (resn, resi)
label n. CA and resi 268 and 3_inv_CAI34369.1, "%s-%s" % (resn, resi)
label n. CA and resi 308 and 3_inv_CAI34369.1, "%s-%s" % (resn, resi)
select cons_3_inv_CAI34369.1, resi 151 and 3_inv_CAI34369.1 or resi 268 and 3_inv_CAI34369.1 or resi 308 and 3_inv_CAI34369.1
show licorice, cons_3_inv_CAI34369.1
    color atomic, (cons_3_inv_CAI34369.1 and not elem C)
    load data/wzy/alphafold/AIG62747.1/ranked_0.pdb, 3_inv_AIG62747.1
    color 0xeeeeee, 3_inv_AIG62747.1
    cealign 3_inv_CAI33309.1, 3_inv_AIG62747.1
    label n. CA and resi 134 and 3_inv_AIG62747.1, "%s-%s" % (resn, resi)
label n. CA and resi 250 and 3_inv_AIG62747.1, "%s-%s" % (resn, resi)
label n. CA and resi 280 and 3_inv_AIG62747.1, "%s-%s" % (resn, resi)
select cons_3_inv_AIG62747.1, resi 134 and 3_inv_AIG62747.1 or resi 250 and 3_inv_AIG62747.1 or resi 280 and 3_inv_AIG62747.1
show licorice, cons_3_inv_AIG62747.1
    color atomic, (cons_3_inv_AIG62747.1 and not elem C)
    load data/wzy/alphafold/BAQ00653.1/ranked_0.pdb, 2_ret_BAQ00653.1
    color 0xeeeeee, 2_ret_BAQ00653.1
    cealign ECA-Pol_ACH50550.1, 2_ret_BAQ00653.1
    label n. CA and resi 246 and 2_ret_BAQ00653.1, "%s-%s" % (resn, resi)
label n. CA and resi 301 and 2_ret_BAQ00653.1, "%s-%s" % (resn, resi)
select cons_2_ret_BAQ00653.1, resi 246 and 2_ret_BAQ00653.1 or resi 301 and 2_ret_BAQ00653.1
show licorice, cons_2_ret_BAQ00653.1
    color atomic, (cons_2_ret_BAQ00653.1 and not elem C)
    set_view (\
-0.005987321,   -0.987714827,   -0.156143367,\
-0.986128867,   -0.020066837,    0.164750189,\
-0.165861070,    0.154965088,   -0.973897636,\
0.000173775,    0.000615355,  -54.214637756,\
131.691970825,  149.925262451,  137.324920654,\
6.558614254,  101.867553711,  -20.000000000 )
    disable
    enable 2_ret_BAQ00653.1
    remove hydrogens
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/zoom_in_labels/2_ret_BAQ00653.1_labels.png
    hide labels
    deselect
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/zoom_in/2_ret_BAQ00653.1.png
    set_view (\
-0.005987321,   -0.987714827,   -0.156143367,\
-0.986128867,   -0.020066837,    0.164750189,\
-0.165861070,    0.154965088,   -0.973897636,\
0.000173775,    0.000615355, -197.939178467,\
131.691970825,  149.925262451,  137.324920654,\
150.283172607,  245.592010498,  -20.000000000 )
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/zoom_out/2_ret_BAQ00653.1_zoom_out.png
    load data/wzy/alphafold/ADC54950.1/ranked_0.pdb, 2_ret_ADC54950.1
    color 0xeeeeee, 2_ret_ADC54950.1
    cealign 2_ret_BAQ00653.1, 2_ret_ADC54950.1
    label n. CA and resi 249 and 2_ret_ADC54950.1, "%s-%s" % (resn, resi)
label n. CA and resi 305 and 2_ret_ADC54950.1, "%s-%s" % (resn, resi)
select cons_2_ret_ADC54950.1, resi 249 and 2_ret_ADC54950.1 or resi 305 and 2_ret_ADC54950.1
show licorice, cons_2_ret_ADC54950.1
    color atomic, (cons_2_ret_ADC54950.1 and not elem C)
    load data/wzy/alphafold/AAZ85718.1/ranked_0.pdb, 2_ret_AAZ85718.1
    color 0xeeeeee, 2_ret_AAZ85718.1
    cealign 2_ret_BAQ00653.1, 2_ret_AAZ85718.1
    label n. CA and resi 269 and 2_ret_AAZ85718.1, "%s-%s" % (resn, resi)
label n. CA and resi 329 and 2_ret_AAZ85718.1, "%s-%s" % (resn, resi)
select cons_2_ret_AAZ85718.1, resi 269 and 2_ret_AAZ85718.1 or resi 329 and 2_ret_AAZ85718.1
show licorice, cons_2_ret_AAZ85718.1
    color atomic, (cons_2_ret_AAZ85718.1 and not elem C)
    load data/wzy/alphafold/CDF66396.1/ranked_0.pdb, 9_ret_CDF66396.1
    color 0xeeeeee, 9_ret_CDF66396.1
    cealign ECA-Pol_ACH50550.1, 9_ret_CDF66396.1
    label n. CA and resi 168 and 9_ret_CDF66396.1, "%s-%s" % (resn, resi)
label n. CA and resi 171 and 9_ret_CDF66396.1, "%s-%s" % (resn, resi)
label n. CA and resi 185 and 9_ret_CDF66396.1, "%s-%s" % (resn, resi)
label n. CA and resi 228 and 9_ret_CDF66396.1, "%s-%s" % (resn, resi)
label n. CA and resi 284 and 9_ret_CDF66396.1, "%s-%s" % (resn, resi)
label n. CA and resi 345 and 9_ret_CDF66396.1, "%s-%s" % (resn, resi)
select cons_9_ret_CDF66396.1, resi 168 and 9_ret_CDF66396.1 or resi 171 and 9_ret_CDF66396.1 or resi 185 and 9_ret_CDF66396.1 or resi 228 and 9_ret_CDF66396.1 or resi 284 and 9_ret_CDF66396.1 or resi 345 and 9_ret_CDF66396.1
show licorice, cons_9_ret_CDF66396.1
    color atomic, (cons_9_ret_CDF66396.1 and not elem C)
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
    png /Users/idamei/phd/data/pymol-visualizations/figures/zoom_in_labels/9_ret_CDF66396.1_labels.png
    hide labels
    deselect
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/zoom_in/9_ret_CDF66396.1.png
    set_view (\
0.729139209,   -0.539685309,   -0.420827150,\
-0.620575964,   -0.780631423,   -0.074111812,\
-0.288515359,    0.315193832,   -0.904110909,\
0.000364890,    0.001526102, -194.636520386,\
139.692199707,  148.061309814,  146.306762695,\
146.723709106,  242.032669067,  -20.000000000 )
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/zoom_out/9_ret_CDF66396.1_zoom_out.png
    load data/wzy/alphafold/AAM27801.1/ranked_0.pdb, 9_ret_AAM27801.1
    color 0xeeeeee, 9_ret_AAM27801.1
    cealign 9_ret_CDF66396.1, 9_ret_AAM27801.1
    label n. CA and resi 173 and 9_ret_AAM27801.1, "%s-%s" % (resn, resi)
label n. CA and resi 176 and 9_ret_AAM27801.1, "%s-%s" % (resn, resi)
label n. CA and resi 191 and 9_ret_AAM27801.1, "%s-%s" % (resn, resi)
label n. CA and resi 234 and 9_ret_AAM27801.1, "%s-%s" % (resn, resi)
label n. CA and resi 291 and 9_ret_AAM27801.1, "%s-%s" % (resn, resi)
label n. CA and resi 349 and 9_ret_AAM27801.1, "%s-%s" % (resn, resi)
select cons_9_ret_AAM27801.1, resi 173 and 9_ret_AAM27801.1 or resi 176 and 9_ret_AAM27801.1 or resi 191 and 9_ret_AAM27801.1 or resi 234 and 9_ret_AAM27801.1 or resi 291 and 9_ret_AAM27801.1 or resi 349 and 9_ret_AAM27801.1
show licorice, cons_9_ret_AAM27801.1
    color atomic, (cons_9_ret_AAM27801.1 and not elem C)
    load data/wzy/alphafold/AAC45857.1/ranked_0.pdb, 9_ret_AAC45857.1
    color 0xeeeeee, 9_ret_AAC45857.1
    cealign 9_ret_CDF66396.1, 9_ret_AAC45857.1
    label n. CA and resi 173 and 9_ret_AAC45857.1, "%s-%s" % (resn, resi)
label n. CA and resi 176 and 9_ret_AAC45857.1, "%s-%s" % (resn, resi)
label n. CA and resi 191 and 9_ret_AAC45857.1, "%s-%s" % (resn, resi)
label n. CA and resi 234 and 9_ret_AAC45857.1, "%s-%s" % (resn, resi)
label n. CA and resi 291 and 9_ret_AAC45857.1, "%s-%s" % (resn, resi)
label n. CA and resi 349 and 9_ret_AAC45857.1, "%s-%s" % (resn, resi)
select cons_9_ret_AAC45857.1, resi 173 and 9_ret_AAC45857.1 or resi 176 and 9_ret_AAC45857.1 or resi 191 and 9_ret_AAC45857.1 or resi 234 and 9_ret_AAC45857.1 or resi 291 and 9_ret_AAC45857.1 or resi 349 and 9_ret_AAC45857.1
show licorice, cons_9_ret_AAC45857.1
    color atomic, (cons_9_ret_AAC45857.1 and not elem C)
    load data/wzy/alphafold/BAQ00795.1/ranked_0.pdb, 5_inv_BAQ00795.1
    color 0xeeeeee, 5_inv_BAQ00795.1
    cealign 6bar, 5_inv_BAQ00795.1
    label n. CA and resi 213 and 5_inv_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 276 and 5_inv_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 308 and 5_inv_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 312 and 5_inv_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 317 and 5_inv_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 366 and 5_inv_BAQ00795.1, "%s-%s" % (resn, resi)
select cons_5_inv_BAQ00795.1, resi 213 and 5_inv_BAQ00795.1 or resi 276 and 5_inv_BAQ00795.1 or resi 308 and 5_inv_BAQ00795.1 or resi 312 and 5_inv_BAQ00795.1 or resi 317 and 5_inv_BAQ00795.1 or resi 366 and 5_inv_BAQ00795.1
show licorice, cons_5_inv_BAQ00795.1
    color atomic, (cons_5_inv_BAQ00795.1 and not elem C)
    set_view (\
0.909521759,    0.342916876,   -0.234896868,\
0.188541532,   -0.844005525,   -0.502098501,\
-0.370433331,    0.412382066,   -0.832298398,\
-0.000308088,    0.000332791,  -69.858245850,\
122.150756836,  136.237243652,  138.611312866,\
22.201122284,  117.510002136,  -20.000000000 )
    disable
    enable 5_inv_BAQ00795.1
    remove hydrogens
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/zoom_in_labels/5_inv_BAQ00795.1_labels.png
    hide labels
    deselect
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/zoom_in/5_inv_BAQ00795.1.png
    set_view (\
0.909521759,    0.342916876,   -0.234896868,\
0.188541532,   -0.844005525,   -0.502098501,\
-0.370433331,    0.412382066,   -0.832298398,\
-0.000308088,    0.000332791, -228.880508423,\
122.150756836,  136.237243652,  138.611312866,\
181.223434448,  276.532379150,  -20.000000000 )
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/zoom_out/5_inv_BAQ00795.1_zoom_out.png
    load data/wzy/alphafold/BAQ01659.1/ranked_0.pdb, 5_inv_BAQ01659.1
    color 0xeeeeee, 5_inv_BAQ01659.1
    cealign 5_inv_BAQ00795.1, 5_inv_BAQ01659.1
    label n. CA and resi 211 and 5_inv_BAQ01659.1, "%s-%s" % (resn, resi)
label n. CA and resi 279 and 5_inv_BAQ01659.1, "%s-%s" % (resn, resi)
label n. CA and resi 315 and 5_inv_BAQ01659.1, "%s-%s" % (resn, resi)
label n. CA and resi 367 and 5_inv_BAQ01659.1, "%s-%s" % (resn, resi)
select cons_5_inv_BAQ01659.1, resi 211 and 5_inv_BAQ01659.1 or resi 279 and 5_inv_BAQ01659.1 or resi 315 and 5_inv_BAQ01659.1 or resi 367 and 5_inv_BAQ01659.1
show licorice, cons_5_inv_BAQ01659.1
    color atomic, (cons_5_inv_BAQ01659.1 and not elem C)
    load data/wzy/alphafold/BAQ02088.1/ranked_0.pdb, 5_inv_BAQ02088.1
    color 0xeeeeee, 5_inv_BAQ02088.1
    cealign 5_inv_BAQ00795.1, 5_inv_BAQ02088.1
    label n. CA and resi 228 and 5_inv_BAQ02088.1, "%s-%s" % (resn, resi)
label n. CA and resi 307 and 5_inv_BAQ02088.1, "%s-%s" % (resn, resi)
label n. CA and resi 339 and 5_inv_BAQ02088.1, "%s-%s" % (resn, resi)
label n. CA and resi 343 and 5_inv_BAQ02088.1, "%s-%s" % (resn, resi)
label n. CA and resi 348 and 5_inv_BAQ02088.1, "%s-%s" % (resn, resi)
label n. CA and resi 395 and 5_inv_BAQ02088.1, "%s-%s" % (resn, resi)
select cons_5_inv_BAQ02088.1, resi 228 and 5_inv_BAQ02088.1 or resi 307 and 5_inv_BAQ02088.1 or resi 339 and 5_inv_BAQ02088.1 or resi 343 and 5_inv_BAQ02088.1 or resi 348 and 5_inv_BAQ02088.1 or resi 395 and 5_inv_BAQ02088.1
show licorice, cons_5_inv_BAQ02088.1
    color atomic, (cons_5_inv_BAQ02088.1 and not elem C)
    load data/wzy/alphafold/ACA24754.1/ranked_0.pdb, 5_inv_ACA24754.1
    color 0xeeeeee, 5_inv_ACA24754.1
    cealign 5_inv_BAQ00795.1, 5_inv_ACA24754.1
    label n. CA and resi 217 and 5_inv_ACA24754.1, "%s-%s" % (resn, resi)
label n. CA and resi 294 and 5_inv_ACA24754.1, "%s-%s" % (resn, resi)
select cons_5_inv_ACA24754.1, resi 217 and 5_inv_ACA24754.1 or resi 294 and 5_inv_ACA24754.1
show licorice, cons_5_inv_ACA24754.1
    color atomic, (cons_5_inv_ACA24754.1 and not elem C)
    load data/wzy/alphafold/ACD37165.1/ranked_0.pdb, 4_inv_ACD37165.1
    color 0xeeeeee, 4_inv_ACD37165.1
    cealign 6bar, 4_inv_ACD37165.1
    label n. CA and resi 206 and 4_inv_ACD37165.1, "%s-%s" % (resn, resi)
label n. CA and resi 258 and 4_inv_ACD37165.1, "%s-%s" % (resn, resi)
label n. CA and resi 291 and 4_inv_ACD37165.1, "%s-%s" % (resn, resi)
label n. CA and resi 346 and 4_inv_ACD37165.1, "%s-%s" % (resn, resi)
select cons_4_inv_ACD37165.1, resi 206 and 4_inv_ACD37165.1 or resi 258 and 4_inv_ACD37165.1 or resi 291 and 4_inv_ACD37165.1 or resi 346 and 4_inv_ACD37165.1
show licorice, cons_4_inv_ACD37165.1
    color atomic, (cons_4_inv_ACD37165.1 and not elem C)
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
    png /Users/idamei/phd/data/pymol-visualizations/figures/zoom_in_labels/4_inv_ACD37165.1_labels.png
    hide labels
    deselect
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/zoom_in/4_inv_ACD37165.1.png
    set_view (\
0.889429271,    0.456946433,    0.010788713,\
0.301802963,   -0.569397390,   -0.764653385,\
-0.343263775,    0.683362782,   -0.644350410,\
-0.000595946,    0.000829549, -278.857788086,\
126.094604492,  149.727966309,  140.648681641,\
231.279754639,  326.589019775,  -20.000000000 )
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/zoom_out/4_inv_ACD37165.1_zoom_out.png
    load data/wzy/alphafold/AAM27615.1/ranked_0.pdb, 4_inv_AAM27615.1
    color 0xeeeeee, 4_inv_AAM27615.1
    cealign 4_inv_ACD37165.1, 4_inv_AAM27615.1
    label n. CA and resi 188 and 4_inv_AAM27615.1, "%s-%s" % (resn, resi)
label n. CA and resi 260 and 4_inv_AAM27615.1, "%s-%s" % (resn, resi)
label n. CA and resi 298 and 4_inv_AAM27615.1, "%s-%s" % (resn, resi)
label n. CA and resi 357 and 4_inv_AAM27615.1, "%s-%s" % (resn, resi)
select cons_4_inv_AAM27615.1, resi 188 and 4_inv_AAM27615.1 or resi 260 and 4_inv_AAM27615.1 or resi 298 and 4_inv_AAM27615.1 or resi 357 and 4_inv_AAM27615.1
show licorice, cons_4_inv_AAM27615.1
    color atomic, (cons_4_inv_AAM27615.1 and not elem C)
    load data/wzy/alphafold/CBN82200.1/ranked_0.pdb, 14_ret_CBN82200.1
    color 0xeeeeee, 14_ret_CBN82200.1
    cealign ECA-Pol_ACH50550.1, 14_ret_CBN82200.1
    label n. CA and resi 211 and 14_ret_CBN82200.1, "%s-%s" % (resn, resi)
label n. CA and resi 270 and 14_ret_CBN82200.1, "%s-%s" % (resn, resi)
select cons_14_ret_CBN82200.1, resi 211 and 14_ret_CBN82200.1 or resi 270 and 14_ret_CBN82200.1
show licorice, cons_14_ret_CBN82200.1
    color atomic, (cons_14_ret_CBN82200.1 and not elem C)
    set_view (\
0.909521759,    0.342916876,   -0.234896868,\
0.188541532,   -0.844005525,   -0.502098501,\
-0.370433331,    0.412382066,   -0.832298398,\
-0.000333475,    0.000392141,  -36.126316071,\
132.455230713,  156.783843994,  123.294189453,\
-11.519177437,   83.789772034,  -20.000000000 )
    disable
    enable 14_ret_CBN82200.1
    remove hydrogens
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/zoom_in_labels/14_ret_CBN82200.1_labels.png
    hide labels
    deselect
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/zoom_in/14_ret_CBN82200.1.png
    set_view (\
0.909521759,    0.342916876,   -0.234896868,\
0.188541532,   -0.844005525,   -0.502098501,\
-0.370433331,    0.412382066,   -0.832298398,\
-0.000333475,    0.000392141, -260.492706299,\
132.455230713,  156.783843994,  123.294189453,\
212.847290039,  308.156005859,  -20.000000000 )
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/zoom_out/14_ret_CBN82200.1_zoom_out.png
    load data/wzy/alphafold/AAT77177.1/ranked_0.pdb, 14_ret_AAT77177.1
    color 0xeeeeee, 14_ret_AAT77177.1
    cealign 14_ret_CBN82200.1, 14_ret_AAT77177.1
    label n. CA and resi 226 and 14_ret_AAT77177.1, "%s-%s" % (resn, resi)
label n. CA and resi 284 and 14_ret_AAT77177.1, "%s-%s" % (resn, resi)
select cons_14_ret_AAT77177.1, resi 226 and 14_ret_AAT77177.1 or resi 284 and 14_ret_AAT77177.1
show licorice, cons_14_ret_AAT77177.1
    color atomic, (cons_14_ret_AAT77177.1 and not elem C)
    load data/wzy/alphafold/CAI34124.1/ranked_0.pdb, 28_inv_CAI34124.1
    color 0xeeeeee, 28_inv_CAI34124.1
    cealign 6bar, 28_inv_CAI34124.1
    label n. CA and resi 267 and 28_inv_CAI34124.1, "%s-%s" % (resn, resi)
label n. CA and resi 301 and 28_inv_CAI34124.1, "%s-%s" % (resn, resi)
label n. CA and resi 304 and 28_inv_CAI34124.1, "%s-%s" % (resn, resi)
label n. CA and resi 325 and 28_inv_CAI34124.1, "%s-%s" % (resn, resi)
select cons_28_inv_CAI34124.1, resi 267 and 28_inv_CAI34124.1 or resi 301 and 28_inv_CAI34124.1 or resi 304 and 28_inv_CAI34124.1 or resi 325 and 28_inv_CAI34124.1
show licorice, cons_28_inv_CAI34124.1
    color atomic, (cons_28_inv_CAI34124.1 and not elem C)
    set_view (\
0.807978809,    0.347147375,    0.476079702,\
0.437643617,   -0.894584596,   -0.090431921,\
0.394503802,    0.281416863,   -0.874738336,\
-0.000240520,    0.000263177,  -55.850330353,\
114.833137512,  140.437637329,  137.535079956,\
8.213187218,  103.521896362,  -20.000000000 )
    disable
    enable 28_inv_CAI34124.1
    remove hydrogens
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/zoom_in_labels/28_inv_CAI34124.1_labels.png
    hide labels
    deselect
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/zoom_in/28_inv_CAI34124.1.png
    set_view (\
0.807978809,    0.347147375,    0.476079702,\
0.437643617,   -0.894584596,   -0.090431921,\
0.394503802,    0.281416863,   -0.874738336,\
-0.000240520,    0.000263177, -237.841018677,\
114.833137512,  140.437637329,  137.535079956,\
190.203933716,  285.512634277,  -20.000000000 )
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/zoom_out/28_inv_CAI34124.1_zoom_out.png
    load data/wzy/alphafold/AHB32490.1/ranked_0.pdb, 6_ret_AHB32490.1
    color 0xeeeeee, 6_ret_AHB32490.1
    cealign ECA-Pol_ACH50550.1, 6_ret_AHB32490.1
    label n. CA and resi 175 and 6_ret_AHB32490.1, "%s-%s" % (resn, resi)
label n. CA and resi 238 and 6_ret_AHB32490.1, "%s-%s" % (resn, resi)
label n. CA and resi 287 and 6_ret_AHB32490.1, "%s-%s" % (resn, resi)
label n. CA and resi 429 and 6_ret_AHB32490.1, "%s-%s" % (resn, resi)
select cons_6_ret_AHB32490.1, resi 175 and 6_ret_AHB32490.1 or resi 238 and 6_ret_AHB32490.1 or resi 287 and 6_ret_AHB32490.1 or resi 429 and 6_ret_AHB32490.1
show licorice, cons_6_ret_AHB32490.1
    color atomic, (cons_6_ret_AHB32490.1 and not elem C)
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
    png /Users/idamei/phd/data/pymol-visualizations/figures/zoom_in_labels/6_ret_AHB32490.1_labels.png
    hide labels
    deselect
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/zoom_in/6_ret_AHB32490.1.png
    set_view (\
0.645065784,    0.335653991,   -0.686459959,\
0.316698968,   -0.935001910,   -0.159580246,\
-0.695406854,   -0.114462890,   -0.709442794,\
-0.000555143,    0.000912797, -190.433761597,\
129.130661011,  155.730438232,  122.186187744,\
142.758056641,  238.067367554,  -20.000000000 )
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/zoom_out/6_ret_AHB32490.1_zoom_out.png
    load data/wzy/alphafold/CAI32772.1/ranked_0.pdb, 6_ret_CAI32772.1
    color 0xeeeeee, 6_ret_CAI32772.1
    cealign 6_ret_AHB32490.1, 6_ret_CAI32772.1
    label n. CA and resi 184 and 6_ret_CAI32772.1, "%s-%s" % (resn, resi)
label n. CA and resi 242 and 6_ret_CAI32772.1, "%s-%s" % (resn, resi)
label n. CA and resi 290 and 6_ret_CAI32772.1, "%s-%s" % (resn, resi)
label n. CA and resi 441 and 6_ret_CAI32772.1, "%s-%s" % (resn, resi)
select cons_6_ret_CAI32772.1, resi 184 and 6_ret_CAI32772.1 or resi 242 and 6_ret_CAI32772.1 or resi 290 and 6_ret_CAI32772.1 or resi 441 and 6_ret_CAI32772.1
show licorice, cons_6_ret_CAI32772.1
    color atomic, (cons_6_ret_CAI32772.1 and not elem C)
    load data/wzy/alphafold/AHB32411.1/ranked_0.pdb, 29_ret_AHB32411.1
    color 0xeeeeee, 29_ret_AHB32411.1
    cealign ECA-Pol_ACH50550.1, 29_ret_AHB32411.1
    label n. CA and resi 162 and 29_ret_AHB32411.1, "%s-%s" % (resn, resi)
label n. CA and resi 207 and 29_ret_AHB32411.1, "%s-%s" % (resn, resi)
label n. CA and resi 242 and 29_ret_AHB32411.1, "%s-%s" % (resn, resi)
label n. CA and resi 244 and 29_ret_AHB32411.1, "%s-%s" % (resn, resi)
label n. CA and resi 251 and 29_ret_AHB32411.1, "%s-%s" % (resn, resi)
select cons_29_ret_AHB32411.1, resi 162 and 29_ret_AHB32411.1 or resi 207 and 29_ret_AHB32411.1 or resi 242 and 29_ret_AHB32411.1 or resi 244 and 29_ret_AHB32411.1 or resi 251 and 29_ret_AHB32411.1
show licorice, cons_29_ret_AHB32411.1
    color atomic, (cons_29_ret_AHB32411.1 and not elem C)
    set_view (\
0.947395682,   -0.296990812,    0.119281441,\
-0.013032585,   -0.408186316,   -0.912800252,\
0.319781035,    0.863231659,   -0.390593350,\
-0.001610145,    0.000541467,  -76.890457153,\
128.515625000,  174.049591064,  130.184265137,\
29.342594147,  124.651344299,  -20.000000000 )
    disable
    enable 29_ret_AHB32411.1
    remove hydrogens
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/zoom_in_labels/29_ret_AHB32411.1_labels.png
    hide labels
    deselect
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/zoom_in/29_ret_AHB32411.1.png
    set_view (\
0.947395682,   -0.296990812,    0.119281441,\
-0.013032585,   -0.408186316,   -0.912800252,\
0.319781035,    0.863231659,   -0.390593350,\
-0.001610145,    0.000541467, -224.378707886,\
128.515625000,  174.049591064,  130.184265137,\
176.830886841,  272.139526367,  -20.000000000 )
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/zoom_out/29_ret_AHB32411.1_zoom_out.png
    load data/wzy/alphafold/CAI34254.1/ranked_0.pdb, 30_inv_CAI34254.1
    color 0xeeeeee, 30_inv_CAI34254.1
    cealign 6bar, 30_inv_CAI34254.1
    label n. CA and resi 171 and 30_inv_CAI34254.1, "%s-%s" % (resn, resi)
label n. CA and resi 182 and 30_inv_CAI34254.1, "%s-%s" % (resn, resi)
label n. CA and resi 183 and 30_inv_CAI34254.1, "%s-%s" % (resn, resi)
label n. CA and resi 189 and 30_inv_CAI34254.1, "%s-%s" % (resn, resi)
label n. CA and resi 272 and 30_inv_CAI34254.1, "%s-%s" % (resn, resi)
label n. CA and resi 277 and 30_inv_CAI34254.1, "%s-%s" % (resn, resi)
label n. CA and resi 281 and 30_inv_CAI34254.1, "%s-%s" % (resn, resi)
select cons_30_inv_CAI34254.1, resi 171 and 30_inv_CAI34254.1 or resi 182 and 30_inv_CAI34254.1 or resi 183 and 30_inv_CAI34254.1 or resi 189 and 30_inv_CAI34254.1 or resi 272 and 30_inv_CAI34254.1 or resi 277 and 30_inv_CAI34254.1 or resi 281 and 30_inv_CAI34254.1
show licorice, cons_30_inv_CAI34254.1
    color atomic, (cons_30_inv_CAI34254.1 and not elem C)
    set_view (\
0.952523112,    0.112399101,   -0.282934368,\
-0.072721787,   -0.818440437,   -0.569960356,\
-0.295632660,    0.563474298,   -0.771420062,\
-0.001890428,    0.000185851,  -87.485893250,\
135.495712280,  157.967346191,  146.221740723,\
40.358955383,  135.667678833,  -20.000000000 )
    disable
    enable 30_inv_CAI34254.1
    remove hydrogens
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/zoom_in_labels/30_inv_CAI34254.1_labels.png
    hide labels
    deselect
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/zoom_in/30_inv_CAI34254.1.png
    set_view (\
0.952523112,    0.112399101,   -0.282934368,\
-0.072721787,   -0.818440437,   -0.569960356,\
-0.295632660,    0.563474298,   -0.771420062,\
-0.001890428,    0.000185851, -251.400680542,\
135.495712280,  157.967346191,  146.221740723,\
204.273757935,  299.582366943,  -20.000000000 )
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/zoom_out/30_inv_CAI34254.1_zoom_out.png
    load data/wzy/alphafold/CAI34198.1/ranked_0.pdb, 30_inv_CAI34198.1
    color 0xeeeeee, 30_inv_CAI34198.1
    cealign 30_inv_CAI34254.1, 30_inv_CAI34198.1
    label n. CA and resi 171 and 30_inv_CAI34198.1, "%s-%s" % (resn, resi)
label n. CA and resi 182 and 30_inv_CAI34198.1, "%s-%s" % (resn, resi)
label n. CA and resi 183 and 30_inv_CAI34198.1, "%s-%s" % (resn, resi)
label n. CA and resi 189 and 30_inv_CAI34198.1, "%s-%s" % (resn, resi)
label n. CA and resi 273 and 30_inv_CAI34198.1, "%s-%s" % (resn, resi)
label n. CA and resi 278 and 30_inv_CAI34198.1, "%s-%s" % (resn, resi)
label n. CA and resi 282 and 30_inv_CAI34198.1, "%s-%s" % (resn, resi)
select cons_30_inv_CAI34198.1, resi 171 and 30_inv_CAI34198.1 or resi 182 and 30_inv_CAI34198.1 or resi 183 and 30_inv_CAI34198.1 or resi 189 and 30_inv_CAI34198.1 or resi 273 and 30_inv_CAI34198.1 or resi 278 and 30_inv_CAI34198.1 or resi 282 and 30_inv_CAI34198.1
show licorice, cons_30_inv_CAI34198.1
    color atomic, (cons_30_inv_CAI34198.1 and not elem C)
    load data/wzy/alphafold/CAI34217.1/ranked_0.pdb, 30_inv_CAI34217.1
    color 0xeeeeee, 30_inv_CAI34217.1
    cealign 30_inv_CAI34254.1, 30_inv_CAI34217.1
    label n. CA and resi 175 and 30_inv_CAI34217.1, "%s-%s" % (resn, resi)
label n. CA and resi 186 and 30_inv_CAI34217.1, "%s-%s" % (resn, resi)
label n. CA and resi 187 and 30_inv_CAI34217.1, "%s-%s" % (resn, resi)
label n. CA and resi 193 and 30_inv_CAI34217.1, "%s-%s" % (resn, resi)
label n. CA and resi 276 and 30_inv_CAI34217.1, "%s-%s" % (resn, resi)
label n. CA and resi 281 and 30_inv_CAI34217.1, "%s-%s" % (resn, resi)
label n. CA and resi 285 and 30_inv_CAI34217.1, "%s-%s" % (resn, resi)
select cons_30_inv_CAI34217.1, resi 175 and 30_inv_CAI34217.1 or resi 186 and 30_inv_CAI34217.1 or resi 187 and 30_inv_CAI34217.1 or resi 193 and 30_inv_CAI34217.1 or resi 276 and 30_inv_CAI34217.1 or resi 281 and 30_inv_CAI34217.1 or resi 285 and 30_inv_CAI34217.1
show licorice, cons_30_inv_CAI34217.1
    color atomic, (cons_30_inv_CAI34217.1 and not elem C)
    @src/pymol-visualization/nicify.pml
disable
    enable 1_inv_AHB32215.1 1_inv_CAI34008.1 1_inv_ACH97162.1
    color atomic, cons_1_inv_AHB32215.1
    color atomic, cons_1_inv_CAI34008.1
    color atomic, cons_1_inv_ACH97162.1
    hide labels
    set_view (\
-0.758451283,    0.533311427,    0.374606192,\
0.640804529,    0.505474091,    0.577784419,\
0.118783973,    0.678275824,   -0.725136638,\
-0.003340695,   -0.004331588, -174.446716309,\
140.969085693,  146.970245361,  137.043060303,\
126.249542236,  221.558456421,  -20.000000000 )
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/three_from_one_family_zoom_out2.png
    set_view (\
-0.760375857,    0.530563831,    0.374606192,\
0.638971508,    0.507789254,    0.577784419,\
0.116329186,    0.678701162,   -0.725136638,\
-0.003340695,   -0.004331588,  -71.985908508,\
140.969085693,  146.970245361,  137.043060303,\
23.788736343,  119.097625732,  -20.000000000 )
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/three_from_one_family2.png
    show labels
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures/three_from_one_family_labels2.png
    