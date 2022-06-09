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

load data/wzy/alphafold/2201200806-polymerases_AlphaFold_batch1/af_out/EHX11459.1/ranked_0.pdb, EHX11459.1
color silver, EHX11459.1
select cons_EHX11459.1, resi 16 and EHX11459.1 or resi 54 and EHX11459.1 or resi 84 and EHX11459.1 or resi 91 and EHX11459.1
show licorice, cons_EHX11459.1
color atomic, cons_EHX11459.1
cealign 7tpg, EHX11459.1


load data/wzy/alphafold/2202060002-wzy_100/af_out/AHB32411.1/ranked_0.pdb, AHB32411.1
color silver, AHB32411.1
select cons_AHB32411.1, resi 162 and AHB32411.1 or resi 207 and AHB32411.1 or resi 244 and AHB32411.1 or resi 251 and AHB32411.1
show licorice, cons_AHB32411.1
color atomic, cons_AHB32411.1
cealign 7tpg, AHB32411.1


load data/wzy/alphafold/2205031317-wzy/af_out/CAI34124.1/ranked_0.pdb, CAI34124.1
color silver, CAI34124.1
select cons_CAI34124.1, resi 267 and CAI34124.1 or resi 304 and CAI34124.1 or resi 325 and CAI34124.1
show licorice, cons_CAI34124.1
color atomic, cons_CAI34124.1
cealign 7tpg, CAI34124.1


load data/wzy/alphafold/2205031317-wzy/af_out/CDF66396.1/ranked_0.pdb, CDF66396.1
color silver, CDF66396.1
select cons_CDF66396.1, resi 168 and CDF66396.1 or resi 171 and CDF66396.1 or resi 185 and CDF66396.1 or resi 284 and CDF66396.1 or resi 345 and CDF66396.1
show licorice, cons_CDF66396.1
color atomic, cons_CDF66396.1
cealign 7tpg, CDF66396.1


load data/wzy/alphafold/2202060002-wzy_100/af_out/AAA97573.1/ranked_0.pdb, AAA97573.1
color silver, AAA97573.1
select cons_AAA97573.1, resi 173 and AAA97573.1 or resi 176 and AAA97573.1 or resi 191 and AAA97573.1 or resi 291 and AAA97573.1 or resi 349 and AAA97573.1
show licorice, cons_AAA97573.1
color atomic, cons_AAA97573.1
cealign 7tpg, AAA97573.1


load data/wzy/alphafold/2202060002-wzy_100/af_out/AAC45857.1/ranked_0.pdb, AAC45857.1
color silver, AAC45857.1
select cons_AAC45857.1, resi 173 and AAC45857.1 or resi 176 and AAC45857.1 or resi 191 and AAC45857.1 or resi 291 and AAC45857.1 or resi 349 and AAC45857.1
show licorice, cons_AAC45857.1
color atomic, cons_AAC45857.1
cealign 7tpg, AAC45857.1


load data/wzy/alphafold/2202060002-wzy_100/af_out/AAK64372.1/ranked_0.pdb, AAK64372.1
color silver, AAK64372.1
select cons_AAK64372.1, resi 51 and AAK64372.1 or resi 57 and AAK64372.1 or resi 61 and AAK64372.1 or resi 142 and AAK64372.1 or resi 176 and AAK64372.1 or resi 292 and AAK64372.1
show licorice, cons_AAK64372.1
color atomic, cons_AAK64372.1
cealign 7tpg, AAK64372.1


load data/wzy/alphafold/2202060002-wzy_100/af_out/ACA24821.1/ranked_0.pdb, ACA24821.1
color silver, ACA24821.1
select cons_ACA24821.1, resi 48 and ACA24821.1 or resi 54 and ACA24821.1 or resi 58 and ACA24821.1 or resi 134 and ACA24821.1 or resi 168 and ACA24821.1 or resi 290 and ACA24821.1
show licorice, cons_ACA24821.1
color atomic, cons_ACA24821.1
cealign 7tpg, ACA24821.1


