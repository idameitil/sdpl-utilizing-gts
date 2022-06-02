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

load /Users/idamei/phd/data/wzy/alphafold/2202060002-wzy_100/af_out/BAQ00795.1/ranked_0.pdb, BAQ00795.1
load /Users/idamei/phd/data/wzy/alphafold/2202060002-wzy_100/af_out/CAI34369.1/ranked_0.pdb, CAI34369.1
load /Users/idamei/phd/data/wzy/alphafold/2202060002-wzy_100/af_out/AHB32411.1/ranked_0.pdb, AHB32411.1
load /Users/idamei/phd/data/wzy/alphafold/2202060002-wzy_100/af_out/WP_000905563.1/ranked_0.pdb, WP_000905563.1
load /Users/idamei/phd/data/wzy/alphafold/2202060002-wzy_100/af_out/AHB32687.1/ranked_0.pdb, AHB32687.1
load /Users/idamei/phd/data/wzy/alphafold/2202060002-wzy_100/af_out/AKA20935.1/ranked_0.pdb, AKA20935.1
load /Users/idamei/phd/data/wzy/alphafold/2205031317-wzy_missing/af_out/ACH50550.1/ranked_0.pdb, ACH50550.1
color silver, BAQ00795.1
color silver, CAI34369.1
color silver, AHB32411.1
color silver, WP_000905563.1
color silver, AHB32687.1
color silver, AKA20935.1
select arg_BAQ00795.1, resi 164 and BAQ00795.1 or resi 213 and BAQ00795.1 or resi 317 and BAQ00795.1
show licorice, arg_BAQ00795.1
color atomic, arg_BAQ00795.1
select arg_CAI34369.1, resi 268 and CAI34369.1 or resi 203 and CAI34369.1 or resi 151 and CAI34369.1
show licorice, arg_CAI34369.1
color atomic, arg_CAI34369.1
select arg_AHB32411.1, resi 162 and AHB32411.1 or resi 207 and AHB32411.1
show licorice, arg_AHB32411.1
color atomic, arg_AHB32411.1
select arg_WP_000905563.1, resi 131 and WP_000905563.1 or resi 138 and WP_000905563.1 or resi 250 and WP_000905563.1
show licorice, arg_WP_000905563.1
color atomic, arg_WP_000905563.1
select arg_AHB32687.1, resi 184 and AHB32687.1 or resi 335 and AHB32687.1
show licorice, arg_AHB32687.1
color atomic, arg_AHB32687.1
select arg_AKA20935.1, resi 57 and AKA20935.1 or resi 174 and AKA20935.1 or resi 213 and AKA20935.1 or resi 262 and AKA20935.1
show licorice, arg_AKA20935.1
color atomic, arg_AKA20935.1

247 266

cealign 7tpg, BAQ00795.1
cealign 7tpg, CAI34369.1
cealign 7tpg, AHB32411.1
cealign 7tpg, WP_000905563.1
cealign 7tpg, AHB32687.1
cealign 7tpg, AKA20935.1
cealign 7tpg, ACH50550.1

fetch 6bar
cealign 7tpg, 6bar

center

set_view (\
     0.129056588,   -0.914879322,   -0.382540226,\
    -0.931019366,    0.021019539,   -0.364364743,\
     0.341392726,    0.403177291,   -0.849059284,\
     0.000000000,    0.000000000, -203.904266357,\
   134.720489502,  144.012847900,  140.640121460,\
   160.759674072,  247.048858643,  -20.000000000 )

