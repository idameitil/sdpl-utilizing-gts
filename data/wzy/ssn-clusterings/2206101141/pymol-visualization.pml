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

load data/wzy/alphafold/2205031317-wzy/af_out/ABI55342.1/ranked_0.pdb, 0051_75_ABI55342.1
color silver, 0051_75_ABI55342.1
label n. CA and resi 34 and 0051_75_ABI55342.1, "%s-%s" % (resn, resi)
label n. CA and resi 58 and 0051_75_ABI55342.1, "%s-%s" % (resn, resi)
label n. CA and resi 75 and 0051_75_ABI55342.1, "%s-%s" % (resn, resi)
label n. CA and resi 85 and 0051_75_ABI55342.1, "%s-%s" % (resn, resi)
label n. CA and resi 112 and 0051_75_ABI55342.1, "%s-%s" % (resn, resi)
label n. CA and resi 184 and 0051_75_ABI55342.1, "%s-%s" % (resn, resi)
label n. CA and resi 185 and 0051_75_ABI55342.1, "%s-%s" % (resn, resi)
label n. CA and resi 214 and 0051_75_ABI55342.1, "%s-%s" % (resn, resi)
label n. CA and resi 272 and 0051_75_ABI55342.1, "%s-%s" % (resn, resi)
label n. CA and resi 336 and 0051_75_ABI55342.1, "%s-%s" % (resn, resi)
select cons_ABI55342.1, resi 34 and 0051_75_ABI55342.1 or resi 58 and 0051_75_ABI55342.1 or resi 75 and 0051_75_ABI55342.1 or resi 85 and 0051_75_ABI55342.1 or resi 112 and 0051_75_ABI55342.1 or resi 184 and 0051_75_ABI55342.1 or resi 185 and 0051_75_ABI55342.1 or resi 214 and 0051_75_ABI55342.1 or resi 272 and 0051_75_ABI55342.1 or resi 336 and 0051_75_ABI55342.1
show licorice, cons_ABI55342.1
color atomic, cons_ABI55342.1
cealign 7tpg, 0051_75_ABI55342.1


load data/wzy/alphafold/2202060002-wzy_100/af_out/AHB32687.1/ranked_0.pdb, 0051_75_AHB32687.1
color silver, 0051_75_AHB32687.1
label n. CA and resi 32 and 0051_75_AHB32687.1, "%s-%s" % (resn, resi)
label n. CA and resi 55 and 0051_75_AHB32687.1, "%s-%s" % (resn, resi)
label n. CA and resi 72 and 0051_75_AHB32687.1, "%s-%s" % (resn, resi)
label n. CA and resi 83 and 0051_75_AHB32687.1, "%s-%s" % (resn, resi)
label n. CA and resi 111 and 0051_75_AHB32687.1, "%s-%s" % (resn, resi)
label n. CA and resi 184 and 0051_75_AHB32687.1, "%s-%s" % (resn, resi)
label n. CA and resi 185 and 0051_75_AHB32687.1, "%s-%s" % (resn, resi)
label n. CA and resi 218 and 0051_75_AHB32687.1, "%s-%s" % (resn, resi)
label n. CA and resi 272 and 0051_75_AHB32687.1, "%s-%s" % (resn, resi)
label n. CA and resi 335 and 0051_75_AHB32687.1, "%s-%s" % (resn, resi)
select cons_AHB32687.1, resi 32 and 0051_75_AHB32687.1 or resi 55 and 0051_75_AHB32687.1 or resi 72 and 0051_75_AHB32687.1 or resi 83 and 0051_75_AHB32687.1 or resi 111 and 0051_75_AHB32687.1 or resi 184 and 0051_75_AHB32687.1 or resi 185 and 0051_75_AHB32687.1 or resi 218 and 0051_75_AHB32687.1 or resi 272 and 0051_75_AHB32687.1 or resi 335 and 0051_75_AHB32687.1
show licorice, cons_AHB32687.1
color atomic, cons_AHB32687.1
cealign 7tpg, 0051_75_AHB32687.1


load data/wzy/alphafold/2202060002-wzy_100/af_out/BAQ01743.1/ranked_0.pdb, 0051_75_BAQ01743.1
color silver, 0051_75_BAQ01743.1
label n. CA and resi 32 and 0051_75_BAQ01743.1, "%s-%s" % (resn, resi)
label n. CA and resi 55 and 0051_75_BAQ01743.1, "%s-%s" % (resn, resi)
label n. CA and resi 72 and 0051_75_BAQ01743.1, "%s-%s" % (resn, resi)
label n. CA and resi 82 and 0051_75_BAQ01743.1, "%s-%s" % (resn, resi)
label n. CA and resi 109 and 0051_75_BAQ01743.1, "%s-%s" % (resn, resi)
label n. CA and resi 181 and 0051_75_BAQ01743.1, "%s-%s" % (resn, resi)
label n. CA and resi 182 and 0051_75_BAQ01743.1, "%s-%s" % (resn, resi)
label n. CA and resi 215 and 0051_75_BAQ01743.1, "%s-%s" % (resn, resi)
label n. CA and resi 268 and 0051_75_BAQ01743.1, "%s-%s" % (resn, resi)
label n. CA and resi 330 and 0051_75_BAQ01743.1, "%s-%s" % (resn, resi)
select cons_BAQ01743.1, resi 32 and 0051_75_BAQ01743.1 or resi 55 and 0051_75_BAQ01743.1 or resi 72 and 0051_75_BAQ01743.1 or resi 82 and 0051_75_BAQ01743.1 or resi 109 and 0051_75_BAQ01743.1 or resi 181 and 0051_75_BAQ01743.1 or resi 182 and 0051_75_BAQ01743.1 or resi 215 and 0051_75_BAQ01743.1 or resi 268 and 0051_75_BAQ01743.1 or resi 330 and 0051_75_BAQ01743.1
show licorice, cons_BAQ01743.1
color atomic, cons_BAQ01743.1
cealign 7tpg, 0051_75_BAQ01743.1


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


