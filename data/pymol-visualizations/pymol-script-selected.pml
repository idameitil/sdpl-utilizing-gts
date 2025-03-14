@src/pymol-visualization/nicify.pml

fetch 7tpg, 615_i_7TPG_O-Lig
hide cartoon, !chain B
color teal, 615_i_7TPG_O-Lig
label n. CA and resi 191 and 615_i_7TPG_O-Lig, "%s" % (resn)
label n. CA and resi 261 and 615_i_7TPG_O-Lig, "%s" % (resn)
label n. CA and resi 265 and 615_i_7TPG_O-Lig, "%s" % (resn)
label n. CA and resi 313 and 615_i_7TPG_O-Lig, "%s" % (resn)
select cons_615_i_7TPG_O-Lig, resi 191 and 615_i_7TPG_O-Lig or resi 261 and 615_i_7TPG_O-Lig or resi 265 and 615_i_7TPG_O-Lig or resi 313 and 615_i_7TPG_O-Lig
show licorice, cons_615_i_7TPG_O-Lig
    color atomic, (cons_615_i_7TPG_O-Lig and not elem C)
    
load data/eca-pol/alphafold/ACH50550.1/ranked_0.pdb, 586_r_ACH50550.1
color teal, 586_r_ACH50550.1
label n. CA and resi 145 and 586_r_ACH50550.1, "%s" % (resn)
label n. CA and resi 204 and 586_r_ACH50550.1, "%s" % (resn)
label n. CA and resi 247 and 586_r_ACH50550.1, "%s" % (resn)
label n. CA and resi 399 and 586_r_ACH50550.1, "%s" % (resn)
select cons_586_r_ACH50550.1, resi 145 and 586_r_ACH50550.1 or resi 204 and 586_r_ACH50550.1 or resi 247 and 586_r_ACH50550.1 or resi 399 and 586_r_ACH50550.1
show licorice, cons_586_r_ACH50550.1
    color atomic, (cons_586_r_ACH50550.1 and not elem C)
    load /Users/idamei/phd/data/roda/alphafold/AF-Q5SIX3-F1-model_v4.pdb, 571_i_AF-6BAR
color teal, 571_i_AF-6BAR
label n. CA and resi 203 and 571_i_AF-6BAR, "%s" % (resn)
label n. CA and resi 255 and 571_i_AF-6BAR, "%s" % (resn)
select cons_571_i_AF-6BAR, resi 203 and 571_i_AF-6BAR or resi 255 and 571_i_AF-6BAR
show licorice, cons_571_i_AF-6BAR
    color atomic, (cons_571_i_AF-6BAR and not elem C)
    load data/wzy/alphafold/AAM27615.1/ranked_0.pdb, 614_i_AAM27615.1
    color teal, 614_i_AAM27615.1
    label n. CA and resi 188 and 614_i_AAM27615.1, "%s" % (resn)
label n. CA and resi 260 and 614_i_AAM27615.1, "%s" % (resn)
label n. CA and resi 298 and 614_i_AAM27615.1, "%s" % (resn)
select cons_614_i_AAM27615.1, resi 188 and 614_i_AAM27615.1 or resi 260 and 614_i_AAM27615.1 or resi 298 and 614_i_AAM27615.1
show licorice, cons_614_i_AAM27615.1
    color atomic, (cons_614_i_AAM27615.1 and not elem C)
    load data/wzy/alphafold/CAI34254.1/ranked_0.pdb, 609_i_CAI34254.1
    color teal, 609_i_CAI34254.1
    label n. CA and resi 182 and 609_i_CAI34254.1, "%s" % (resn)
label n. CA and resi 189 and 609_i_CAI34254.1, "%s" % (resn)
label n. CA and resi 277 and 609_i_CAI34254.1, "%s" % (resn)
label n. CA and resi 281 and 609_i_CAI34254.1, "%s" % (resn)
select cons_609_i_CAI34254.1, resi 182 and 609_i_CAI34254.1 or resi 189 and 609_i_CAI34254.1 or resi 277 and 609_i_CAI34254.1 or resi 281 and 609_i_CAI34254.1
show licorice, cons_609_i_CAI34254.1
    color atomic, (cons_609_i_CAI34254.1 and not elem C)
    load data/wzy/alphafold/CAI34124.1/ranked_0.pdb, 607_i_CAI34124.1
    color teal, 607_i_CAI34124.1
    label n. CA and resi 158 and 607_i_CAI34124.1, "%s" % (resn)
