@src/pymol-visualization/nicify.pml

fetch 7tpg, 615_7TPG_O-Lig
hide cartoon, !chain B
label n. CA and resi 191 and 615_7TPG_O-Lig, "%s-%s" % (resn, resi)
label n. CA and resi 265 and 615_7TPG_O-Lig, "%s-%s" % (resn, resi)
label n. CA and resi 313 and 615_7TPG_O-Lig, "%s-%s" % (resn, resi)
select cons_615_7TPG_O-Lig, resi 191 and 615_7TPG_O-Lig or resi 265 and 615_7TPG_O-Lig or resi 313 and 615_7TPG_O-Lig
show licorice, cons_615_7TPG_O-Lig
load data/eca-pol/alphafold/ACH50550.1/ranked_0.pdb, 586_ACH50550.1
label n. CA and resi 145 and 586_ACH50550.1, "%s-%s" % (resn, resi)
label n. CA and resi 204 and 586_ACH50550.1, "%s-%s" % (resn, resi)
label n. CA and resi 247 and 586_ACH50550.1, "%s-%s" % (resn, resi)
label n. CA and resi 248 and 586_ACH50550.1, "%s-%s" % (resn, resi)
label n. CA and resi 399 and 586_ACH50550.1, "%s-%s" % (resn, resi)
select cons_586_ACH50550.1, resi 145 and 586_ACH50550.1 or resi 204 and 586_ACH50550.1 or resi 247 and 586_ACH50550.1 or resi 248 and 586_ACH50550.1 or resi 399 and 586_ACH50550.1
show licorice, cons_586_ACH50550.1
load /Users/idamei/phd/data/roda/alphafold/AF-Q5SIX3-F1-model_v4.pdb, 571_AF-6BAR
label n. CA and resi 203 and 571_AF-6BAR, "%s-%s" % (resn, resi)
label n. CA and resi 255 and 571_AF-6BAR, "%s-%s" % (resn, resi)
select cons_571_AF-6BAR, resi 203 and 571_AF-6BAR or resi 255 and 571_AF-6BAR
show licorice, cons_571_AF-6BAR
    load data/wzy/alphafold/CAI34369.1/ranked_0.pdb, 613_CAI34369.1
label n. CA and resi 151 and 613_CAI34369.1, "%s-%s" % (resn, resi)
label n. CA and resi 268 and 613_CAI34369.1, "%s-%s" % (resn, resi)
label n. CA and resi 308 and 613_CAI34369.1, "%s-%s" % (resn, resi)
select cons_613_CAI34369.1, resi 151 and 613_CAI34369.1 or resi 268 and 613_CAI34369.1 or resi 308 and 613_CAI34369.1
show licorice, cons_613_CAI34369.1
    load data/wzy/alphafold/AAM27615.1/ranked_0.pdb, 614_AAM27615.1
label n. CA and resi 188 and 614_AAM27615.1, "%s-%s" % (resn, resi)
label n. CA and resi 260 and 614_AAM27615.1, "%s-%s" % (resn, resi)
label n. CA and resi 298 and 614_AAM27615.1, "%s-%s" % (resn, resi)
select cons_614_AAM27615.1, resi 188 and 614_AAM27615.1 or resi 260 and 614_AAM27615.1 or resi 298 and 614_AAM27615.1
show licorice, cons_614_AAM27615.1
    load data/wzy/alphafold/CAI34254.1/ranked_0.pdb, 609_CAI34254.1
label n. CA and resi 182 and 609_CAI34254.1, "%s-%s" % (resn, resi)
label n. CA and resi 189 and 609_CAI34254.1, "%s-%s" % (resn, resi)
label n. CA and resi 281 and 609_CAI34254.1, "%s-%s" % (resn, resi)
select cons_609_CAI34254.1, resi 182 and 609_CAI34254.1 or resi 189 and 609_CAI34254.1 or resi 281 and 609_CAI34254.1
show licorice, cons_609_CAI34254.1
    load data/wzy/alphafold/CAI34124.1/ranked_0.pdb, 607_CAI34124.1
label n. CA and resi 267 and 607_CAI34124.1, "%s-%s" % (resn, resi)
label n. CA and resi 325 and 607_CAI34124.1, "%s-%s" % (resn, resi)
select cons_607_CAI34124.1, resi 267 and 607_CAI34124.1 or resi 325 and 607_CAI34124.1
show licorice, cons_607_CAI34124.1
    load data/wzy/alphafold/BAQ02088.1/ranked_0.pdb, 605_BAQ02088.1