load data/wzy/alphafold/2205031317-wzy/af_out/WP_163049471.1/ranked_0.pdb, WP_163049471.1
color silver, WP_163049471.1
select cons_WP_163049471.1, resi 41 and WP_163049471.1 or resi 48 and WP_163049471.1 or resi 52 and WP_163049471.1 or resi 136 and WP_163049471.1 or resi 170 and WP_163049471.1 or resi 287 and WP_163049471.1
show licorice, cons_WP_163049471.1
color atomic, cons_WP_163049471.1
cealign 7tpg, WP_163049471.1


load data/wzy/alphafold/2202060002-wzy_100/af_out/AHB32861.1/ranked_0.pdb, AHB32861.1
color silver, AHB32861.1
select cons_AHB32861.1, resi 42 and AHB32861.1 or resi 48 and AHB32861.1 or resi 52 and AHB32861.1 or resi 136 and AHB32861.1 or resi 137 and AHB32861.1 or resi 170 and AHB32861.1 or resi 287 and AHB32861.1
show licorice, cons_AHB32861.1
color atomic, cons_AHB32861.1
cealign 7tpg, AHB32861.1


load data/wzy/alphafold/2202060002-wzy_100/af_out/AHB32215.1/ranked_0.pdb, AHB32215.1
color silver, AHB32215.1
select cons_AHB32215.1, resi 43 and AHB32215.1 or resi 49 and AHB32215.1 or resi 53 and AHB32215.1 or resi 137 and AHB32215.1 or resi 138 and AHB32215.1 or resi 171 and AHB32215.1 or resi 283 and AHB32215.1
show licorice, cons_AHB32215.1
color atomic, cons_AHB32215.1
cealign 7tpg, AHB32215.1


load data/wzy/alphafold/2202060002-wzy_100/af_out/AAT77177.1/ranked_0.pdb, AAT77177.1
color silver, AAT77177.1
select cons_AAT77177.1, resi 226 and AAT77177.1 or resi 284 and AAT77177.1 or resi 387 and AAT77177.1
show licorice, cons_AAT77177.1
color atomic, cons_AAT77177.1
cealign 7tpg, AAT77177.1


load data/wzy/alphafold/2205031317-wzy_missing/af_out/ACH50550.1/ranked_0.pdb, ACH50550.1
color silver, ACH50550.1
select cons_ACH50550.1, resi 89 and ACH50550.1 or resi 145 and ACH50550.1 or resi 197 and ACH50550.1 or resi 204 and ACH50550.1 or resi 247 and ACH50550.1 or resi 248 and ACH50550.1 or resi 270 and ACH50550.1 or resi 315 and ACH50550.1 or resi 321 and ACH50550.1 or resi 336 and ACH50550.1 or resi 365 and ACH50550.1 or resi 399 and ACH50550.1
show licorice, cons_ACH50550.1
color atomic, cons_ACH50550.1
cealign 7tpg, ACH50550.1


load data/wzy/alphafold/2202060002-wzy_100/af_out/BAQ00795.1/ranked_0.pdb, BAQ00795.1
color silver, BAQ00795.1
select cons_BAQ00795.1, resi 30 and BAQ00795.1 or resi 38 and BAQ00795.1 or resi 95 and BAQ00795.1 or resi 97 and BAQ00795.1 or resi 129 and BAQ00795.1 or resi 159 and BAQ00795.1 or resi 160 and BAQ00795.1 or resi 161 and BAQ00795.1 or resi 163 and BAQ00795.1 or resi 164 and BAQ00795.1 or resi 169 and BAQ00795.1 or resi 177 and BAQ00795.1 or resi 213 and BAQ00795.1 or resi 222 and BAQ00795.1 or resi 226 and BAQ00795.1 or resi 232 and BAQ00795.1 or resi 258 and BAQ00795.1 or resi 261 and BAQ00795.1 or resi 265 and BAQ00795.1 or resi 276 and BAQ00795.1 or resi 297 and BAQ00795.1 or resi 300 and BAQ00795.1 or resi 307 and BAQ00795.1 or resi 308 and BAQ00795.1 or resi 312 and BAQ00795.1 or resi 313 and BAQ00795.1 or resi 317 and BAQ00795.1 or resi 318 and BAQ00795.1 or resi 321 and BAQ00795.1 or resi 326 and BAQ00795.1 or resi 355 and BAQ00795.1 or resi 366 and BAQ00795.1 or resi 368 and BAQ00795.1
show licorice, cons_BAQ00795.1
color atomic, cons_BAQ00795.1
cealign 7tpg, BAQ00795.1


