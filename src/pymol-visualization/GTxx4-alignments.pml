load /Users/idamei/phd/data/wzy/alphafold/CAI34008.1/relaxed_model_1.pdb, CAI34008.1
load /Users/idamei/phd/data/wzy/alphafold/ABB29906.1/relaxed_model_1.pdb, ABB29906.1
load /Users/idamei/phd/data/wzy/alphafold/AHB32334.1/relaxed_model_1.pdb, AHB32334.1
load /Users/idamei/phd/data/wzy/alphafold/AHB32215.1/relaxed_model_1.pdb, AHB32215.1
load /Users/idamei/phd/data/wzy/alphafold/ACA24821.1/relaxed_model_1.pdb, ACA24821.1

cealign AHB32334.1, CAI34008.1
cealign AHB32334.1, ABB29906.1
cealign AHB32334.1, AHB32215.1
cealign AHB32334.1, ACA24821.1

select cons_CAI34008.1, resi 51 and CAI34008.1 or resi 55 and CAI34008.1 or resi 153 and CAI34008.1 or resi 187 and CAI34008.1 or resi 315 and CAI34008.1
select cons_ABB29906.1, resi 49 and ABB29906.1 or resi 53 and ABB29906.1 or resi 129 and ABB29906.1 or resi 161 and ABB29906.1 or resi 284 and ABB29906.1
select cons_AHB32334.1, resi 33 and AHB32334.1 or resi 37 and AHB32334.1 or resi 126 and AHB32334.1 or resi 161 and AHB32334.1 or resi 284 and AHB32334.1
select cons_AHB32215.1, resi 49 and AHB32215.1 or resi 53 and AHB32215.1 or resi 137 and AHB32215.1 or resi 171 and AHB32215.1 or resi 283 and AHB32215.1
select cons_ACA24821.1, resi 54 and ACA24821.1 or resi 58 and ACA24821.1 or resi 134 and ACA24821.1 or resi 168 and ACA24821.1 or resi 290 and ACA24821.1

show licorice, cons_CAI34008.1
show licorice, cons_ABB29906.1
show licorice, cons_AHB32334.1
show licorice, cons_AHB32215.1
show licorice, cons_ACA24821.1

@src/pymol-visualization/nicify.pml

set_view (\
    -0.400317788,    0.786851645,    0.469685376,\
    -0.152810454,    0.448051751,   -0.880849838,\
    -0.903543234,   -0.424394667,   -0.059124548,\
     0.000000000,    0.000000000, -183.824264526,\
    -4.829482079,    3.656875610,   -2.396808624,\
   117.595565796,  250.052932739,  -20.000000000 )

enable AHB32334.1
enable CAI34008.1
ray
png /Users/idamei/phd/data/pymol-visualizations/figures/CAI34008_zoom_out.png
disable

enable AHB32334.1
enable ABB29906.1
ray
png /Users/idamei/phd/data/pymol-visualizations/figures/ABB29906_zoom_out.png
disable

enable AHB32334.1
enable AHB32215.1
ray
png /Users/idamei/phd/data/pymol-visualizations/figures/AHB32215_zoom_out.png
disable

enable AHB32334.1
enable ACA24821.1
ray
png /Users/idamei/phd/data/pymol-visualizations/figures/ACA24821_zoom_out.png
disable

set_view (\
    -0.342073292,   -0.009502263,    0.939622641,\
    -0.126163170,    0.991358519,   -0.035904434,\
    -0.931162596,   -0.130828321,   -0.340318412,\
    -0.000021167,    0.000011995,  -83.004776001,\
    -3.877328873,    4.197901249,   -2.910139799,\
    16.776945114,  149.234313965,  -20.000000000 )

enable AHB32334.1
enable CAI34008.1
ray
png /Users/idamei/phd/data/pymol-visualizations/figures/CAI34008_zoom_in.png
disable

enable AHB32334.1
enable ABB29906.1
ray
png /Users/idamei/phd/data/pymol-visualizations/figures/ABB29906_zoom_in.png
disable

enable AHB32334.1
enable AHB32215.1
ray
png /Users/idamei/phd/data/pymol-visualizations/figures/AHB32215_zoom_in.png
disable

enable AHB32334.1
enable ACA24821.1
ray
png /Users/idamei/phd/data/pymol-visualizations/figures/ACA24821_zoom_in.png
disable