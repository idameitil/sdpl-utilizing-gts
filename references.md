# GT66 deleted sequences
## GT66_1
QEU59834
CAL54049

## GT66_3
ADP77078
AJF61370

## GT66_6
AIE93485
AAB91198
ADB58246
AAB90907
AIF12917
AIF21817
AIE91394
AIE93485
AIE94247
AIF09373
AIG97150
QLC49944

## GT66_7
ADT85095 (maybe)

# GT66 structures
Archaea
AAB90907 GT66_6 (3VGP) C-terminal globular domain
AAB91198.1 GT66_6 (3VUO) C-terminal globular domain
AAB90856.1 GT66_6 (3WAI) C-terminal globular domain, (3WAJ) complete
CAB49148.1 GT66_4 (3WOV) C-terminal globular domain
AAL80280.1 GT66_4 (2ZAG) soluble domain
BAA29314.1 GT66_4 (3VUI) C-terminal globular domain

Bacteria:
AAW35590 GT66_2 (3AAG) C-terminal globular domain
ACM64573 GT66_2 (3RCE) complete with protein acceptor and modeled lipid

Human:
NP_689926 GT66_1 (6S7O) complete, in complex with many things, including diphospho-lipid
AAL71884.1 GT66_1 (6S7T) complete, in complex with many things, including diphospho-lipid
BAA06079.1 GT66_1 (2LGZ) C-terminal domain, solution structure, (6C26) complete, in complex with many things, including diphospho-lipid

# Deleted from selected-ezys.tsv
AQU71805.1, AQU71788.1
CAI34388.1 (removed from selected-wzys.tsv). The paper says that the sugar of this serotype is produced from a different gene cluster.
AHB32746.2 (188 AA and no sugar)

# Seed in banned file
AHB32746.2 (188 AA and no sugar)

# E-value to bit score conversion
1e-10	63.5
3e-15	77.4
1e-21	95.5
9e-28	114

# Meeting Morten Nielsen logoplots
220531

Use these parameters:

- “Miminum stack width” to 0.0001 in “advanced settings”
- “Weight on prior” to 0

Upload background frequencies in “Advanced Settings”

The eps format has everything in one

Colour alphafold structure based on information content.
Get information content by multiplying each line in PSFM with each line in PSSM and something else…

# Pymol
Don't make cartoon dotted when showing sidechains:
`set cartoon_side_chain_helper, on`

# Catalytic residues

R (Arg, base), K (Lys, base), D/E (Asp, Glu, acids), Y (Tyr, aromatic, pointing finger), H (His, base)

# Connecting to R drive

In Finder, either hit Command+K to bring up “Connect to Server” or click Go > Connect to Server

# Preben meeting

- Looks good overall
- They are all oriented the same way (what Phobius predicted as cytoplasmic is on the same side for all of them), that’s good
- The prediction of cytoplasmic/non-cytoplasmic regions is reliable (ISSN 17417007)

- Aligned with two different Wzz crystal structures (3B8O, 6rbg)
	(cealign 6RBG and chain A, chain_C)
- They fit quite well, but AlphaFold is also very biased towards crystal structures

- Looked for structural homologs with PDBeFold (`https://www.ebi.ac.uk/msd-srv/ssm/cgi-bin/ssmserver`) (query it with the alphafold model of each one)
    - For Wzx we found several homologs, most of them are MATE transporters (one example is 5Y50, downloaded structure and superimposed, ’struct’ in pymol)
    - For Wzy, we found no good homologs

Next things to do:
- Check if they could be dimers
- Check papers about the MATE proteins (mutational studies, does it form a complex?) Can this be related to the Wzx-Wzy interaction
- Interaction between Wzx and Wzy looks more promising than from both of them to Wzz
- We need to know the stoechiometry

# Chris whitfield meeting

Dead polymerases in the original cluster, a functional one somewhere else


Structure -> turns out the strain is a different one from the one that was sequenced

Old structures

Check who did these sugar structures

Do we need an activation?
Maybe you just need to have the correct positioning

The need for interaction with Wzx or Wzz

People have shown that they do interact

See if you require all three to get complementation (Wzy, Wzx, Wzz)

They distinguish them based on proximity to other genes

Bacteriophages (most abundant)
isolate phages specific for these things

If there is a need for a conserved catalytic macheniry, that restrains evolution
If theres no need you relax the constraints

Flippases have relaxed specifity
Massive expression

peptidoglycan flippase

oligosaccharyl transferase

Peter Reeves results on Wzx

# Journals

Impact factor > 5:
frontiers in microbiology
molecular bioscience
international journal of 
biology
nature microbiology
jbc
int journal microbiology

Impact factor < 5:
carbohydrate research

# Vim

a (append) esc
b (jump to beginning of word)
. (repeat previous edit at current position)
s (change single character)

use_sw_tback

!gen:p

3dd (delete three lines)
ctrl+r (redo)
/yourtext enter -> n, N
Search and replace
`:%s/yourtext/replacetext/g (+c) (search and replace, g means all)`

A (move to end of line and switch to insert mode)
0 (to beginning of line)
`$ (to end of line)`

`:set number`
`D (delete from cursor to end of line)`

# Unix notes

run command -> ctrl+z -> bg

kill %2

jobs

grep '^>' run/BAQ01843.1/blast.out | sed 's/>//' | awk '{print $1}'

history 100 | grep blastdb

comm bla bla2 | more
  309  comm -13 bla bla2 | wc

grep -h '>' run/*/blast.out

grep -h '>' run/*/blast.out | sed 's/>//' | awk '{print $1}' | sort | uniq > polymerase_blast_hits.txt

Fasta histogram of length:
`fasta something.fa | args 1 | hist 10`

# ABC dependent

* Vibrio cholerae: `https://pubmed.ncbi.nlm.nih.gov/15469898/`
* Legionella: `https://www.sciencedirect.com/science/article/pii/S1438422100801046?via%3Dihub`

# HPC

Loading python modules:

`module load python3/3.9.5`
`module load pandas/1.2.4-python-3.9.5`

Kill all jobs:
`bkill 0`

# Other stuff
mlflow: mlflow.org

Weights & Biases: https://wandb.ai/site

Github co-pilot