load data/wzy/alphafold/2202060002-wzy_100/af_out/ADC54967.1/ranked_0.pdb, ADC54967.1
color silver, ADC54967.1
select cons_ADC54967.1, resi 50 and ADC54967.1 or resi 142 and ADC54967.1 or resi 174 and ADC54967.1 or resi 233 and ADC54967.1 or resi 300 and ADC54967.1
show licorice, cons_ADC54967.1
color atomic, cons_ADC54967.1
cealign 7tpg, ADC54967.1


load data/wzy/alphafold/2202060002-wzy_100/af_out/CAI34369.1/ranked_0.pdb, CAI34369.1
color silver, CAI34369.1
select cons_CAI34369.1, resi 151 and CAI34369.1 or resi 268 and CAI34369.1 or resi 308 and CAI34369.1
show licorice, cons_CAI34369.1
color atomic, cons_CAI34369.1
cealign 7tpg, CAI34369.1


load data/wzy/alphafold/2202060002-wzy_100/af_out/CAI33309.1/ranked_0.pdb, CAI33309.1
color silver, CAI33309.1
select cons_CAI33309.1, resi 150 and CAI33309.1 or resi 266 and CAI33309.1 or resi 304 and CAI33309.1
show licorice, cons_CAI33309.1
color atomic, cons_CAI33309.1
cealign 7tpg, CAI33309.1


load data/wzy/alphafold/2202060002-wzy_100/af_out/CAI34217.1/ranked_0.pdb, CAI34217.1
color silver, CAI34217.1
select cons_CAI34217.1, resi 187 and CAI34217.1 or resi 193 and CAI34217.1 or resi 281 and CAI34217.1
show licorice, cons_CAI34217.1
color atomic, cons_CAI34217.1
cealign 7tpg, CAI34217.1


load data/wzy/alphafold/2202060002-wzy_100/af_out/CAI34254.1/ranked_0.pdb, CAI34254.1
color silver, CAI34254.1
select cons_CAI34254.1, resi 183 and CAI34254.1 or resi 189 and CAI34254.1 or resi 277 and CAI34254.1
show licorice, cons_CAI34254.1
color atomic, cons_CAI34254.1
cealign 7tpg, CAI34254.1


load data/wzy/alphafold/2202060002-wzy_100/af_out/CAI34198.1/ranked_0.pdb, CAI34198.1
color silver, CAI34198.1
select cons_CAI34198.1, resi 183 and CAI34198.1 or resi 189 and CAI34198.1 or resi 278 and CAI34198.1
show licorice, cons_CAI34198.1
color atomic, cons_CAI34198.1
cealign 7tpg, CAI34198.1


load data/wzy/alphafold/2202060002-wzy_100/af_out/BAQ02088.1/ranked_0.pdb, BAQ02088.1
color silver, BAQ02088.1
select cons_BAQ02088.1, resi 228 and BAQ02088.1 or resi 307 and BAQ02088.1 or resi 343 and BAQ02088.1 or resi 348 and BAQ02088.1
show licorice, cons_BAQ02088.1
color atomic, cons_BAQ02088.1
cealign 7tpg, BAQ02088.1


load data/wzy/alphafold/2205031317-wzy/af_out/ACA24754.1/ranked_0.pdb, ACA24754.1
color silver, ACA24754.1
select cons_ACA24754.1, resi 217 and ACA24754.1 or resi 294 and ACA24754.1 or resi 328 and ACA24754.1 or resi 333 and ACA24754.1
show licorice, cons_ACA24754.1
color atomic, cons_ACA24754.1
cealign 7tpg, ACA24754.1

