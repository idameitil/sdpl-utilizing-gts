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

R, K, D/E, Y (pointing finger), H

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