load data/wzy/alphafold/2202060002-wzy_100/af_out/AHB32215.1/ranked_0.pdb, 0240_9_AHB32215.1
color silver, 0240_9_AHB32215.1
label n. CA and resi 43 and 0240_9_AHB32215.1, "%s-%s" % (resn, resi)
label n. CA and resi 49 and 0240_9_AHB32215.1, "%s-%s" % (resn, resi)
label n. CA and resi 53 and 0240_9_AHB32215.1, "%s-%s" % (resn, resi)
label n. CA and resi 137 and 0240_9_AHB32215.1, "%s-%s" % (resn, resi)
label n. CA and resi 138 and 0240_9_AHB32215.1, "%s-%s" % (resn, resi)
label n. CA and resi 171 and 0240_9_AHB32215.1, "%s-%s" % (resn, resi)
label n. CA and resi 219 and 0240_9_AHB32215.1, "%s-%s" % (resn, resi)
label n. CA and resi 232 and 0240_9_AHB32215.1, "%s-%s" % (resn, resi)
label n. CA and resi 282 and 0240_9_AHB32215.1, "%s-%s" % (resn, resi)
label n. CA and resi 283 and 0240_9_AHB32215.1, "%s-%s" % (resn, resi)
select cons_AHB32215.1, resi 43 and 0240_9_AHB32215.1 or resi 49 and 0240_9_AHB32215.1 or resi 53 and 0240_9_AHB32215.1 or resi 137 and 0240_9_AHB32215.1 or resi 138 and 0240_9_AHB32215.1 or resi 171 and 0240_9_AHB32215.1 or resi 219 and 0240_9_AHB32215.1 or resi 232 and 0240_9_AHB32215.1 or resi 282 and 0240_9_AHB32215.1 or resi 283 and 0240_9_AHB32215.1
show licorice, cons_AHB32215.1
color atomic, cons_AHB32215.1
cealign 7tpg, 0240_9_AHB32215.1


load data/wzy/alphafold/2201200806-polymerases_AlphaFold_batch1/af_out/AHB32490.1/ranked_0.pdb, 0083_44_AHB32490.1
color silver, 0083_44_AHB32490.1
label n. CA and resi 175 and 0083_44_AHB32490.1, "%s-%s" % (resn, resi)
label n. CA and resi 238 and 0083_44_AHB32490.1, "%s-%s" % (resn, resi)
label n. CA and resi 287 and 0083_44_AHB32490.1, "%s-%s" % (resn, resi)
select cons_AHB32490.1, resi 175 and 0083_44_AHB32490.1 or resi 238 and 0083_44_AHB32490.1 or resi 287 and 0083_44_AHB32490.1
show licorice, cons_AHB32490.1
color atomic, cons_AHB32490.1
cealign 7tpg, 0083_44_AHB32490.1


load data/wzy/alphafold/2202060002-wzy_100/af_out/ACD37014.1/ranked_0.pdb, 0066_12_ACD37014.1
color silver, 0066_12_ACD37014.1
label n. CA and resi 123 and 0066_12_ACD37014.1, "%s-%s" % (resn, resi)
label n. CA and resi 149 and 0066_12_ACD37014.1, "%s-%s" % (resn, resi)
label n. CA and resi 156 and 0066_12_ACD37014.1, "%s-%s" % (resn, resi)
label n. CA and resi 157 and 0066_12_ACD37014.1, "%s-%s" % (resn, resi)
label n. CA and resi 158 and 0066_12_ACD37014.1, "%s-%s" % (resn, resi)
label n. CA and resi 197 and 0066_12_ACD37014.1, "%s-%s" % (resn, resi)
label n. CA and resi 198 and 0066_12_ACD37014.1, "%s-%s" % (resn, resi)
label n. CA and resi 247 and 0066_12_ACD37014.1, "%s-%s" % (resn, resi)
label n. CA and resi 249 and 0066_12_ACD37014.1, "%s-%s" % (resn, resi)
label n. CA and resi 253 and 0066_12_ACD37014.1, "%s-%s" % (resn, resi)
label n. CA and resi 290 and 0066_12_ACD37014.1, "%s-%s" % (resn, resi)
label n. CA and resi 299 and 0066_12_ACD37014.1, "%s-%s" % (resn, resi)
select cons_ACD37014.1, resi 123 and 0066_12_ACD37014.1 or resi 149 and 0066_12_ACD37014.1 or resi 156 and 0066_12_ACD37014.1 or resi 157 and 0066_12_ACD37014.1 or resi 158 and 0066_12_ACD37014.1 or resi 197 and 0066_12_ACD37014.1 or resi 198 and 0066_12_ACD37014.1 or resi 247 and 0066_12_ACD37014.1 or resi 249 and 0066_12_ACD37014.1 or resi 253 and 0066_12_ACD37014.1 or resi 290 and 0066_12_ACD37014.1 or resi 299 and 0066_12_ACD37014.1
show licorice, cons_ACD37014.1
color atomic, cons_ACD37014.1
cealign 7tpg, 0066_12_ACD37014.1