label n. CA and resi 267 and 607_i_CAI34124.1, "%s" % (resn)
label n. CA and resi 325 and 607_i_CAI34124.1, "%s" % (resn)
select cons_607_i_CAI34124.1, resi 158 and 607_i_CAI34124.1 or resi 267 and 607_i_CAI34124.1 or resi 325 and 607_i_CAI34124.1
show licorice, cons_607_i_CAI34124.1
    color atomic, (cons_607_i_CAI34124.1 and not elem C)
    load data/wzy/alphafold/CAI34369.1/ranked_0.pdb, 613_i_CAI34369.1
    color teal, 613_i_CAI34369.1
    label n. CA and resi 151 and 613_i_CAI34369.1, "%s" % (resn)
label n. CA and resi 268 and 613_i_CAI34369.1, "%s" % (resn)
label n. CA and resi 308 and 613_i_CAI34369.1, "%s" % (resn)
select cons_613_i_CAI34369.1, resi 151 and 613_i_CAI34369.1 or resi 268 and 613_i_CAI34369.1 or resi 308 and 613_i_CAI34369.1
show licorice, cons_613_i_CAI34369.1
    color atomic, (cons_613_i_CAI34369.1 and not elem C)
    load data/wzy/alphafold/BAQ02088.1/ranked_0.pdb, 605_i_BAQ02088.1
    color teal, 605_i_BAQ02088.1
    label n. CA and resi 228 and 605_i_BAQ02088.1, "%s" % (resn)
label n. CA and resi 307 and 605_i_BAQ02088.1, "%s" % (resn)
label n. CA and resi 343 and 605_i_BAQ02088.1, "%s" % (resn)
label n. CA and resi 348 and 605_i_BAQ02088.1, "%s" % (resn)
select cons_605_i_BAQ02088.1, resi 228 and 605_i_BAQ02088.1 or resi 307 and 605_i_BAQ02088.1 or resi 343 and 605_i_BAQ02088.1 or resi 348 and 605_i_BAQ02088.1
show licorice, cons_605_i_BAQ02088.1
    color atomic, (cons_605_i_BAQ02088.1 and not elem C)
    load data/wzy/alphafold/AHB32861.1/ranked_0.pdb, 617_i_AHB32861.1
    color teal, 617_i_AHB32861.1
    label n. CA and resi 48 and 617_i_AHB32861.1, "%s" % (resn)
label n. CA and resi 52 and 617_i_AHB32861.1, "%s" % (resn)
label n. CA and resi 72 and 617_i_AHB32861.1, "%s" % (resn)
label n. CA and resi 136 and 617_i_AHB32861.1, "%s" % (resn)
label n. CA and resi 170 and 617_i_AHB32861.1, "%s" % (resn)
label n. CA and resi 287 and 617_i_AHB32861.1, "%s" % (resn)
select cons_617_i_AHB32861.1, resi 48 and 617_i_AHB32861.1 or resi 52 and 617_i_AHB32861.1 or resi 72 and 617_i_AHB32861.1 or resi 136 and 617_i_AHB32861.1 or resi 170 and 617_i_AHB32861.1 or resi 287 and 617_i_AHB32861.1
show licorice, cons_617_i_AHB32861.1
    color atomic, (cons_617_i_AHB32861.1 and not elem C)
    load data/wzy/alphafold/AHB32411.1/ranked_0.pdb, 610_r_AHB32411.1
    color teal, 610_r_AHB32411.1
    label n. CA and resi 162 and 610_r_AHB32411.1, "%s" % (resn)
