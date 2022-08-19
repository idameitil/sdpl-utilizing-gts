# Some methods for working with protein sequence/structure alignments

import re

'''
Example of a CE (Combinatorial Extension) output alignment 

# /Users/garrygippert/src2/ce/ce_distr/ce/ce align_ent cedb 6sdr 6tg9 6 1.0 2.0
# ce::align_ent 6sdr.A 1005 6tg9.A 958
#ce_1 from align_ent Chain 1: 6sdr.A (Size=1005) Chain 2: 6tg9.A (Size=958)
ALIGN 6sdr.A/6tg9.A/CE_06_1.00_2.00
TYPE  CE winsize 6 rmsdthr 1.00 jointhr 2.00
MOL1  6sdr.A 1004 1005
MOL2  6tg9.A  958  958
SCORE -999.99 MSCORE -999.99 ZSCORE 6.23
ARMSD 1.94
PLEN 1297 ALEN 979 MLEN 666 GLEN 313 ILEN 173 OLEN 27
FORMAT H

MTVTRRHFLKLSAGAAVAGAFTGLGLSLAPTVARAELQKLQWA+++++++
++++++++++++++++++++++++++++++++++++++++++++++++++
++++++++++++++++++++++++++++++++++++++++++++++++++
++++++++++++++++++++++++++++++++++++++++++++++++++
++++++++++++++++++++++++++++++++++++++++++++++++++
++++++++++++++++++++++++++++++++++++++++++++KQTTSI
CCYCAVGCGLIVHTAKDGQGRAVNVEGDPDHPINEGSLCPKGASIFQLGE
NDQRGTQPLYRAPFSDTWKPVTWDFALTEIAKRIKKTRDASFTEKNAAGD
LVNRTEAIASFGSAAMDNEECWAYGNILRS-LGLVYIEHQARIXHSPTVP
ALAESFGRGAMTNHWNDLANSDCILIMGSNAAENHPIAFKWVLRAKDKGA
TLIHVDPRFTRTSAR----CDVYAPIRSGADIPFLGGLIKYILDNKLYFT
DYVREYTNASLIVGEKFSFKDGLFSGYDAANKKYDKSMWAFELDANGVPK
RDPALKHPRCVINLLKKHYER--YNLDKVAAITGTSKEQLQQVYKAYAAT
GKPDKAGTIMYAMGWTQHSVGVQNIRAMAMIQLLLGNIGVAGGGVNALRG
ESNVQGSTDQGLLAHIWPGYNPVPNSKAATLELYNAATPQSKDPMSVNWW
QNRPKYV----ASYLKALYPDEEPAAAYDYLPRIDAGRKLTDYFWLNIFE
KMDKGEFKGLFAWGMNPACGGANANKNRKAMGKLEWLVNVNLFENETSSF
WKGPGMNPAEIGTEVFFLPCCVSIEKEGSVANSGRWMQWRYRGPKPYAET
KPDGDIMLDMFKKVRELYAKEGGAYPAPIAKLNIADWEEHNEFSPTKVAK
LMNGYFLKDTEVGGKQFKKGQQVPSFAFLTADGSTCSGNWLHAGSFTDAG
NLMARRDKTQTPEQARIGLFPNWSFCWPV------NRRILYNRASVDKTG
KPWNPAKAVIEWKDGKWVGDVVDGGGDPGTKHPFIMQTHGFGALYGPGRE
EGPFPEHYEPLECPVSKNPFSKQLHNPVAFQIEGEKKAVCDPRYPFIGTT
YRVTEHWQTGLMTRRCAWLVEAEPQIFCEISKELAKLRGIGNGDTVKVSS
LRGALEAVAIVTERIRPFKIEGVDVHMVGLPWHYGWMVPKNGGDTANLLT
PSAGDPNTGIPETKAFMVDVRKV++++++++++++++++++++++++

+++++++++++++++++++++++++++++++++++++++++++MKDLIIP
PLDWTQDMGTPKREGAPVHLTIDGVEVTVPAGTSVLRAAAEAGISIPKLC
ATDNVEPVGSCRLCMVEIEGMRGTPTSCTTPVAPGMRVHTQTPQLQKLRR
GVMELYISDHPLDCLTCAANGDCELQDMAGAVGLREVRYQAKDTHFARRD
ATGPNPRYIPKDNSNPYFSYDPAKCIVCMRCVRACEEVQGTFALTVMGRG
FDARISPAAPDFLSSDCVSCGACVQACPTATLVEKSVERIGTPERKVVTT
CAYCGVGCSFEAHMLG---DQLVRMVPWKGGAANRGHSCVKGRFAYGYAT
HQDRILKPMIRDKITDPWREVNWTEALDFTATRLRALRDSHG--------
----ADALGVITSSRCTNEETYLVQKLARAVFGTNNTDTCARVCHSPTGY
GLKQTFGTSAGTQDFDSVEETDLALVIGANPTDGHPVFASRLRKRLRAGA
KLIVVDPRRIDLLNTPHRGEAWHLQLKPGTNVAVMTAMAHVIVTEQIFDK
RFIGDRCDW-----------------------------------------
---------DEWADYAEFVANPEYAPEAVESLTGVPAGLLRQAARAYAAA
----PNAAIYYGLGVTEHSQGSTTVIAIANLAMMTGNIGRPGVGVNPLRG
QNNVQGSCDMGSFPHEFPGYRHVS--------------------------
------DDATRGLFERTWG---------VTLSSEP------GLRIPNMLD
AAVEGRFKALYVQGEDILQSDPDTRHVSAGLAAMDLVIVHDLFLNETANY
-------------AHVFLPGSTFLEKDGTFTNAERRINRVRRVMAPK-AG
FADWEVTQMLANALG----------------AGWH--YT----HPSEIMA
EIA---------------------------------ATTPGFAAVT---Y
EMLDA----------------RGSVQWPCNEKAPEGSPIMHVE-------
--------------------------------GFVR---GKGRF------
--IRTAYLPTDEKT--------------------------GPRFPLLLTT
GRILSQYNVGAQTRRT-ENTVWHGEDRLEIHPTDAETRGIRDGDWVRLAS
RAGETTLRATVTDRVSP--------GVVYTTFHHP-------DTQANVVT
TDTSDWATNCPEYKVTAVQVAASNGPSDWQQDYAAQAAAARRIEAAE
'''