load data/wzy/alphafold/2201200806-polymerases_AlphaFold_batch1/af_out/AHB32538.1/ranked_0.pdb, 0066_12_AHB32538.1
color silver, 0066_12_AHB32538.1
label n. CA and resi 141 and 0066_12_AHB32538.1, "%s-%s" % (resn, resi)
label n. CA and resi 155 and 0066_12_AHB32538.1, "%s-%s" % (resn, resi)
label n. CA and resi 162 and 0066_12_AHB32538.1, "%s-%s" % (resn, resi)
label n. CA and resi 163 and 0066_12_AHB32538.1, "%s-%s" % (resn, resi)
label n. CA and resi 164 and 0066_12_AHB32538.1, "%s-%s" % (resn, resi)
label n. CA and resi 205 and 0066_12_AHB32538.1, "%s-%s" % (resn, resi)
label n. CA and resi 206 and 0066_12_AHB32538.1, "%s-%s" % (resn, resi)
label n. CA and resi 258 and 0066_12_AHB32538.1, "%s-%s" % (resn, resi)
label n. CA and resi 260 and 0066_12_AHB32538.1, "%s-%s" % (resn, resi)
label n. CA and resi 264 and 0066_12_AHB32538.1, "%s-%s" % (resn, resi)
label n. CA and resi 302 and 0066_12_AHB32538.1, "%s-%s" % (resn, resi)
label n. CA and resi 311 and 0066_12_AHB32538.1, "%s-%s" % (resn, resi)
select cons_AHB32538.1, resi 141 and 0066_12_AHB32538.1 or resi 155 and 0066_12_AHB32538.1 or resi 162 and 0066_12_AHB32538.1 or resi 163 and 0066_12_AHB32538.1 or resi 164 and 0066_12_AHB32538.1 or resi 205 and 0066_12_AHB32538.1 or resi 206 and 0066_12_AHB32538.1 or resi 258 and 0066_12_AHB32538.1 or resi 260 and 0066_12_AHB32538.1 or resi 264 and 0066_12_AHB32538.1 or resi 302 and 0066_12_AHB32538.1 or resi 311 and 0066_12_AHB32538.1
show licorice, cons_AHB32538.1
color atomic, cons_AHB32538.1
cealign 7tpg, 0066_12_AHB32538.1


load data/wzy/alphafold/2202060002-wzy_100/af_out/ACD37157.1/ranked_0.pdb, 0066_12_ACD37157.1
color silver, 0066_12_ACD37157.1
label n. CA and resi 137 and 0066_12_ACD37157.1, "%s-%s" % (resn, resi)
label n. CA and resi 152 and 0066_12_ACD37157.1, "%s-%s" % (resn, resi)
label n. CA and resi 159 and 0066_12_ACD37157.1, "%s-%s" % (resn, resi)
label n. CA and resi 160 and 0066_12_ACD37157.1, "%s-%s" % (resn, resi)
label n. CA and resi 161 and 0066_12_ACD37157.1, "%s-%s" % (resn, resi)
label n. CA and resi 201 and 0066_12_ACD37157.1, "%s-%s" % (resn, resi)
label n. CA and resi 202 and 0066_12_ACD37157.1, "%s-%s" % (resn, resi)
label n. CA and resi 254 and 0066_12_ACD37157.1, "%s-%s" % (resn, resi)
label n. CA and resi 256 and 0066_12_ACD37157.1, "%s-%s" % (resn, resi)
label n. CA and resi 260 and 0066_12_ACD37157.1, "%s-%s" % (resn, resi)
label n. CA and resi 297 and 0066_12_ACD37157.1, "%s-%s" % (resn, resi)
label n. CA and resi 306 and 0066_12_ACD37157.1, "%s-%s" % (resn, resi)
select cons_ACD37157.1, resi 137 and 0066_12_ACD37157.1 or resi 152 and 0066_12_ACD37157.1 or resi 159 and 0066_12_ACD37157.1 or resi 160 and 0066_12_ACD37157.1 or resi 161 and 0066_12_ACD37157.1 or resi 201 and 0066_12_ACD37157.1 or resi 202 and 0066_12_ACD37157.1 or resi 254 and 0066_12_ACD37157.1 or resi 256 and 0066_12_ACD37157.1 or resi 260 and 0066_12_ACD37157.1 or resi 297 and 0066_12_ACD37157.1 or resi 306 and 0066_12_ACD37157.1
show licorice, cons_ACD37157.1
color atomic, cons_ACD37157.1
cealign 7tpg, 0066_12_ACD37157.1


load data/wzy/alphafold/2205031317-wzy/af_out/AAM27615.1/ranked_0.pdb, 0071_67_AAM27615.1
color silver, 0071_67_AAM27615.1
label n. CA and resi 187 and 0071_67_AAM27615.1, "%s-%s" % (resn, resi)
label n. CA and resi 188 and 0071_67_AAM27615.1, "%s-%s" % (resn, resi)
label n. CA and resi 260 and 0071_67_AAM27615.1, "%s-%s" % (resn, resi)
label n. CA and resi 263 and 0071_67_AAM27615.1, "%s-%s" % (resn, resi)
label n. CA and resi 289 and 0071_67_AAM27615.1, "%s-%s" % (resn, resi)
label n. CA and resi 298 and 0071_67_AAM27615.1, "%s-%s" % (resn, resi)
label n. CA and resi 301 and 0071_67_AAM27615.1, "%s-%s" % (resn, resi)
select cons_AAM27615.1, resi 187 and 0071_67_AAM27615.1 or resi 188 and 0071_67_AAM27615.1 or resi 260 and 0071_67_AAM27615.1 or resi 263 and 0071_67_AAM27615.1 or resi 289 and 0071_67_AAM27615.1 or resi 298 and 0071_67_AAM27615.1 or resi 301 and 0071_67_AAM27615.1
show licorice, cons_AAM27615.1
color atomic, cons_AAM27615.1
cealign 7tpg, 0071_67_AAM27615.1


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