label n. CA and resi 228 and 605_BAQ02088.1, "%s-%s" % (resn, resi)
label n. CA and resi 343 and 605_BAQ02088.1, "%s-%s" % (resn, resi)
label n. CA and resi 348 and 605_BAQ02088.1, "%s-%s" % (resn, resi)
select cons_605_BAQ02088.1, resi 228 and 605_BAQ02088.1 or resi 343 and 605_BAQ02088.1 or resi 348 and 605_BAQ02088.1
show licorice, cons_605_BAQ02088.1
    load data/wzy/alphafold/BAQ02224.1/ranked_0.pdb, 633_BAQ02224.1
label n. CA and resi 217 and 633_BAQ02224.1, "%s-%s" % (resn, resi)
label n. CA and resi 221 and 633_BAQ02224.1, "%s-%s" % (resn, resi)
label n. CA and resi 255 and 633_BAQ02224.1, "%s-%s" % (resn, resi)
select cons_633_BAQ02224.1, resi 217 and 633_BAQ02224.1 or resi 221 and 633_BAQ02224.1 or resi 255 and 633_BAQ02224.1
show licorice, cons_633_BAQ02224.1
    load data/wzy/alphafold/AHB32411.1/ranked_0.pdb, 610_AHB32411.1
label n. CA and resi 162 and 610_AHB32411.1, "%s-%s" % (resn, resi)
label n. CA and resi 207 and 610_AHB32411.1, "%s-%s" % (resn, resi)
label n. CA and resi 244 and 610_AHB32411.1, "%s-%s" % (resn, resi)
select cons_610_AHB32411.1, resi 162 and 610_AHB32411.1 or resi 207 and 610_AHB32411.1 or resi 244 and 610_AHB32411.1
show licorice, cons_610_AHB32411.1
    load data/wzy/alphafold/CAI32823.1/ranked_0.pdb, 612_CAI32823.1
label n. CA and resi 210 and 612_CAI32823.1, "%s-%s" % (resn, resi)
label n. CA and resi 280 and 612_CAI32823.1, "%s-%s" % (resn, resi)
label n. CA and resi 340 and 612_CAI32823.1, "%s-%s" % (resn, resi)
select cons_612_CAI32823.1, resi 210 and 612_CAI32823.1 or resi 280 and 612_CAI32823.1 or resi 340 and 612_CAI32823.1
show licorice, cons_612_CAI32823.1
    load data/wzy/alphafold/AAT77177.1/ranked_0.pdb, 606_AAT77177.1
label n. CA and resi 226 and 606_AAT77177.1, "%s-%s" % (resn, resi)
label n. CA and resi 284 and 606_AAT77177.1, "%s-%s" % (resn, resi)
select cons_606_AAT77177.1, resi 226 and 606_AAT77177.1 or resi 284 and 606_AAT77177.1
show licorice, cons_606_AAT77177.1
    load data/wzy/alphafold/AAM27801.1/ranked_0.pdb, 611_AAM27801.1
label n. CA and resi 173 and 611_AAM27801.1, "%s-%s" % (resn, resi)
label n. CA and resi 176 and 611_AAM27801.1, "%s-%s" % (resn, resi)
label n. CA and resi 191 and 611_AAM27801.1, "%s-%s" % (resn, resi)
label n. CA and resi 234 and 611_AAM27801.1, "%s-%s" % (resn, resi)
label n. CA and resi 291 and 611_AAM27801.1, "%s-%s" % (resn, resi)
label n. CA and resi 349 and 611_AAM27801.1, "%s-%s" % (resn, resi)
select cons_611_AAM27801.1, resi 173 and 611_AAM27801.1 or resi 176 and 611_AAM27801.1 or resi 191 and 611_AAM27801.1 or resi 234 and 611_AAM27801.1 or resi 291 and 611_AAM27801.1 or resi 349 and 611_AAM27801.1
show licorice, cons_611_AAM27801.1
    load data/wzy/alphafold/CAI32772.1/ranked_0.pdb, 608_CAI32772.1