label n. CA and resi 207 and 610_r_AHB32411.1, "%s" % (resn)
label n. CA and resi 244 and 610_r_AHB32411.1, "%s" % (resn)
label n. CA and resi 251 and 610_r_AHB32411.1, "%s" % (resn)
select cons_610_r_AHB32411.1, resi 162 and 610_r_AHB32411.1 or resi 207 and 610_r_AHB32411.1 or resi 244 and 610_r_AHB32411.1 or resi 251 and 610_r_AHB32411.1
show licorice, cons_610_r_AHB32411.1
    color atomic, (cons_610_r_AHB32411.1 and not elem C)
    load data/wzy/alphafold/ADC54950.1/ranked_0.pdb, 612_r_ADC54950.1
    color teal, 612_r_ADC54950.1
    label n. CA and resi 133 and 612_r_ADC54950.1, "%s" % (resn)
label n. CA and resi 190 and 612_r_ADC54950.1, "%s" % (resn)
label n. CA and resi 233 and 612_r_ADC54950.1, "%s" % (resn)
label n. CA and resi 249 and 612_r_ADC54950.1, "%s" % (resn)
label n. CA and resi 305 and 612_r_ADC54950.1, "%s" % (resn)
select cons_612_r_ADC54950.1, resi 133 and 612_r_ADC54950.1 or resi 190 and 612_r_ADC54950.1 or resi 233 and 612_r_ADC54950.1 or resi 249 and 612_r_ADC54950.1 or resi 305 and 612_r_ADC54950.1
show licorice, cons_612_r_ADC54950.1
    color atomic, (cons_612_r_ADC54950.1 and not elem C)
    load data/wzy/alphafold/AAT77177.1/ranked_0.pdb, 606_r_AAT77177.1
    color teal, 606_r_AAT77177.1
    label n. CA and resi 165 and 606_r_AAT77177.1, "%s" % (resn)
label n. CA and resi 226 and 606_r_AAT77177.1, "%s" % (resn)
label n. CA and resi 266 and 606_r_AAT77177.1, "%s" % (resn)
label n. CA and resi 284 and 606_r_AAT77177.1, "%s" % (resn)
label n. CA and resi 348 and 606_r_AAT77177.1, "%s" % (resn)
select cons_606_r_AAT77177.1, resi 165 and 606_r_AAT77177.1 or resi 226 and 606_r_AAT77177.1 or resi 266 and 606_r_AAT77177.1 or resi 284 and 606_r_AAT77177.1 or resi 348 and 606_r_AAT77177.1
show licorice, cons_606_r_AAT77177.1
    color atomic, (cons_606_r_AAT77177.1 and not elem C)
    load data/wzy/alphafold/AAM27801.1/ranked_0.pdb, 611_r_AAM27801.1
    color teal, 611_r_AAM27801.1
    label n. CA and resi 173 and 611_r_AAM27801.1, "%s" % (resn)
label n. CA and resi 176 and 611_r_AAM27801.1, "%s" % (resn)
label n. CA and resi 234 and 611_r_AAM27801.1, "%s" % (resn)
label n. CA and resi 291 and 611_r_AAM27801.1, "%s" % (resn)
label n. CA and resi 349 and 611_r_AAM27801.1, "%s" % (resn)
select cons_611_r_AAM27801.1, resi 173 and 611_r_AAM27801.1 or resi 176 and 611_r_AAM27801.1 or resi 234 and 611_r_AAM27801.1 or resi 291 and 611_r_AAM27801.1 or resi 349 and 611_r_AAM27801.1
show licorice, cons_611_r_AAM27801.1
    color atomic, (cons_611_r_AAM27801.1 and not elem C)
    load data/wzy/alphafold/CAI32772.1/ranked_0.pdb, 608_r_CAI32772.1
    color teal, 608_r_CAI32772.1
    label n. CA and resi 184 and 608_r_CAI32772.1, "%s" % (resn)
label n. CA and resi 242 and 608_r_CAI32772.1, "%s" % (resn)
label n. CA and resi 290 and 608_r_CAI32772.1, "%s" % (resn)
label n. CA and resi 441 and 608_r_CAI32772.1, "%s" % (resn)
select cons_608_r_CAI32772.1, resi 184 and 608_r_CAI32772.1 or resi 242 and 608_r_CAI32772.1 or resi 290 and 608_r_CAI32772.1 or resi 441 and 608_r_CAI32772.1
show licorice, cons_608_r_CAI32772.1
    color atomic, (cons_608_r_CAI32772.1 and not elem C)
    load data/wzy/alphafold/BAQ01641.1/ranked_0.pdb, 631_i_BAQ01641.1
    color teal, 631_i_BAQ01641.1
    label n. CA and resi 93 and 631_i_BAQ01641.1, "%s" % (resn)