load data/wzy/alphafold/2202060002-wzy_100/af_out/CAI34217.1/ranked_0.pdb, 0119_39_CAI34217.1
color silver, 0119_39_CAI34217.1
label n. CA and resi 186 and 0119_39_CAI34217.1, "%s-%s" % (resn, resi)
label n. CA and resi 187 and 0119_39_CAI34217.1, "%s-%s" % (resn, resi)
label n. CA and resi 193 and 0119_39_CAI34217.1, "%s-%s" % (resn, resi)
label n. CA and resi 281 and 0119_39_CAI34217.1, "%s-%s" % (resn, resi)
select cons_CAI34217.1, resi 186 and 0119_39_CAI34217.1 or resi 187 and 0119_39_CAI34217.1 or resi 193 and 0119_39_CAI34217.1 or resi 281 and 0119_39_CAI34217.1
show licorice, cons_CAI34217.1
color atomic, cons_CAI34217.1
cealign 7tpg, 0119_39_CAI34217.1


load data/wzy/alphafold/2202060002-wzy_100/af_out/CAI34198.1/ranked_0.pdb, 0119_39_CAI34198.1
color silver, 0119_39_CAI34198.1
label n. CA and resi 182 and 0119_39_CAI34198.1, "%s-%s" % (resn, resi)
label n. CA and resi 183 and 0119_39_CAI34198.1, "%s-%s" % (resn, resi)
label n. CA and resi 189 and 0119_39_CAI34198.1, "%s-%s" % (resn, resi)
label n. CA and resi 278 and 0119_39_CAI34198.1, "%s-%s" % (resn, resi)
select cons_CAI34198.1, resi 182 and 0119_39_CAI34198.1 or resi 183 and 0119_39_CAI34198.1 or resi 189 and 0119_39_CAI34198.1 or resi 278 and 0119_39_CAI34198.1
show licorice, cons_CAI34198.1
color atomic, cons_CAI34198.1
cealign 7tpg, 0119_39_CAI34198.1


load data/wzy/alphafold/2202060002-wzy_100/af_out/ACH97162.1/ranked_0.pdb, 0059_36_ACH97162.1
color silver, 0059_36_ACH97162.1
label n. CA and resi 45 and 0059_36_ACH97162.1, "%s-%s" % (resn, resi)
label n. CA and resi 51 and 0059_36_ACH97162.1, "%s-%s" % (resn, resi)
label n. CA and resi 52 and 0059_36_ACH97162.1, "%s-%s" % (resn, resi)
label n. CA and resi 55 and 0059_36_ACH97162.1, "%s-%s" % (resn, resi)
label n. CA and resi 73 and 0059_36_ACH97162.1, "%s-%s" % (resn, resi)
label n. CA and resi 139 and 0059_36_ACH97162.1, "%s-%s" % (resn, resi)
label n. CA and resi 142 and 0059_36_ACH97162.1, "%s-%s" % (resn, resi)
label n. CA and resi 176 and 0059_36_ACH97162.1, "%s-%s" % (resn, resi)
label n. CA and resi 234 and 0059_36_ACH97162.1, "%s-%s" % (resn, resi)
label n. CA and resi 251 and 0059_36_ACH97162.1, "%s-%s" % (resn, resi)
label n. CA and resi 301 and 0059_36_ACH97162.1, "%s-%s" % (resn, resi)
select cons_ACH97162.1, resi 45 and 0059_36_ACH97162.1 or resi 51 and 0059_36_ACH97162.1 or resi 52 and 0059_36_ACH97162.1 or resi 55 and 0059_36_ACH97162.1 or resi 73 and 0059_36_ACH97162.1 or resi 139 and 0059_36_ACH97162.1 or resi 142 and 0059_36_ACH97162.1 or resi 176 and 0059_36_ACH97162.1 or resi 234 and 0059_36_ACH97162.1 or resi 251 and 0059_36_ACH97162.1 or resi 301 and 0059_36_ACH97162.1
show licorice, cons_ACH97162.1
color atomic, cons_ACH97162.1
cealign 7tpg, 0059_36_ACH97162.1


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


load data/wzy/alphafold/2202060002-wzy_100/af_out/AFC91472.1/ranked_0.pdb, 0066_68_AFC91472.1
color silver, 0066_68_AFC91472.1
label n. CA and resi 126 and 0066_68_AFC91472.1, "%s-%s" % (resn, resi)
label n. CA and resi 152 and 0066_68_AFC91472.1, "%s-%s" % (resn, resi)
label n. CA and resi 156 and 0066_68_AFC91472.1, "%s-%s" % (resn, resi)
label n. CA and resi 204 and 0066_68_AFC91472.1, "%s-%s" % (resn, resi)
label n. CA and resi 208 and 0066_68_AFC91472.1, "%s-%s" % (resn, resi)
label n. CA and resi 239 and 0066_68_AFC91472.1, "%s-%s" % (resn, resi)
label n. CA and resi 241 and 0066_68_AFC91472.1, "%s-%s" % (resn, resi)
select cons_AFC91472.1, resi 126 and 0066_68_AFC91472.1 or resi 152 and 0066_68_AFC91472.1 or resi 156 and 0066_68_AFC91472.1 or resi 204 and 0066_68_AFC91472.1 or resi 208 and 0066_68_AFC91472.1 or resi 239 and 0066_68_AFC91472.1 or resi 241 and 0066_68_AFC91472.1
show licorice, cons_AFC91472.1
color atomic, cons_AFC91472.1
cealign 7tpg, 0066_68_AFC91472.1


