# Meeting 24 Nov 2022 (Bernie, Garry, Kristian, Ida)
Minutes from yesterday

New CAZy families can be made with bulk upload

We need the following files per family:
tabular file: accession, modularity (incomplete c-terminal, n-terminal or both ends) we leave fragments as 0,0
fasta of aligned sequences
list of characterised members (accession)
create the first from the second file
If there are subfamilies, we need each file for each subfamily
We’ll maybe also send the HMMs to CAZy

We build the HMMs based on the NR hits (more data)

Kristian will run CUPP of O-Pols (and we’ll compare with the superclusters)

Garry will work on sugar comparison

# O-Lig structure
7TPG
WP_011517284.1

# Meeting 21 Nov 2022 (with Nicolas and Vincent)
spg (jgi, roscof etc.), ncbi
x586

qle80438.1

Put threshold on coverage

Send all members of supercluster and which cluster they are part of

# Rfc
Old name for O-antigen polymerase

# RfaL
Old name for O-antigen ligase

# Current preferred superclustering:
data/wzy/ssn-clusterings/2210171613/superclusterings/2210191051 (140)

# Meeting 10 Nov 2022
- We are happy with the superclustering (might finetune later, but for now we focus on writing)
- RodA:
    - Family x571, tens of thousands of members
    - Put in the beginning of the paper
    - Ida sends list of biochemically characterized accessions + pdb
- Check O-Pol from Francisella paper (and other mutagenesis studies)
- Make tool for quickly figuring out which family an O-Pol belongs to
- Bernard is going to focus on RodA and discussion
- Ida is going to focus on results and methods

Characterization of the O-antigen Polymerase (Wzy) of Francisella tularensis

Method to find out which cluster a protein belongs to

We are the first at combining sequence space -> machine learning

# Figure program
draw.io

# RodA
* Sjodt, 2018 https://www.nature.com/articles/nature25985 
    - Wildtype (PDB: 6BAR, Uniprot: Q5SIX3, Genbank: BAD71064.1)
    - D255A mustant (PDB: 6BAS)
* Emami, 2017 https://www.nature.com/articles/nmicrobiol2016253
    WP_015384988.1 (based on table in supplementary)
    sequence read from supplementary: msrykkqqspfyqgdlififgvffiisvvsiyaagqfgqygntdwiqqivfyllgavaitvllyfdleqleklslyifiiGILSLIilkispesiapvikgakswfrigritiqpsefmkvglimmlasvigkanpkqvrtlrddihlllkiagvavipvglilmqdagtagicmfivlvmvfmsginwkliaiiagsgillislillvminfpdvaksvgiqdyqikrvtswvsasnetqedsndswqvdqaimaigsggilgngisnlkvyvpesttdfifsiigesfgfigcaivvimfffliyrlvvlidkihpfnrfasffcvgytalivihtfqnigmnigimpvtgipllfvsyggsstlstligfgivynasvqltkyrsylfns
* Cho, 2016 https://www.nature.com/articles/nmicrobiol2016172
    Haven't found accession number
* Meeske, 2016 https://www.nature.com/articles/nature19331
    Haven't found accession number

# Uniprot mapping
https://www.uniprot.org/id-mapping

# Nature communications
https://www.nature.com/ncomms/submit/article
https://www.nature.com/documents/ncomms-submission-guide.pdf

# Common antigen polymerase ECA-Pol
Retaining. The formed bond is alpha-GlcNAc 
https://journals.asm.org/doi/epub/10.1128/mBio.01914-20

# Undecaprenylphosphate
Consists of 11 (undeca) prenyl groups (built from isoprene)

# Role of LPS
Structural support

# Notes Wzy review by Islam
mutations in Wzy affected Wzz-regulation of length (proves Wzy-Wzz interaction)
(check those residues - if they are conserved in the clsuters)

“The genotypic differences in wzx and wzy across diverse bacteria are such that this trait has been exploited to develop PCR-based sero- typing assays for numerous bacteria”

“independent evolution of fold and function, also referred to as nonhomologous isofunctional enzymes”

# Talk with Preben
Department work:
- Stå for server
- Undervise på hans kursus (50 timer, 2 timers forberedelse, 2 timers undervisning, Coot, AlphaFold),  27062 Protein science: Structure, interactions and molecular properties
- Undervise special course eller bachelor eller master project
- Grant applications (25 timer per grant)

Dissemination:
- Reach and Discover

# Department work
I PhD plan står der: max 420 timer department work. Ikke noget min/max på dissemination.

I mail fra Malene 7. september 2021 står der:
420 timer department work:
- min 100 timer TA
- lecturing max 50 timer
- LSU, PhD committee or POB board
- Project (co)-supervision, other tasks

# RodA family
x571

# Deleted Wzys
Two Wzys from E. coli O45 were removed 12 oct 2022:
EHX11459.1 - it was very different from the other O45's and in Genbank it doesn't have a denoted serotype, whereas all the others do. However, it did end up in a cluster, and the sugars in that cluster look similar to CSDB sugar 2593, which is an alternative sugar of E. coli O45.
CAN87666.1 - fragment and otherwise identical to the others.

# Undervisning timer
11 oct: 2 timer
13 Oct: 1,5 time
14 Oct: 9 timer
17 Oct: 1 time
28 Oct: 7 timer
4 Nov: 7 timer
11 Nov: 8,5 timer

# Graph tool: grace

# Relevante legater
https://ida.dk/om-ida/organisation/fonde-og-legater/stoette-til-studierejser

https://www.legatbogen.dk/christian-og-ottilia-brorsons-rejselegat/stoetteomraade/1731

https://augustinusfonden.dk/ansoegning/

https://ddsa.dk/funding/travelgrants/

# Pymol
Flytte labels: Mouse -> 2 button editing
Command + click på label (vær forsigtig med at ramme label og ikke proteinet)

set ray_trace_mode, 0

# Cluster 1
7061 and 1601 - we have evidence for the bond in both of them, but they are not the same phase

# E. coli database
https://nevyn.organ.su.se/ECODAB/index.php

# 
This one is denoted O-antigen polymerase and WzyE in Genbank: AAC45844.
I've removed it from Wzy as it clusters with ECA-Pol.

# skylign

skylign.org

Make interactive logoplot from hmm

# RodA
Peptidoglycan polymerase

# Fragments
AHB32438.2
AHB32614.2
AHB32438.2
EHX11459.1

# Not fragments
ACF61556.1
ACF69242.1
WP_000055605.1
ACF89798.1
ACH50550.1
ACH73921.1
AHB32215.1
AHB32861.1
AHB32799.1
CAI33309.1
CAI33441.1
CAI34080.1
CAI34348.1
CAI34286.1
CAI34310.1
CAI34328.1
CAI34519.1
CAI34657.1

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

# Deleted from selected-wzys.tsv
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

They are currently refining a structure, where Wzy is in the middle of the Wzz complex

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