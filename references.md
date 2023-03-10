# Minutes from meeting 10th of March
Meeting minutes:
- Move discussion points to the overleaf document (done)
- We’ll use American spelling
- Architecture figure:
    - We should also show extracellular helices
    - Try to left-align the sequences
    - His/Asp/Glu in inverting families can activate the donor
    - In retaining families, an activation is maybe not needed, just positioning
    - The ones without Arg could use a metal
- Check whether X571 is only RodA or also other SEDS proteins
- Check if PglB from Meeske paper is from GT66. Include in architecture comparison?
- GT51 also uses Und-PP-sugar, but is not transmembrane
- We’ll write to CSDB and send the manuscript when submitting

# FtsW
Is assumed to have a similar role as RodA in the divisome (Meeske)

# Minutes from meeting 2nd March
- We will have to cite Alexander and Locher paper, but otherwise it won’t affect the content of the paper
- We will include family comparison heatmap and architecture overview (Ida will make figure nicer)
- Ida will migrate the manuscript to overleaf this week (put figures in the end)
- Bernie will enter the O-Pol seeds in CAZy (start with <e-50)
- Garry will work on sugar heatmap of all families and making tree based on sugar similarity

# Overleaf template
New Project -> Example project

# Preben pymol
colors: lightblue
Hide stuff that is in front of what you show (but write in the figure caption that you hid it)
Use slab
select loop, resi309:324
set cartoon_fancy_helices

# Meeting minutes 15 Feb 2023
- Ida will go through the references for the seeds (maybe make iTOL label file with references)
- A link to the sugar tree is above, if someone wants to have a look at them
- Ida will send a tsv file with protein accession, family and CSDB linear to Garry
- Figure with architecture comparison
    - Get representative sequence
    - Phobius
    - Make figure with comparison
    - Ida will send MSAs for each family to Garry

# Meeting minutes Garry 8 Feb 2023
Sugar comparison tool
- Break down into bonds and sugars
- Should it be adapted to O-Pols? Put more weights to the ends?
- Different lengths are penalized too much

# Dali
Search for structural homologs
http://ekhidna2.biocenter.helsinki.fi/dali/

# Undervisning Prebens kursus
Installation etc January: 1-2 timer
Wed 25/1: 2 timer
Mon 30/2: (2t forelæsning), 2t konfrontation

# CAZy families
The following CAZy families were made. X616 and X617 were later merged into X617:

- X571, RodA (was made within the CAZy system by Bernie)
- X586, ECA-Pol, retaining (`data/eca-pol/MSA_CAZy_family/clade1-pruned-mafft.fa`)
- X605, 0260_4_5, inverting (`data/wzy/ssn-clusterings/2210171613/superclusterings/2210191051/superclusters/0260_4_5/0260_4_5.accs_pruned-mafft.fa`)
    - `data/wzy/ssn-clusterings/2210171613/superclusterings/2210191051/superclusters/0260_4_5/ssn_clusters/0027_45-mafft.fa`
    - `data/wzy/ssn-clusterings/2210171613/superclusterings/2210191051/superclusters/0260_4_5/ssn_clusters/0104_12-mafft.fa`
    - `data/wzy/ssn-clusterings/2210171613/superclusterings/2210191051/superclusters/0260_4_5/ssn_clusters/0126_9-mafft.fa`
- X606, 0144_2_14, retaining (`data/wzy/ssn-clusterings/2210171613/superclusterings/2210191051/superclusters/0144_2_14/0144_2_14.accs_pruned-mafft.fa`)
    - `data/wzy/ssn-clusterings/2210171613/superclusterings/2210191051/superclusters/0144_2_14/ssn_clusters/0021_52-mafft.fa`
    - `data/wzy/ssn-clusterings/2210171613/superclusterings/2210191051/superclusters/0144_2_14/ssn_clusters/0123_10-mafft.fa`