label n. CA and resi 184 and 608_CAI32772.1, "%s-%s" % (resn, resi)
label n. CA and resi 242 and 608_CAI32772.1, "%s-%s" % (resn, resi)
label n. CA and resi 290 and 608_CAI32772.1, "%s-%s" % (resn, resi)
label n. CA and resi 441 and 608_CAI32772.1, "%s-%s" % (resn, resi)
select cons_608_CAI32772.1, resi 184 and 608_CAI32772.1 or resi 242 and 608_CAI32772.1 or resi 290 and 608_CAI32772.1 or resi 441 and 608_CAI32772.1
show licorice, cons_608_CAI32772.1
    load data/wzy/alphafold/AHB32861.1/ranked_0.pdb, 617_AHB32861.1
label n. CA and resi 48 and 617_AHB32861.1, "%s-%s" % (resn, resi)
label n. CA and resi 52 and 617_AHB32861.1, "%s-%s" % (resn, resi)
label n. CA and resi 136 and 617_AHB32861.1, "%s-%s" % (resn, resi)
label n. CA and resi 170 and 617_AHB32861.1, "%s-%s" % (resn, resi)
label n. CA and resi 287 and 617_AHB32861.1, "%s-%s" % (resn, resi)
select cons_617_AHB32861.1, resi 48 and 617_AHB32861.1 or resi 52 and 617_AHB32861.1 or resi 136 and 617_AHB32861.1 or resi 170 and 617_AHB32861.1 or resi 287 and 617_AHB32861.1
show licorice, cons_617_AHB32861.1
    load data/wzy/alphafold/BAQ01641.1/ranked_0.pdb, 631_BAQ01641.1
label n. CA and resi 93 and 631_BAQ01641.1, "%s-%s" % (resn, resi)
label n. CA and resi 120 and 631_BAQ01641.1, "%s-%s" % (resn, resi)
label n. CA and resi 193 and 631_BAQ01641.1, "%s-%s" % (resn, resi)
label n. CA and resi 222 and 631_BAQ01641.1, "%s-%s" % (resn, resi)
label n. CA and resi 343 and 631_BAQ01641.1, "%s-%s" % (resn, resi)
select cons_631_BAQ01641.1, resi 93 and 631_BAQ01641.1 or resi 120 and 631_BAQ01641.1 or resi 193 and 631_BAQ01641.1 or resi 222 and 631_BAQ01641.1 or resi 343 and 631_BAQ01641.1
show licorice, cons_631_BAQ01641.1
    load data/wzy/alphafold/ADI43271.1/ranked_0.pdb, 634_ADI43271.1
label n. CA and resi 57 and 634_ADI43271.1, "%s-%s" % (resn, resi)
label n. CA and resi 157 and 634_ADI43271.1, "%s-%s" % (resn, resi)
label n. CA and resi 192 and 634_ADI43271.1, "%s-%s" % (resn, resi)
label n. CA and resi 315 and 634_ADI43271.1, "%s-%s" % (resn, resi)
select cons_634_ADI43271.1, resi 57 and 634_ADI43271.1 or resi 157 and 634_ADI43271.1 or resi 192 and 634_ADI43271.1 or resi 315 and 634_ADI43271.1
show licorice, cons_634_ADI43271.1
super 615_7TPG_O-Lig, 613_CAI34369.1
cealign 615_7TPG_O-Lig, 614_AAM27615.1
cealign 614_AAM27615.1, 609_CAI34254.1
super 607_CAI34124.1, 609_CAI34254.1
cealign 607_CAI34124.1, 605_BAQ02088.1

cealign 605_BAQ02088.1, 633_BAQ02224.1

cealign 633_BAQ02224.1, 610_AHB32411.1
super 612_CAI32823.1, 610_AHB32411.1
super 606_AAT77177.1, 612_CAI32823.1
cealign 606_AAT77177.1, 611_AAM27801.1
cealign 611_AAM27801.1, 608_CAI32772.1
cealign 608_CAI32772.1, 586_ACH50550.1

super 617_AHB32861.1, 586_ACH50550.1

cealign 617_AHB32861.1, 631_BAQ01641.1
cealign 631_BAQ01641.1, 634_ADI43271.1

