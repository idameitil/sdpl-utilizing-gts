@src/pymol-visualization/nicify.pml

fetch 7tpg, 615_i_7TPG_O-Lig
select chain_B, chain B
hide cartoon, !chain_B
color gray60, chain_B
label n. CA and resi 191 and 615_i_7TPG_O-Lig, "%s" % (resn)
label n. CA and resi 242 and 615_i_7TPG_O-Lig, "%s" % (resn)
label n. CA and resi 261 and 615_i_7TPG_O-Lig, "%s" % (resn)
label n. CA and resi 265 and 615_i_7TPG_O-Lig, "%s" % (resn)
label n. CA and resi 313 and 615_i_7TPG_O-Lig, "%s" % (resn)
select cons_615_i_7TPG_O-Lig, resi 191 and 615_i_7TPG_O-Lig or resi 242 and 615_i_7TPG_O-Lig or resi 261 and 615_i_7TPG_O-Lig or resi 265 and 615_i_7TPG_O-Lig or resi 313 and 615_i_7TPG_O-Lig
show licorice, cons_615_i_7TPG_O-Lig
    color atomic, (cons_615_i_7TPG_O-Lig and not elem C)
    
load data/eca-pol/alphafold/ACH50550.1/ranked_0.pdb, 586_r_ACH50550.1
color gray60, 586_r_ACH50550.1
label n. CA and resi 145 and 586_r_ACH50550.1, "%s" % (resn)
label n. CA and resi 204 and 586_r_ACH50550.1, "%s" % (resn)
label n. CA and resi 247 and 586_r_ACH50550.1, "%s" % (resn)
label n. CA and resi 248 and 586_r_ACH50550.1, "%s" % (resn)
label n. CA and resi 399 and 586_r_ACH50550.1, "%s" % (resn)
select cons_586_r_ACH50550.1, resi 145 and 586_r_ACH50550.1 or resi 204 and 586_r_ACH50550.1 or resi 247 and 586_r_ACH50550.1 or resi 248 and 586_r_ACH50550.1 or resi 399 and 586_r_ACH50550.1
show licorice, cons_586_r_ACH50550.1
    color atomic, (cons_586_r_ACH50550.1 and not elem C)
    load /Users/idamei/phd/data/roda/alphafold/AF-Q5SIX3-F1-model_v4.pdb, 571_i_AF-6BAR
color gray60, 571_i_AF-6BAR
label n. CA and resi 203 and 571_i_AF-6BAR, "%s" % (resn)
label n. CA and resi 255 and 571_i_AF-6BAR, "%s" % (resn)
select cons_571_i_AF-6BAR, resi 203 and 571_i_AF-6BAR or resi 255 and 571_i_AF-6BAR
show licorice, cons_571_i_AF-6BAR
    color atomic, (cons_571_i_AF-6BAR and not elem C)
    load data/wzy/alphafold/AHB32861.1/ranked_0.pdb, 617_i_AHB32861.1
    color gray60, 617_i_AHB32861.1
    label n. CA and resi 48 and 617_i_AHB32861.1, "%s" % (resn)
label n. CA and resi 136 and 617_i_AHB32861.1, "%s" % (resn)
label n. CA and resi 170 and 617_i_AHB32861.1, "%s" % (resn)
label n. CA and resi 287 and 617_i_AHB32861.1, "%s" % (resn)
select cons_617_i_AHB32861.1, resi 48 and 617_i_AHB32861.1 or resi 136 and 617_i_AHB32861.1 or resi 170 and 617_i_AHB32861.1 or resi 287 and 617_i_AHB32861.1
show licorice, cons_617_i_AHB32861.1
    color atomic, (cons_617_i_AHB32861.1 and not elem C)
    load data/wzy/alphafold/CAI34369.1/ranked_0.pdb, 613_i_CAI34369.1
    color gray60, 613_i_CAI34369.1
    label n. CA and resi 151 and 613_i_CAI34369.1, "%s" % (resn)
label n. CA and resi 268 and 613_i_CAI34369.1, "%s" % (resn)
label n. CA and resi 308 and 613_i_CAI34369.1, "%s" % (resn)
select cons_613_i_CAI34369.1, resi 151 and 613_i_CAI34369.1 or resi 268 and 613_i_CAI34369.1 or resi 308 and 613_i_CAI34369.1
show licorice, cons_613_i_CAI34369.1
    color atomic, (cons_613_i_CAI34369.1 and not elem C)
    load data/wzy/alphafold/ADC54950.1/ranked_0.pdb, 612_r_ADC54950.1
    color gray60, 612_r_ADC54950.1
    label n. CA and resi 133 and 612_r_ADC54950.1, "%s" % (resn)
