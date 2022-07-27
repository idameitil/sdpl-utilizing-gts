
fetch 7TPG
select chain_B, chain B
select chain_L, chain L
hide cartoon, chain_L
select chain_H, chain H
hide cartoon, chain_H
label n. CA and resi 28 and chain_B, "%s-%s" % (resn, resi)
label n. CA and resi 191 and chain_B, "%s-%s" % (resn, resi)
label n. CA and resi 313 and chain_B, "%s-%s" % (resn, resi)
label n. CA and resi 314 and chain_B, "%s-%s" % (resn, resi)
select cons_7TPG, resi 28 and 7TPG and chain_B or resi 191 and 7TPG and chain_B or resi 313 and 7TPG and chain_B or resi 314 and 7TPG and chain_B
show licorice, cons_7TPG
color atomic, cons_7TPG


set label_position,(1,1,1)
set label_color,black
center 
bg_color white 