disable
    @data/pymol-visualizations/pairwise-views2/view1.pml

    enable 613_CAI34369.1
    enable 615_7TPG_O-Lig
    remove hydrogens
    hide labels
    ray
    png /Users/idamei/phd/data/pymol-visualizations/pairwise_alignments/613_CAI34369.1_615_7TPG_O-Lig.png
    
disable
    @data/pymol-visualizations/pairwise-views2/view1.pml

    enable 615_7TPG_O-Lig
    enable 614_AAM27615.1
    remove hydrogens
    hide labels
    ray
    png /Users/idamei/phd/data/pymol-visualizations/pairwise_alignments/615_7TPG_O-Lig_614_AAM27615.1.png
    
disable
    @data/pymol-visualizations/pairwise-views2/view1.pml

    enable 614_AAM27615.1
    enable 609_CAI34254.1
    remove hydrogens
    hide labels
    ray
    png /Users/idamei/phd/data/pymol-visualizations/pairwise_alignments/614_AAM27615.1_609_CAI34254.1.png
    
disable
    @data/pymol-visualizations/pairwise-views2/view1.pml

    enable 609_CAI34254.1
    enable 607_CAI34124.1
    remove hydrogens
    hide labels
    ray
    png /Users/idamei/phd/data/pymol-visualizations/pairwise_alignments/609_CAI34254.1_607_CAI34124.1.png
    
disable
    @data/pymol-visualizations/pairwise-views2/view2.pml

    enable 607_CAI34124.1
    enable 605_BAQ02088.1
    remove hydrogens
    hide labels
    ray
    png /Users/idamei/phd/data/pymol-visualizations/pairwise_alignments/607_CAI34124.1_605_BAQ02088.1.png
    
disable
    @data/pymol-visualizations/pairwise-views2/view3.pml

    enable 633_BAQ02224.1
    enable 610_AHB32411.1
    remove hydrogens
    hide labels
    ray
    png /Users/idamei/phd/data/pymol-visualizations/pairwise_alignments/633_BAQ02224.1_610_AHB32411.1.png
    
disable
    @data/pymol-visualizations/pairwise-views2/view4.pml

    enable 610_AHB32411.1
    enable 612_CAI32823.1
    remove hydrogens
    hide labels
    ray
    png /Users/idamei/phd/data/pymol-visualizations/pairwise_alignments/610_AHB32411.1_612_CAI32823.1.png
    
disable
    @data/pymol-visualizations/pairwise-views2/view4.pml

    enable 612_CAI32823.1
    enable 606_AAT77177.1
    remove hydrogens
    hide labels
    ray
    png /Users/idamei/phd/data/pymol-visualizations/pairwise_alignments/612_CAI32823.1_606_AAT77177.1.png
    
disable
    @data/pymol-visualizations/pairwise-views2/view5.pml

    enable 606_AAT77177.1
    enable 611_AAM27801.1
    remove hydrogens
    hide labels
    ray
    png /Users/idamei/phd/data/pymol-visualizations/pairwise_alignments/606_AAT77177.1_611_AAM27801.1.png
    
disable
    @data/pymol-visualizations/pairwise-views2/view6.pml

    enable 611_AAM27801.1
    enable 608_CAI32772.1
    remove hydrogens
    hide labels
    ray
    png /Users/idamei/phd/data/pymol-visualizations/pairwise_alignments/611_AAM27801.1_608_CAI32772.1.png
    
disable
    @data/pymol-visualizations/pairwise-views2/view7.pml

    enable 608_CAI32772.1
    enable 586_ACH50550.1
    remove hydrogens
    hide labels
    ray
    png /Users/idamei/phd/data/pymol-visualizations/pairwise_alignments/608_CAI32772.1_586_ACH50550.1.png
    
disable
    @data/pymol-visualizations/pairwise-views2/view8.pml

    enable 617_AHB32861.1
    enable 631_BAQ01641.1
    remove hydrogens
    hide labels
    ray
    png /Users/idamei/phd/data/pymol-visualizations/pairwise_alignments/617_AHB32861.1_631_BAQ01641.1.png
    
disable
    @data/pymol-visualizations/pairwise-views2/view8.pml

    enable 631_BAQ01641.1
    enable 634_ADI43271.1
    remove hydrogens
    hide labels
    ray
    png /Users/idamei/phd/data/pymol-visualizations/pairwise_alignments/631_BAQ01641.1_634_ADI43271.1.png
    @src/pymol-visualization/nicify.pml