# TODO rename from_cealn_record to more general. Also using to read Alignfastas output as of 20220212 GarryG.
def aln_from_cealn_record(alignmentrecord, return_if_empty=None):
	def assign(k, v, d={}):
		if k in d:
			if d[k] != v:
				raise Exception(f"Trying up update k {k} v {v} into dict d {d}")
		d[k] = v

	''' Return ALIGN record as dict, or return_if_empty '''
	aln = {}
	record = alignmentrecord.split('\n')
	n = len(record)
	i = 0
	for i in range(0, n):
		line = record[i]
		if re.match('^$', line):
			continue;
		if line[0] == '#':
			continue
		#
		w = line.split()
		# Adding to parse the very first line from alignfastas
		# see also ~/bioC/fasta/alignfastas.c Garry P. Gippert
		if re.match("^[0-9][0-9]x[0-9][0-9]", line):
			'''
#~ IxJ   Protein1                                         Len1 Protein2                                                                                    Len2 Plen Alen Mlen Ilen Glen Olen I/M    As  Ms  A'     M'     Ab     Mb     Zscore   Pscore    Ms1 Ms2 Msr  SDis1      Sdis2      SDis
   00x01 ACQ50287|Bacillus_anthracis_str._A0248|571-674__  104 AAA75477|Acidothermus_cellulolyticus_11B|465-562                                              98  127   78   75   22    3    2 0.2933 123 148  36.04  42.71  51.99  61.62 12.8749   5.08163  413 403  -75  97.749     94.2164    94.2164
			'''
			group, protein1, len1, protein2, len2, plen, alen, mlen, ilen, glen, olen, pct, ascore, mscore, ap, mp, ab, mb, zscore, pscore, ms1, ms2, msr, sdis1, sdis2, sdis = line.split()
			assign('qry', protein1, aln)
			assign('hit', protein2, aln)
			assign('qlen', int(len1), aln)
			assign('hlen', int(len2), aln)
			assign('plen', int(plen), aln)
			assign('alen', int(alen), aln)
			assign('mlen', int(mlen), aln)
			assign('ilen', int(ilen), aln)
			assign('glen', int(glen), aln)
			assign('olen', int(olen), aln)
			assign('pct', float(pct), aln)
			assign('ascore', float(ascore), aln)
			assign('mscore', float(mscore), aln)
			#assign('ap', float(ap), aln)
			#assign('mp', float(mp), aln)
			#assign('ab', float(ab), aln)
			#assign('mb', float(mb), aln)
			assign('zscore', float(zscore), aln)
			assign('pscore', float(pscore), aln)
			assign('ms1', float(ms1), aln)
			assign('ms1', float(ms1), aln)
			assign('msr', float(msr), aln)
			assign('scoredist1', float(sdis1), aln)
			assign('scoredist2', float(sdis2), aln)
			assign('scoredist',  float(sdis),  aln)
		elif w[0] == 'ALIGN':
			q, h, m = w[1].split('/')
			assign('qry', q, aln)
			assign('hit', h, aln)
			assign('method', m, aln)
		elif w[0] == 'TYPE':
			assign('type', w[1], aln)
		elif w[0] == 'MOL1':
			assign('qry', w[1], aln)
			assign('qlen', int(w[2]), aln)
		elif w[0] == 'MOL2':
			assign('hit', w[1], aln)
			assign('hlen', int(w[2]), aln)
		elif w[0] == 'SCORE':
			assign('zscore', float(w[5]), aln)
		elif w[0] == 'ARMSD':
			assign('armsd', float(w[1]), aln)
		elif w[0] == 'PLEN':
			assign('plen', int(w[1]), aln)
			assign('alen', int(w[3]), aln)
			assign('mlen', int(w[5]), aln)
			assign('glen', int(w[7]), aln)
			assign('ilen', int(w[9]), aln)
			if re.match('OLEN', line):
				assign('olen', int(w[11]), aln)
		elif re.match('FORMAT H', line):
			i += 2
			while(record[i] != ''):
				if 'qaln' not in aln:
					aln['qaln'] = ''
				aln['qaln'] += record[i]
				i += 1
			i += 1
			while(record[i] != ''):
				if 'haln' not in aln:
					aln['haln'] = ''
				aln['haln'] += record[i]
				i += 1
	return return_if_empty if len(aln) == 0 else aln