label n. CA and resi 97 and 631_i_BAQ01641.1, "%s" % (resn)
label n. CA and resi 120 and 631_i_BAQ01641.1, "%s" % (resn)
label n. CA and resi 193 and 631_i_BAQ01641.1, "%s" % (resn)
label n. CA and resi 222 and 631_i_BAQ01641.1, "%s" % (resn)
label n. CA and resi 343 and 631_i_BAQ01641.1, "%s" % (resn)
select cons_631_i_BAQ01641.1, resi 93 and 631_i_BAQ01641.1 or resi 97 and 631_i_BAQ01641.1 or resi 120 and 631_i_BAQ01641.1 or resi 193 and 631_i_BAQ01641.1 or resi 222 and 631_i_BAQ01641.1 or resi 343 and 631_i_BAQ01641.1
show licorice, cons_631_i_BAQ01641.1
    color atomic, (cons_631_i_BAQ01641.1 and not elem C)
    load data/wzy/alphafold/CAI33412.1/ranked_0.pdb, 632_i_CAI33412.1
    color teal, 632_i_CAI33412.1
    label n. CA and resi 149 and 632_i_CAI33412.1, "%s" % (resn)
label n. CA and resi 205 and 632_i_CAI33412.1, "%s" % (resn)
label n. CA and resi 281 and 632_i_CAI33412.1, "%s" % (resn)
select cons_632_i_CAI33412.1, resi 149 and 632_i_CAI33412.1 or resi 205 and 632_i_CAI33412.1 or resi 281 and 632_i_CAI33412.1
show licorice, cons_632_i_CAI33412.1
    color atomic, (cons_632_i_CAI33412.1 and not elem C)
    load data/wzy/alphafold/ABG81806.1/ranked_0.pdb, 633_r_ABG81806.1
    color teal, 633_r_ABG81806.1
    label n. CA and resi 171 and 633_r_ABG81806.1, "%s" % (resn)
label n. CA and resi 217 and 633_r_ABG81806.1, "%s" % (resn)
label n. CA and resi 221 and 633_r_ABG81806.1, "%s" % (resn)
label n. CA and resi 255 and 633_r_ABG81806.1, "%s" % (resn)
select cons_633_r_ABG81806.1, resi 171 and 633_r_ABG81806.1 or resi 217 and 633_r_ABG81806.1 or resi 221 and 633_r_ABG81806.1 or resi 255 and 633_r_ABG81806.1
show licorice, cons_633_r_ABG81806.1
    color atomic, (cons_633_r_ABG81806.1 and not elem C)
    cealign 607_i_CAI34124.1, 615_i_7TPG_O-Lig
cealign 608_r_CAI32772.1, 586_r_ACH50550.1
cealign 607_i_CAI34124.1, 571_i_AF-6BAR
cealign 607_i_CAI34124.1, 614_i_AAM27615.1
cealign 607_i_CAI34124.1, 609_i_CAI34254.1
cealign 607_i_CAI34124.1, 607_i_CAI34124.1
cealign 607_i_CAI34124.1, 613_i_CAI34369.1
cealign 607_i_CAI34124.1, 605_i_BAQ02088.1
cealign 617_i_AHB32861.1, 617_i_AHB32861.1
cealign 606_r_AAT77177.1, 610_r_AHB32411.1
cealign 606_r_AAT77177.1, 612_r_ADC54950.1
cealign 606_r_AAT77177.1, 606_r_AAT77177.1
cealign 606_r_AAT77177.1, 611_r_AAM27801.1
cealign 608_r_CAI32772.1, 608_r_CAI32772.1
cealign 617_i_AHB32861.1, 631_i_BAQ01641.1
cealign 607_i_CAI34124.1, 632_i_CAI33412.1
cealign 606_r_AAT77177.1, 633_r_ABG81806.1
@src/pymol-visualization/nicify.pml