load data/wzy/alphafold/2201200806-polymerases_AlphaFold_batch1/af_out/BAQ02224.1/ranked_0.pdb, 0066_68_BAQ02224.1
color silver, 0066_68_BAQ02224.1
label n. CA and resi 138 and 0066_68_BAQ02224.1, "%s-%s" % (resn, resi)
label n. CA and resi 167 and 0066_68_BAQ02224.1, "%s-%s" % (resn, resi)
label n. CA and resi 171 and 0066_68_BAQ02224.1, "%s-%s" % (resn, resi)
label n. CA and resi 217 and 0066_68_BAQ02224.1, "%s-%s" % (resn, resi)
label n. CA and resi 221 and 0066_68_BAQ02224.1, "%s-%s" % (resn, resi)
label n. CA and resi 255 and 0066_68_BAQ02224.1, "%s-%s" % (resn, resi)
label n. CA and resi 257 and 0066_68_BAQ02224.1, "%s-%s" % (resn, resi)
select cons_BAQ02224.1, resi 138 and 0066_68_BAQ02224.1 or resi 167 and 0066_68_BAQ02224.1 or resi 171 and 0066_68_BAQ02224.1 or resi 217 and 0066_68_BAQ02224.1 or resi 221 and 0066_68_BAQ02224.1 or resi 255 and 0066_68_BAQ02224.1 or resi 257 and 0066_68_BAQ02224.1
show licorice, cons_BAQ02224.1
color atomic, cons_BAQ02224.1
cealign 7tpg, 0066_68_BAQ02224.1


load data/wzy/alphafold/2202060002-wzy_100/af_out/ABG81806.1/ranked_0.pdb, 0066_68_ABG81806.1
color silver, 0066_68_ABG81806.1
label n. CA and resi 138 and 0066_68_ABG81806.1, "%s-%s" % (resn, resi)
label n. CA and resi 167 and 0066_68_ABG81806.1, "%s-%s" % (resn, resi)
label n. CA and resi 171 and 0066_68_ABG81806.1, "%s-%s" % (resn, resi)
label n. CA and resi 217 and 0066_68_ABG81806.1, "%s-%s" % (resn, resi)
label n. CA and resi 221 and 0066_68_ABG81806.1, "%s-%s" % (resn, resi)
label n. CA and resi 255 and 0066_68_ABG81806.1, "%s-%s" % (resn, resi)
label n. CA and resi 257 and 0066_68_ABG81806.1, "%s-%s" % (resn, resi)
select cons_ABG81806.1, resi 138 and 0066_68_ABG81806.1 or resi 167 and 0066_68_ABG81806.1 or resi 171 and 0066_68_ABG81806.1 or resi 217 and 0066_68_ABG81806.1 or resi 221 and 0066_68_ABG81806.1 or resi 255 and 0066_68_ABG81806.1 or resi 257 and 0066_68_ABG81806.1
show licorice, cons_ABG81806.1
color atomic, cons_ABG81806.1
cealign 7tpg, 0066_68_ABG81806.1


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


load data/wzy/alphafold/2202060002-wzy_100/af_out/BAQ01917.1/ranked_0.pdb, 0058_21_BAQ01917.1
color silver, 0058_21_BAQ01917.1
label n. CA and resi 131 and 0058_21_BAQ01917.1, "%s-%s" % (resn, resi)
label n. CA and resi 143 and 0058_21_BAQ01917.1, "%s-%s" % (resn, resi)
label n. CA and resi 154 and 0058_21_BAQ01917.1, "%s-%s" % (resn, resi)
label n. CA and resi 167 and 0058_21_BAQ01917.1, "%s-%s" % (resn, resi)
label n. CA and resi 174 and 0058_21_BAQ01917.1, "%s-%s" % (resn, resi)
label n. CA and resi 213 and 0058_21_BAQ01917.1, "%s-%s" % (resn, resi)
label n. CA and resi 257 and 0058_21_BAQ01917.1, "%s-%s" % (resn, resi)
label n. CA and resi 266 and 0058_21_BAQ01917.1, "%s-%s" % (resn, resi)
label n. CA and resi 268 and 0058_21_BAQ01917.1, "%s-%s" % (resn, resi)
label n. CA and resi 272 and 0058_21_BAQ01917.1, "%s-%s" % (resn, resi)
label n. CA and resi 306 and 0058_21_BAQ01917.1, "%s-%s" % (resn, resi)
label n. CA and resi 352 and 0058_21_BAQ01917.1, "%s-%s" % (resn, resi)
select cons_BAQ01917.1, resi 131 and 0058_21_BAQ01917.1 or resi 143 and 0058_21_BAQ01917.1 or resi 154 and 0058_21_BAQ01917.1 or resi 167 and 0058_21_BAQ01917.1 or resi 174 and 0058_21_BAQ01917.1 or resi 213 and 0058_21_BAQ01917.1 or resi 257 and 0058_21_BAQ01917.1 or resi 266 and 0058_21_BAQ01917.1 or resi 268 and 0058_21_BAQ01917.1 or resi 272 and 0058_21_BAQ01917.1 or resi 306 and 0058_21_BAQ01917.1 or resi 352 and 0058_21_BAQ01917.1
show licorice, cons_BAQ01917.1
color atomic, cons_BAQ01917.1
cealign 7tpg, 0058_21_BAQ01917.1