def aln_from_cealn_file(cealn_file):
	''' Usage:
		from Align import aln_from _cealn_file
		aln = aln_from_cealn_file('cedb-6sdr-6tg9-8-3.0-4.0.out')
	
		Designed to read output generated from CE program.
		Note: aln_from_cealn_record(record) used to read Alignfastas -sh output.

	'''
	with open(cealn_file, "r") as fp:
		cealn_record = fp.read()
		aln = aln_from_cealn_record(cealn_record)
		return aln
	return None

def read_align(filename, verbose=False):
	''' Specifically read an Alignfasta -sh output file, and return a list of alignment records.
		TODO: so, does that mean we should change the name to read_alignfastas_outformat_sh ?

		Let's call it 'align.out'.
		The secret is splitting the input on a record separator.
		Alignfastas was not designed with that in mind.
		So we currently adopt a strategy of splitting on the first record word

			00x00, as in:

				#~ IxJ Protein1                                             Len1 Protein2       
				                                      Len2 Plen   Alen   Mlen   Ilen   Glen   Ol
				en   I/M          As     Ms     A'     M'     Ab     Mb Zscore Pscore    Ms1    
				Ms2    Msr  SDis1  Sdis2   SDis
				00x01 ACQ50287|Bacillus_anthracis_str._A0248|571-674__    104 AAC06196|Actinomyc
				es_sp._40|380-481              102    111     98     95     29      3      2 0.3
				053   134    159  38.97  45.65  56.22  65.85 13.0299 5.18291    513    498    -9
				5 91.6123 90.4338 90.4338


			aka, the pattern matching "\n[0-9][0-9]x[0-9][0-9]".
			I have not decided on the importance of parsing the first line in this format, as it is a left-over
			from another kind of output.
	'''
	pattern ="\n[0-9][0-9]x[0-9][0-9]"
	records = None
	aligns = []
	with open(filename, "r") as fp:
		filecontents = fp.read()
		records = re.split(pattern, filecontents)
		if verbose:
			print("Record", 0, records[0])
			print("Record", 1, records[1])
			print("Record", -1, records[-1])
		for record in records:
			if re.search("ALIGN", record):
				aln = aln_from_cealn_record("00x00" + record) # see rename note elsewhere
				if verbose:
					print("Just read an alignment:", aln)
				if aln :
					aligns.append(aln)
	return aligns