label n. CA and resi 190 and 612_r_ADC54950.1, "%s" % (resn)
label n. CA and resi 233 and 612_r_ADC54950.1, "%s" % (resn)
label n. CA and resi 249 and 612_r_ADC54950.1, "%s" % (resn)
label n. CA and resi 305 and 612_r_ADC54950.1, "%s" % (resn)
select cons_612_r_ADC54950.1, resi 133 and 612_r_ADC54950.1 or resi 190 and 612_r_ADC54950.1 or resi 233 and 612_r_ADC54950.1 or resi 249 and 612_r_ADC54950.1 or resi 305 and 612_r_ADC54950.1
show licorice, cons_612_r_ADC54950.1
    color atomic, (cons_612_r_ADC54950.1 and not elem C)
    load data/wzy/alphafold/AAA97573.1/ranked_0.pdb, 611_r_AAA97573.1
    color gray60, 611_r_AAA97573.1
    label n. CA and resi 173 and 611_r_AAA97573.1, "%s" % (resn)
label n. CA and resi 176 and 611_r_AAA97573.1, "%s" % (resn)
label n. CA and resi 234 and 611_r_AAA97573.1, "%s" % (resn)
label n. CA and resi 291 and 611_r_AAA97573.1, "%s" % (resn)
label n. CA and resi 349 and 611_r_AAA97573.1, "%s" % (resn)
select cons_611_r_AAA97573.1, resi 173 and 611_r_AAA97573.1 or resi 176 and 611_r_AAA97573.1 or resi 234 and 611_r_AAA97573.1 or resi 291 and 611_r_AAA97573.1 or resi 349 and 611_r_AAA97573.1
show licorice, cons_611_r_AAA97573.1
    color atomic, (cons_611_r_AAA97573.1 and not elem C)
    load data/wzy/alphafold/BAQ02088.1/ranked_0.pdb, 605_i_BAQ02088.1
    color gray60, 605_i_BAQ02088.1
    label n. CA and resi 228 and 605_i_BAQ02088.1, "%s" % (resn)
label n. CA and resi 307 and 605_i_BAQ02088.1, "%s" % (resn)
label n. CA and resi 343 and 605_i_BAQ02088.1, "%s" % (resn)
label n. CA and resi 348 and 605_i_BAQ02088.1, "%s" % (resn)
select cons_605_i_BAQ02088.1, resi 228 and 605_i_BAQ02088.1 or resi 307 and 605_i_BAQ02088.1 or resi 343 and 605_i_BAQ02088.1 or resi 348 and 605_i_BAQ02088.1
show licorice, cons_605_i_BAQ02088.1
    color atomic, (cons_605_i_BAQ02088.1 and not elem C)
    load data/wzy/alphafold/AAM27615.1/ranked_0.pdb, 614_i_AAM27615.1
    color gray60, 614_i_AAM27615.1
    label n. CA and resi 188 and 614_i_AAM27615.1, "%s" % (resn)
label n. CA and resi 260 and 614_i_AAM27615.1, "%s" % (resn)
label n. CA and resi 298 and 614_i_AAM27615.1, "%s" % (resn)
select cons_614_i_AAM27615.1, resi 188 and 614_i_AAM27615.1 or resi 260 and 614_i_AAM27615.1 or resi 298 and 614_i_AAM27615.1
show licorice, cons_614_i_AAM27615.1
    color atomic, (cons_614_i_AAM27615.1 and not elem C)
    load data/wzy/alphafold/AAT77177.1/ranked_0.pdb, 606_r_AAT77177.1
    color gray60, 606_r_AAT77177.1
    label n. CA and resi 165 and 606_r_AAT77177.1, "%s" % (resn)
label n. CA and resi 226 and 606_r_AAT77177.1, "%s" % (resn)
label n. CA and resi 266 and 606_r_AAT77177.1, "%s" % (resn)
label n. CA and resi 284 and 606_r_AAT77177.1, "%s" % (resn)
label n. CA and resi 348 and 606_r_AAT77177.1, "%s" % (resn)
select cons_606_r_AAT77177.1, resi 165 and 606_r_AAT77177.1 or resi 226 and 606_r_AAT77177.1 or resi 266 and 606_r_AAT77177.1 or resi 284 and 606_r_AAT77177.1 or resi 348 and 606_r_AAT77177.1
show licorice, cons_606_r_AAT77177.1
    color atomic, (cons_606_r_AAT77177.1 and not elem C)
    load data/wzy/alphafold/CAI34124.1/ranked_0.pdb, 607_i_CAI34124.1
    color gray60, 607_i_CAI34124.1
    label n. CA and resi 158 and 607_i_CAI34124.1, "%s" % (resn)