load data/wzy/alphafold/2202060002-wzy_100/af_out/BAQ00994.1/ranked_0.pdb, 0058_21_BAQ00994.1
color silver, 0058_21_BAQ00994.1
label n. CA and resi 134 and 0058_21_BAQ00994.1, "%s-%s" % (resn, resi)
label n. CA and resi 146 and 0058_21_BAQ00994.1, "%s-%s" % (resn, resi)
label n. CA and resi 157 and 0058_21_BAQ00994.1, "%s-%s" % (resn, resi)
label n. CA and resi 165 and 0058_21_BAQ00994.1, "%s-%s" % (resn, resi)
label n. CA and resi 172 and 0058_21_BAQ00994.1, "%s-%s" % (resn, resi)
label n. CA and resi 210 and 0058_21_BAQ00994.1, "%s-%s" % (resn, resi)
label n. CA and resi 257 and 0058_21_BAQ00994.1, "%s-%s" % (resn, resi)
label n. CA and resi 266 and 0058_21_BAQ00994.1, "%s-%s" % (resn, resi)
label n. CA and resi 268 and 0058_21_BAQ00994.1, "%s-%s" % (resn, resi)
label n. CA and resi 272 and 0058_21_BAQ00994.1, "%s-%s" % (resn, resi)
label n. CA and resi 309 and 0058_21_BAQ00994.1, "%s-%s" % (resn, resi)
label n. CA and resi 354 and 0058_21_BAQ00994.1, "%s-%s" % (resn, resi)
select cons_BAQ00994.1, resi 134 and 0058_21_BAQ00994.1 or resi 146 and 0058_21_BAQ00994.1 or resi 157 and 0058_21_BAQ00994.1 or resi 165 and 0058_21_BAQ00994.1 or resi 172 and 0058_21_BAQ00994.1 or resi 210 and 0058_21_BAQ00994.1 or resi 257 and 0058_21_BAQ00994.1 or resi 266 and 0058_21_BAQ00994.1 or resi 268 and 0058_21_BAQ00994.1 or resi 272 and 0058_21_BAQ00994.1 or resi 309 and 0058_21_BAQ00994.1 or resi 354 and 0058_21_BAQ00994.1
show licorice, cons_BAQ00994.1
color atomic, cons_BAQ00994.1
cealign 7tpg, 0058_21_BAQ00994.1


load data/wzy/alphafold/2205031317-wzy/af_out/CAI34124.1/ranked_0.pdb, 0152_11_CAI34124.1
color silver, 0152_11_CAI34124.1
label n. CA and resi 267 and 0152_11_CAI34124.1, "%s-%s" % (resn, resi)
label n. CA and resi 304 and 0152_11_CAI34124.1, "%s-%s" % (resn, resi)
label n. CA and resi 325 and 0152_11_CAI34124.1, "%s-%s" % (resn, resi)
select cons_CAI34124.1, resi 267 and 0152_11_CAI34124.1 or resi 304 and 0152_11_CAI34124.1 or resi 325 and 0152_11_CAI34124.1
show licorice, cons_CAI34124.1
color atomic, cons_CAI34124.1
cealign 7tpg, 0152_11_CAI34124.1


load data/wzy/alphafold/2205031317-wzy/af_out/ADC54950.1/ranked_0.pdb, 0067_27_ADC54950.1
color silver, 0067_27_ADC54950.1
label n. CA and resi 133 and 0067_27_ADC54950.1, "%s-%s" % (resn, resi)
label n. CA and resi 190 and 0067_27_ADC54950.1, "%s-%s" % (resn, resi)
label n. CA and resi 233 and 0067_27_ADC54950.1, "%s-%s" % (resn, resi)
label n. CA and resi 249 and 0067_27_ADC54950.1, "%s-%s" % (resn, resi)
label n. CA and resi 305 and 0067_27_ADC54950.1, "%s-%s" % (resn, resi)
label n. CA and resi 316 and 0067_27_ADC54950.1, "%s-%s" % (resn, resi)
label n. CA and resi 352 and 0067_27_ADC54950.1, "%s-%s" % (resn, resi)
select cons_ADC54950.1, resi 133 and 0067_27_ADC54950.1 or resi 190 and 0067_27_ADC54950.1 or resi 233 and 0067_27_ADC54950.1 or resi 249 and 0067_27_ADC54950.1 or resi 305 and 0067_27_ADC54950.1 or resi 316 and 0067_27_ADC54950.1 or resi 352 and 0067_27_ADC54950.1
show licorice, cons_ADC54950.1
color atomic, cons_ADC54950.1
cealign 7tpg, 0067_27_ADC54950.1


load data/wzy/alphafold/2202060002-wzy_100/af_out/ADI43263.1/ranked_0.pdb, 0082_37_ADI43263.1
color silver, 0082_37_ADI43263.1
label n. CA and resi 158 and 0082_37_ADI43263.1, "%s-%s" % (resn, resi)
label n. CA and resi 160 and 0082_37_ADI43263.1, "%s-%s" % (resn, resi)
label n. CA and resi 241 and 0082_37_ADI43263.1, "%s-%s" % (resn, resi)
label n. CA and resi 245 and 0082_37_ADI43263.1, "%s-%s" % (resn, resi)
label n. CA and resi 253 and 0082_37_ADI43263.1, "%s-%s" % (resn, resi)
label n. CA and resi 305 and 0082_37_ADI43263.1, "%s-%s" % (resn, resi)
label n. CA and resi 308 and 0082_37_ADI43263.1, "%s-%s" % (resn, resi)
label n. CA and resi 315 and 0082_37_ADI43263.1, "%s-%s" % (resn, resi)
label n. CA and resi 319 and 0082_37_ADI43263.1, "%s-%s" % (resn, resi)
select cons_ADI43263.1, resi 158 and 0082_37_ADI43263.1 or resi 160 and 0082_37_ADI43263.1 or resi 241 and 0082_37_ADI43263.1 or resi 245 and 0082_37_ADI43263.1 or resi 253 and 0082_37_ADI43263.1 or resi 305 and 0082_37_ADI43263.1 or resi 308 and 0082_37_ADI43263.1 or resi 315 and 0082_37_ADI43263.1 or resi 319 and 0082_37_ADI43263.1
show licorice, cons_ADI43263.1
color atomic, cons_ADI43263.1
cealign 7tpg, 0082_37_ADI43263.1