- X607, 0141_1_28, inverting (`data/wzy/ssn-clusterings/2210171613/superclusterings/2210191051/superclusters/0141_1_28/0141_1_28.accs_pruned-mafft.fa`)
- X608, 0134_4_6, retaining (`data/wzy/ssn-clusterings/2210171613/superclusterings/2210191051/superclusters/0134_4_6/0134_4_6.accs_pruned-mafft.fa`)
    - `data/wzy/ssn-clusterings/2210171613/superclusterings/2210191051/superclusters/0134_4_6/ssn_clusters/0016_79-mafft.fa`
    - `data/wzy/ssn-clusterings/2210171613/superclusterings/2210191051/superclusters/0134_4_6/ssn_clusters/0017_68-mafft.fa`
    - `data/wzy/ssn-clusterings/2210171613/superclusterings/2210191051/superclusters/0134_4_6/ssn_clusters/0021_53-mafft.fa`
    - `data/wzy/ssn-clusterings/2210171613/superclusterings/2210191051/superclusters/0134_4_6/ssn_clusters/0080_14-mafft.fa`
- X609, 0118_1_30, inverting (`data/wzy/ssn-clusterings/2210171613/superclusterings/2210191051/superclusters/0118_1_30/0118_1_30.accs_pruned-mafft.fa`)
- X610, 0128_1_29, retaining (`data/wzy/ssn-clusterings/2210171613/superclusterings/2210191051/superclusters/0128_1_29/0128_1_29.accs_pruned-mafft.fa`)
- X611, 0284_3_9, retaining (`data/wzy/ssn-clusterings/2210171613/superclusterings/2210191051/superclusters/0284_3_9/0284_3_9.accs_pruned-mafft.fa`)
    - `data/wzy/ssn-clusterings/2210171613/superclusterings/2210191051/superclusters/0284_3_9/ssn_clusters/0028_44-mafft.fa`
    - `data/wzy/ssn-clusterings/2210171613/superclusterings/2210191051/superclusters/0284_3_9/ssn_clusters/0252_2-mafft.fa`
- X612, 0342_13_2, retaining (`data/wzy/ssn-clusterings/2210171613/superclusterings/2210191051/superclusters/0342_13_2/0342_13_2-new-mafft.fa`)
    - `data/wzy/ssn-clusterings/2210171613/superclusterings/2210191051/superclusters/0342_13_2/ssn_clusters/0132_6-mafft.fa`
    - `data/wzy/ssn-clusterings/2210171613/superclusterings/2210191051/superclusters/0342_13_2/ssn_clusters/0068_18-mafft.fa`
Removed SSN clusters 188, 40, 70, 134, 31
- X613, 0540_8_3, inverting (`data/wzy/ssn-clusterings/2210171613/superclusterings/2210191051/superclusters/0540_8_3/0540_8_3-new-mafft.fa`)
Removed SSN clusters 32, 127
- X614, 0171_6_4, mixed (`data/wzy/ssn-clusterings/2210171613/superclusterings/2210191051/superclusters/0171_6_4/0171_6_4-new-pruned-mafft.fa`)
    - `data/wzy/ssn-clusterings/2210171613/superclusterings/2210191051/superclusters/0171_6_4/ssn_clusters/0017_65-mafft.fa`
    - `data/wzy/ssn-clusterings/2210171613/superclusterings/2210191051/superclusters/0171_6_4/ssn_clusters/0032_42-mafft.fa`
    - `data/wzy/ssn-clusterings/2210171613/superclusterings/2210191051/superclusters/0171_6_4/ssn_clusters/0070_17-mafft.fa`
Removed SSN clusters 75, 72, 60
- X615, O-antigen ligases, inverting (`data/waal/final_family/ligase-mafft.fa`)
    - `data/waal/final_family/final_subfamilies/subfamily1/accessions-pruned-mafft.fa`
    - `data/waal/final_family/final_subfamilies/subfamily2/accessions-pruned-mafft.fa`
    - `data/waal/final_family/final_subfamilies/subfamily3/accessions-pruned-mafft.fa`
    - `data/waal/final_family/final_subfamilies/subfamily4/accessions-pruned-mafft.fa`