label n. CA and resi 267 and 607_i_CAI34124.1, "%s" % (resn)
label n. CA and resi 325 and 607_i_CAI34124.1, "%s" % (resn)
select cons_607_i_CAI34124.1, resi 158 and 607_i_CAI34124.1 or resi 267 and 607_i_CAI34124.1 or resi 325 and 607_i_CAI34124.1
show licorice, cons_607_i_CAI34124.1
    color atomic, (cons_607_i_CAI34124.1 and not elem C)
    load data/wzy/alphafold/CAI32772.1/ranked_0.pdb, 608_r_CAI32772.1
    color gray60, 608_r_CAI32772.1
    label n. CA and resi 184 and 608_r_CAI32772.1, "%s" % (resn)
label n. CA and resi 242 and 608_r_CAI32772.1, "%s" % (resn)
label n. CA and resi 290 and 608_r_CAI32772.1, "%s" % (resn)
label n. CA and resi 441 and 608_r_CAI32772.1, "%s" % (resn)
select cons_608_r_CAI32772.1, resi 184 and 608_r_CAI32772.1 or resi 242 and 608_r_CAI32772.1 or resi 290 and 608_r_CAI32772.1 or resi 441 and 608_r_CAI32772.1
show licorice, cons_608_r_CAI32772.1
    color atomic, (cons_608_r_CAI32772.1 and not elem C)
    load data/wzy/alphafold/AHB32411.1/ranked_0.pdb, 610_r_AHB32411.1
    color gray60, 610_r_AHB32411.1
    label n. CA and resi 162 and 610_r_AHB32411.1, "%s" % (resn)
label n. CA and resi 207 and 610_r_AHB32411.1, "%s" % (resn)
label n. CA and resi 244 and 610_r_AHB32411.1, "%s" % (resn)
label n. CA and resi 251 and 610_r_AHB32411.1, "%s" % (resn)
select cons_610_r_AHB32411.1, resi 162 and 610_r_AHB32411.1 or resi 207 and 610_r_AHB32411.1 or resi 244 and 610_r_AHB32411.1 or resi 251 and 610_r_AHB32411.1
show licorice, cons_610_r_AHB32411.1
    color atomic, (cons_610_r_AHB32411.1 and not elem C)
    load data/wzy/alphafold/CAI34254.1/ranked_0.pdb, 609_i_CAI34254.1
    color gray60, 609_i_CAI34254.1
    label n. CA and resi 182 and 609_i_CAI34254.1, "%s" % (resn)
label n. CA and resi 183 and 609_i_CAI34254.1, "%s" % (resn)
label n. CA and resi 189 and 609_i_CAI34254.1, "%s" % (resn)
label n. CA and resi 277 and 609_i_CAI34254.1, "%s" % (resn)
label n. CA and resi 281 and 609_i_CAI34254.1, "%s" % (resn)
select cons_609_i_CAI34254.1, resi 182 and 609_i_CAI34254.1 or resi 183 and 609_i_CAI34254.1 or resi 189 and 609_i_CAI34254.1 or resi 277 and 609_i_CAI34254.1 or resi 281 and 609_i_CAI34254.1
show licorice, cons_609_i_CAI34254.1
    color atomic, (cons_609_i_CAI34254.1 and not elem C)
    cealign 607_i_CAI34124.1, 615_i_7TPG_O-Lig
cealign 608_r_CAI32772.1, 586_r_ACH50550.1
cealign 607_i_CAI34124.1, 571_i_AF-6BAR
cealign 607_i_CAI34124.1, 617_i_AHB32861.1
cealign 607_i_CAI34124.1, 613_i_CAI34369.1
cealign 606_r_AAT77177.1, 612_r_ADC54950.1
cealign 606_r_AAT77177.1, 611_r_AAA97573.1
cealign 607_i_CAI34124.1, 605_i_BAQ02088.1
cealign 607_i_CAI34124.1, 614_i_AAM27615.1
cealign 606_r_AAT77177.1, 606_r_AAT77177.1
cealign 607_i_CAI34124.1, 607_i_CAI34124.1
cealign 608_r_CAI32772.1, 608_r_CAI32772.1
cealign 606_r_AAT77177.1, 610_r_AHB32411.1
cealign 607_i_CAI34124.1, 609_i_CAI34254.1
@src/pymol-visualization/view-607.pml
disable
    enable 615_i_7TPG_O-Lig
    set cartoon_color, 0xeeeeee
    remove hydrogens
    hide labels
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures_selected/615_i_7TPG_O-Lig.png
    show labels
    deselect
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures_selected/615_i_7TPG_O-Lig_labels.png
    @src/pymol-visualization/view-608.pml