load data/wzy/alphafold/2202060002-wzy_100/af_out/ADR74237.1/ranked_0.pdb, 0082_37_ADR74237.1
color silver, 0082_37_ADR74237.1
label n. CA and resi 162 and 0082_37_ADR74237.1, "%s-%s" % (resn, resi)
label n. CA and resi 164 and 0082_37_ADR74237.1, "%s-%s" % (resn, resi)
label n. CA and resi 248 and 0082_37_ADR74237.1, "%s-%s" % (resn, resi)
label n. CA and resi 252 and 0082_37_ADR74237.1, "%s-%s" % (resn, resi)
label n. CA and resi 261 and 0082_37_ADR74237.1, "%s-%s" % (resn, resi)
label n. CA and resi 312 and 0082_37_ADR74237.1, "%s-%s" % (resn, resi)
label n. CA and resi 315 and 0082_37_ADR74237.1, "%s-%s" % (resn, resi)
label n. CA and resi 322 and 0082_37_ADR74237.1, "%s-%s" % (resn, resi)
label n. CA and resi 326 and 0082_37_ADR74237.1, "%s-%s" % (resn, resi)
select cons_ADR74237.1, resi 162 and 0082_37_ADR74237.1 or resi 164 and 0082_37_ADR74237.1 or resi 248 and 0082_37_ADR74237.1 or resi 252 and 0082_37_ADR74237.1 or resi 261 and 0082_37_ADR74237.1 or resi 312 and 0082_37_ADR74237.1 or resi 315 and 0082_37_ADR74237.1 or resi 322 and 0082_37_ADR74237.1 or resi 326 and 0082_37_ADR74237.1
show licorice, cons_ADR74237.1
color atomic, cons_ADR74237.1
cealign 7tpg, 0082_37_ADR74237.1


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


load data/wzy/alphafold/2202060002-wzy_100/af_out/ACA24821.1/ranked_0.pdb, 0059_56_ACA24821.1
color silver, 0059_56_ACA24821.1
label n. CA and resi 48 and 0059_56_ACA24821.1, "%s-%s" % (resn, resi)
label n. CA and resi 54 and 0059_56_ACA24821.1, "%s-%s" % (resn, resi)
label n. CA and resi 58 and 0059_56_ACA24821.1, "%s-%s" % (resn, resi)
label n. CA and resi 73 and 0059_56_ACA24821.1, "%s-%s" % (resn, resi)
label n. CA and resi 134 and 0059_56_ACA24821.1, "%s-%s" % (resn, resi)
label n. CA and resi 168 and 0059_56_ACA24821.1, "%s-%s" % (resn, resi)
label n. CA and resi 221 and 0059_56_ACA24821.1, "%s-%s" % (resn, resi)
label n. CA and resi 290 and 0059_56_ACA24821.1, "%s-%s" % (resn, resi)
label n. CA and resi 351 and 0059_56_ACA24821.1, "%s-%s" % (resn, resi)
select cons_ACA24821.1, resi 48 and 0059_56_ACA24821.1 or resi 54 and 0059_56_ACA24821.1 or resi 58 and 0059_56_ACA24821.1 or resi 73 and 0059_56_ACA24821.1 or resi 134 and 0059_56_ACA24821.1 or resi 168 and 0059_56_ACA24821.1 or resi 221 and 0059_56_ACA24821.1 or resi 290 and 0059_56_ACA24821.1 or resi 351 and 0059_56_ACA24821.1
show licorice, cons_ACA24821.1
color atomic, cons_ACA24821.1
cealign 7tpg, 0059_56_ACA24821.1


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
label n. CA and resi 177 and 0129_33_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 213 and 0129_33_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 222 and 0129_33_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 226 and 0129_33_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 232 and 0129_33_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 258 and 0129_33_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 261 and 0129_33_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 265 and 0129_33_BAQ00795.1, "%s-%s" % (resn, resi)
label n. CA and resi 276 and 0129_33_BAQ00795.1, "%s-%s" % (resn, resi)
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
select cons_BAQ00795.1, resi 30 and 0129_33_BAQ00795.1 or resi 38 and 0129_33_BAQ00795.1 or resi 95 and 0129_33_BAQ00795.1 or resi 97 and 0129_33_BAQ00795.1 or resi 129 and 0129_33_BAQ00795.1 or resi 159 and 0129_33_BAQ00795.1 or resi 160 and 0129_33_BAQ00795.1 or resi 161 and 0129_33_BAQ00795.1 or resi 163 and 0129_33_BAQ00795.1 or resi 164 and 0129_33_BAQ00795.1 or resi 177 and 0129_33_BAQ00795.1 or resi 213 and 0129_33_BAQ00795.1 or resi 222 and 0129_33_BAQ00795.1 or resi 226 and 0129_33_BAQ00795.1 or resi 232 and 0129_33_BAQ00795.1 or resi 258 and 0129_33_BAQ00795.1 or resi 261 and 0129_33_BAQ00795.1 or resi 265 and 0129_33_BAQ00795.1 or resi 276 and 0129_33_BAQ00795.1 or resi 297 and 0129_33_BAQ00795.1 or resi 300 and 0129_33_BAQ00795.1 or resi 307 and 0129_33_BAQ00795.1 or resi 308 and 0129_33_BAQ00795.1 or resi 312 and 0129_33_BAQ00795.1 or resi 313 and 0129_33_BAQ00795.1 or resi 317 and 0129_33_BAQ00795.1 or resi 318 and 0129_33_BAQ00795.1 or resi 321 and 0129_33_BAQ00795.1 or resi 326 and 0129_33_BAQ00795.1 or resi 355 and 0129_33_BAQ00795.1 or resi 366 and 0129_33_BAQ00795.1 or resi 368 and 0129_33_BAQ00795.1
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