- OLD X616, 1085_39_1 (SSN cluster 0221_4), inverting (`data/wzy/ssn-clusterings/2210171613/superclusterings/2210191051/superclusters/1085_39_1/0221_4/0221_4.accs_pruned-mafft.fa`)
- OLD X617, 1085_39_1 (SSN clusters 0250_3 and 0129_7), inverting (`data/wzy/ssn-clusterings/2210171613/superclusterings/2210191051/superclusters/1085_39_1/1085_39_1-final-mafft.fa`)
    - `data/wzy/ssn-clusterings/2210171613/superclusterings/2210191051/superclusters/1085_39_1/0250_3/0250_3.accs_pruned-mafft.fa`
    - `data/wzy/ssn-clusterings/2210171613/superclusterings/2210191051/superclusters/1085_39_1/0129_7/0129_7.accs_pruned-mafft.fa`
- new X617, 1085_39_1 (complete) (`data/wzy/ssn-clusterings/2210171613/superclusterings/2210191051/superclusters/1085_39_1/sequences-cdhit0.90-pruned-mafft.fa`)
    - `data/wzy/ssn-clusterings/2210171613/superclusterings/2210191051/superclusters/1085_39_1/0043_28/0043_28.accs_pruned-mafft.fa`
    - `data/wzy/ssn-clusterings/2210171613/superclusterings/2210191051/superclusters/1085_39_1/0055_22/0055_22.accs-pruned-mafft.fa`
    - `data/wzy/ssn-clusterings/2210171613/superclusterings/2210191051/superclusters/1085_39_1/0129_7/0129_7.accs_pruned-mafft.fa`
    - `data/wzy/ssn-clusterings/2210171613/superclusterings/2210191051/superclusters/1085_39_1/0221_4/0221_4.accs_pruned-mafft.fa`
    - `data/wzy/ssn-clusterings/2210171613/superclusterings/2210191051/superclusters/1085_39_1/0221_4/0221_4.accs_pruned.fa`

# Project number and task number
Project number: 27 - ...
Task number: X-2 (for courses and stuff)

# ECA-Pol vs O-Pol
hmmsearch data/eca-pol/seeds-and-hits57-cdhit0.99_mafft_maxit1000.hmm data/wzy/wzy.fasta
gave no hits => there are no ECA-Pols left in the 

# Unique sugars
We have 327 unique sugars (21 Dec 2022).

# b-band LPS
Pseudomonas aeruginosa produces two glycoforms of O-antigen, A and B band. B band is the immunodominant cell surface antigen

# blastdbcmd
"Error: [blastdbcmd] Skipped"
happens because the nr db was updated since blast was run. Ie. some of them are missing now.

# Deleted ECA-Pol seed
AAC45844
It's called WzyE in Genbank, but it also says O-antigen polymerase.
In the tree of Wzys including ECA-Pols, they don't cluster with the other ECA-Pols.

# O-Pol sequence read from paper
"Conserved-residue mutations in Wzy affect O-antigen polymerization and Wzz-mediated chain-length regulation in Pseudomonas aeruginosa PAO1"

myilarvdrsillntvllfaffsatvwvnnnyiyhlydymgsakktvdfglypylmvlalicallcggairrpgdllvtllvvilvphslvlnganqyspdaqpwagvplaiafgiliigivnkirfhplgalqrenqgrrmlvllsvlnivvlvfiffksagyfsfdfagqyarralarevfaagsangylssigtqaffpvlfawgvyrrqwfylvlgivnalvlwgafgqkypfvvlfliyglmvyfrrfgqvrvswvvcallmllllgalehevfgysflndyflrrafivpstllgavdqfvsqfgsnyyrdtllgallgqgrteplsfrlgteifnnpdmnanvnffaiaymglgyvgvmaesmlvggsvvlmnflfsrygafmaipvallfttkileqslltvmlgsgvflmllflalisfplkmslgktl

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

# O-Lig ligase structure
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
- Check O-Pol from Francisella tularensis paper (and other mutagenesis studies)
- Make tool for quickly figuring out which family an O-Pol belongs to
- Bernard is going to focus on RodA and discussion
- Ida is going to focus on results and methods

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

# Undervisning timer, Jespers kursus 2022
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

Flytte labels: Mouse -> 2 button editing
Command + click på label (vær forsigtig med at ramme label og ikke proteinet)

set ray_trace_mode, 0

remove hydrogens

clipping planes, slab (scroll)

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