disable
    enable 586_r_ACH50550.1
    set cartoon_color, 0xeeeeee
    remove hydrogens
    hide labels
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures_selected/586_r_ACH50550.1.png
    show labels
    deselect
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures_selected/586_r_ACH50550.1_labels.png
    @src/pymol-visualization/view-607.pml
disable
    enable 571_i_AF-6BAR
    set cartoon_color, 0xeeeeee
    remove hydrogens
    hide labels
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures_selected/571_i_AF-6BAR.png
    show labels
    deselect
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures_selected/571_i_AF-6BAR_labels.png
    @src/pymol-visualization/view-617.pml
disable
    enable 617_i_AHB32861.1
    set cartoon_color, 0xeeeeee
    remove hydrogens
    hide labels
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures_selected/617_i_AHB32861.1.png
    show labels
    deselect
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures_selected/617_i_AHB32861.1_labels.png
    @src/pymol-visualization/view-607.pml
disable
    enable 613_i_CAI34369.1
    set cartoon_color, 0xeeeeee
    remove hydrogens
    hide labels
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures_selected/613_i_CAI34369.1.png
    show labels
    deselect
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures_selected/613_i_CAI34369.1_labels.png
    @src/pymol-visualization/view-606.pml
disable
    enable 612_r_ADC54950.1
    set cartoon_color, 0xeeeeee
    remove hydrogens
    hide labels
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures_selected/612_r_ADC54950.1.png
    show labels
    deselect
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures_selected/612_r_ADC54950.1_labels.png
    @src/pymol-visualization/view-606.pml
disable
    enable 611_r_AAA97573.1
    set cartoon_color, 0xeeeeee
    remove hydrogens
    hide labels
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures_selected/611_r_AAA97573.1.png
    show labels
    deselect
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures_selected/611_r_AAA97573.1_labels.png
    @src/pymol-visualization/view-607.pml
disable
    enable 605_i_BAQ02088.1
    set cartoon_color, 0xeeeeee
    remove hydrogens
    hide labels
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures_selected/605_i_BAQ02088.1.png
    show labels
    deselect
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures_selected/605_i_BAQ02088.1_labels.png
    @src/pymol-visualization/view-607.pml
disable
    enable 614_i_AAM27615.1
    set cartoon_color, 0xeeeeee
    remove hydrogens
    hide labels
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures_selected/614_i_AAM27615.1.png
    show labels
    deselect
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures_selected/614_i_AAM27615.1_labels.png
    @src/pymol-visualization/view-606.pml
disable
    enable 606_r_AAT77177.1
    set cartoon_color, 0xeeeeee
    remove hydrogens
    hide labels
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures_selected/606_r_AAT77177.1.png
    show labels
    deselect
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures_selected/606_r_AAT77177.1_labels.png
    @src/pymol-visualization/view-607.pml
disable
    enable 607_i_CAI34124.1
    set cartoon_color, 0xeeeeee
    remove hydrogens
    hide labels
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures_selected/607_i_CAI34124.1.png
    show labels
    deselect
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures_selected/607_i_CAI34124.1_labels.png
    @src/pymol-visualization/view-608.pml
disable
    enable 608_r_CAI32772.1
    set cartoon_color, 0xeeeeee
    remove hydrogens
    hide labels
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures_selected/608_r_CAI32772.1.png
    show labels
    deselect
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures_selected/608_r_CAI32772.1_labels.png
    @src/pymol-visualization/view-606.pml
disable
    enable 610_r_AHB32411.1
    set cartoon_color, 0xeeeeee
    remove hydrogens
    hide labels
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures_selected/610_r_AHB32411.1.png
    show labels
    deselect
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures_selected/610_r_AHB32411.1_labels.png
    @src/pymol-visualization/view-607.pml
disable
    enable 609_i_CAI34254.1
    set cartoon_color, 0xeeeeee
    remove hydrogens
    hide labels
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures_selected/609_i_CAI34254.1.png
    show labels
    deselect
    ray
    png /Users/idamei/phd/data/pymol-visualizations/figures_selected/609_i_CAI34254.1_labels.png
    @src/pymol-visualization/nicify.pml