load data/wzy/alphafold/2205031317-wzy/af_out/ACA24754.1/ranked_0.pdb, 0107_2_ACA24754.1
color silver, 0107_2_ACA24754.1
label n. CA and resi 124 and 0107_2_ACA24754.1, "%s-%s" % (resn, resi)
label n. CA and resi 162 and 0107_2_ACA24754.1, "%s-%s" % (resn, resi)
label n. CA and resi 217 and 0107_2_ACA24754.1, "%s-%s" % (resn, resi)
label n. CA and resi 294 and 0107_2_ACA24754.1, "%s-%s" % (resn, resi)
label n. CA and resi 328 and 0107_2_ACA24754.1, "%s-%s" % (resn, resi)
select cons_ACA24754.1, resi 124 and 0107_2_ACA24754.1 or resi 162 and 0107_2_ACA24754.1 or resi 217 and 0107_2_ACA24754.1 or resi 294 and 0107_2_ACA24754.1 or resi 328 and 0107_2_ACA24754.1
show licorice, cons_ACA24754.1
color atomic, cons_ACA24754.1
cealign 7tpg, 0107_2_ACA24754.1


load data/wzy/alphafold/2202060002-wzy_100/af_out/CAI33309.1/ranked_0.pdb, 0478_3_CAI33309.1
color silver, 0478_3_CAI33309.1
label n. CA and resi 150 and 0478_3_CAI33309.1, "%s-%s" % (resn, resi)
label n. CA and resi 266 and 0478_3_CAI33309.1, "%s-%s" % (resn, resi)
label n. CA and resi 304 and 0478_3_CAI33309.1, "%s-%s" % (resn, resi)
select cons_CAI33309.1, resi 150 and 0478_3_CAI33309.1 or resi 266 and 0478_3_CAI33309.1 or resi 304 and 0478_3_CAI33309.1
show licorice, cons_CAI33309.1
color atomic, cons_CAI33309.1
cealign 7tpg, 0478_3_CAI33309.1


load data/wzy/alphafold/2202060002-wzy_100/af_out/CAI34369.1/ranked_0.pdb, 0478_3_CAI34369.1
color silver, 0478_3_CAI34369.1
label n. CA and resi 151 and 0478_3_CAI34369.1, "%s-%s" % (resn, resi)
label n. CA and resi 268 and 0478_3_CAI34369.1, "%s-%s" % (resn, resi)
label n. CA and resi 308 and 0478_3_CAI34369.1, "%s-%s" % (resn, resi)
select cons_CAI34369.1, resi 151 and 0478_3_CAI34369.1 or resi 268 and 0478_3_CAI34369.1 or resi 308 and 0478_3_CAI34369.1
show licorice, cons_CAI34369.1
color atomic, cons_CAI34369.1
cealign 7tpg, 0478_3_CAI34369.1


load data/wzy/alphafold/2202060002-wzy_100/af_out/WP_097449287.1/ranked_0.pdb, 0089_1_WP_097449287.1
color silver, 0089_1_WP_097449287.1
label n. CA and resi 44 and 0089_1_WP_097449287.1, "%s-%s" % (resn, resi)
label n. CA and resi 183 and 0089_1_WP_097449287.1, "%s-%s" % (resn, resi)
label n. CA and resi 228 and 0089_1_WP_097449287.1, "%s-%s" % (resn, resi)
label n. CA and resi 258 and 0089_1_WP_097449287.1, "%s-%s" % (resn, resi)
label n. CA and resi 293 and 0089_1_WP_097449287.1, "%s-%s" % (resn, resi)
label n. CA and resi 300 and 0089_1_WP_097449287.1, "%s-%s" % (resn, resi)
label n. CA and resi 326 and 0089_1_WP_097449287.1, "%s-%s" % (resn, resi)
label n. CA and resi 381 and 0089_1_WP_097449287.1, "%s-%s" % (resn, resi)
select cons_WP_097449287.1, resi 44 and 0089_1_WP_097449287.1 or resi 183 and 0089_1_WP_097449287.1 or resi 228 and 0089_1_WP_097449287.1 or resi 258 and 0089_1_WP_097449287.1 or resi 293 and 0089_1_WP_097449287.1 or resi 300 and 0089_1_WP_097449287.1 or resi 326 and 0089_1_WP_097449287.1 or resi 381 and 0089_1_WP_097449287.1
show licorice, cons_WP_097449287.1
color atomic, cons_WP_097449287.1
cealign 7tpg, 0089_1_WP_097449287.1

set label_position,(1,1,1)
set label_color,black
center 
disable 
bg_color white 
