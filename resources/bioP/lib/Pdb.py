import re
import sys
from Euclid import distance
from Euler import qxv

three_letter_codes = {
	'A': "ALA",
	'C': "CYS",
	'D': "ASP",
	'E': "GLU",
	'F': "PHE",
	'G': "GLY",
	'H': "HIS",
	'I': "ILE",
	'K': "LYS",
	'L': "LEU",
	'M': "MET",
	'N': "ASN",
	'P': "PRO",
	'Q': "GLN",
	'R': "ARG",
	'S': "SER",
	'T': "THR",
	'V': "VAL",
	'W': "TRP",
	'Y': "TYR",
	'X': "UNK",
}

single_letter_codes = {v:k for k,v in three_letter_codes.items()}

def tlc(this):
	code = None
	if type(this) is dict and 'tlc' in this:
		code = this['tlc']
	elif str(this) in three_letter_codes:
		code = three_letter_codes[str(this)]
	return code

def slc(this):
	''' return single letter code for residue or residue dict, or 'X' '''
	code = 'X'
	if type(this) is dict and 'slc' in this:
		code = this['slc']
	elif type(this) is dict and 'tlc' in this and this['tlc'] in single_letter_codes:
		code = single_letter_codes[this['tlc']]
	elif str(this) in single_letter_codes:
		code = single_letter_codes[str(this)]
	return code

''' reslist should ideally be a formatted list of actual residue strings, such as:
	list1.append("%3s %s%4d" % (tlc[residue_slc], residue_chain, residue_number))
'''
def getatoms(pdbfile, reslist=[], matching=" CA| C | N | O | CB", altlist=[' ', 'A']):
	''' TODO: chain '''
	''' return a list of atom.hetatm records that (1) are on restlist, have 'matching' atom 'aaa'
		and have an altloc code in [' ', 'A']
	    A previous TODO suggested to add "| C | N | O| CB", but the usecase is not clear
	'''
	atoms = []
	with open(pdbfile, "r") as fp:
		for line in fp:
			if not re.match("^(ATOM|HETATM)", line):
				continue
			line = line.strip()
			nomresidue = line[17:26]
			if len(reslist)>0 and nomresidue not in reslist:
				continue
			atom = ATOM(line)
			name = atom['name']
			if len(matching)>0 and name not in matching:
				continue
			if len(altlist)>0 and atom['alt'] not in altlist:
				continue
			atoms.append(atom)
	return atoms

"""
ATOM/HETAM lines look like this:
ATOM  19058  CA  ALA L 214      19.422  56.522  62.473  1.00 20.71           C
ATOM  19058  CA  ALA L 214    xxxx.xxxyyyy.yyyzzzz.zzzqqqqqqrrrrrr           t
ATOM  a-num nam  tlc crrrr    xxxx.xxxyyyy.yyyzzzz.zzzqqqqqqrrrrrr           t
012345678 012345678 012345678 012345678 012345678 012345678 012345678 012345678
12345678901234567890123456789012345678901234567890123456789012345678901234567890
and sometimes like this:
ATOM    670  CA ASER    45      19.275  21.052  22.635  0.50 11.38      1PLC 793 
ATOM    671  CA BSER    45      19.182  21.159  22.546  0.50 13.02      1PLC 794 
ATOM    671  CA aSER    45      19.182  21.159  22.546  0.50 13.02      1PLC 794 
012345678 012345678 012345678 012345678 012345678 012345678 012345678 012345678
12345678901234567890123456789012345678901234567890123456789012345678901234567890
"""

def ATOM(line="ATOM  19058  CA  ALA L 214      19.422  56.522  62.473  1.00 20.71           C"):
	''' parse a PDB line into atomic information '''
	if not re.match("^(HETATM|ATOM)", line):
		raise Exception("ATOM error : line not HETATM|ATOM\n{}\n".format(line))
	aid = int(line[6:11])
	name = str(line[12:15]) 
	aaa = name
	alt = str(line[16:17])
	tlc = str(line[17:20])
	chn = str(line[21:22])
	resn = tlc
	resi = int(line[22:26]) # duplicate for consistency with pymol
	x = float(line[30:38])
	y = float(line[38:46])
	z = float(line[46:54])
	q = str(line[54:60]) # don't need as number here
	r = str(line[60:66]) # don't need as number here
	t = str(line[77:78])
	nomresidue = str(line[17:26])
	object = { 'aid': aid, 'aaa': aaa, 'name': name, 'alt': alt, 'xyz': [x, y, z], 'q': q, 'r': r, 't': t,
		'tlc': tlc, 'chn': chn, 'resn': resn, 'resi': resi, 'nomresidue': nomresidue,
		'line': line, 'comment': 'aid is atom id <integer>' }
	return object

def test_ATOM():
	sys.stderr.write("Testing return from ATOM")
	coordinates = ATOM()
	sys.stderr.write("Coordinates from ATOM record : {}".format(coordinates))
	raise Exception('done with ATOM test')

backbone_atoms = [" C ", " N ", " O "]

mainchain_atoms = [" C ", " CA", " N ", " O "]

def atoms_from_atoms(source, resi=[], chain='A', include=None, exclude=None):
	''' return subset list of source atoms  matching resi, chain, include and exclude
		update: alternative usage is ..., resi="all", 
	'''
	atoms = []
	all = True if type(resi) is str and resi == 'all' else False
	for atom in source:
		if include and atom['aaa'] not in include:
			continue
		if exclude and atom['aaa'] in exclude:
			continue
		if atom['chn'] != chain:
			continue
		if all:
			atoms.append(atom)
			continue
		if len(resi)>0 and atom['resi'] not in resi:
			continue
		atoms.append(atom)
	return atoms

def atoms_from_pdbfile(pdbfile, resi, chain='A', include=None, exclude=None):
	''' return list of CA+sidechain atoms having selected residue numbers and chain
		There are two use cases for the variable 'resi'. This variable means 'residues'.
		It can either (1) be the string 'all', or (2) be a list of residue integer numbers. 
	    Another change from first inception is that 'exclude' now has default None, instead of backbone.
	'''
	# First, a raw read of every ATOM and HETATM record
	atoms = []
	with open(pdbfile, "r") as fp:
		for line in fp:
			if not re.match("^(ATOM|HETATM)", line):
				continue
			atoms.append(ATOM(line.strip()))
	fp.close()
	# Next a filtering of atoms matching resi, chain, include and exclude parameters
	return atoms_from_atoms(atoms, resi, chain, include, exclude)

def atoms_within_pdbfile(pdbfile, target_atoms, radius=5.0, include=None, exclude=backbone_atoms):
	''' return list of CA+sidechain atoms having distance to any target_atoms below radius 5 A '''
	atoms = []
	with open(pdbfile, "r") as fp:
		for line in fp:
			if not re.match("^(ATOM|HETATM)", line):
				continue
			line = line.strip()
			atom = ATOM(line)
			if include and atom['aaa'] not in include:
				continue
			if exclude and atom['aaa'] in exclude:
				continue
			found = False
			for target in target_atoms:
				if distance(target['xyz'], atom['xyz']) <= radius:
					found = True
					break
			if found:
				atoms.append(atom)
	fp.close()
	return atoms

def resis_from_atoms(atoms=[]):
	''' return list of integer residue numbers (resi values) for a set of atoms '''
	resis = []
	for atom in atoms:
		if atom['resi'] not in resis:
			resis.append(int(atom['resi']))
	return resis

def pdb_seqres(pdb='some.pdb', preferred_chn=None):
	''' read SEQRES lines, and return chain list of residues
		TODO: Add a backup plan reading directly from ATOM|HETATM records
		20220210 garryg
	'''
	seqres = {}
	resi = 1
	chl = {}
	with open(pdb, 'r') as fp:
		for line in fp:
			line = line.strip()
			if not re.match("^SEQRES", line):
				continue
			chn = line[11:12]
			chl[chn] = int(line[13:17])
			seq = line[19:].split()
			if chn not in seqres:
				seqres[chn] = []
			for res in seq:
				resinfo = {
					'tlc': res,
					'slc': slc(res),
					'chn': chn,
					'resi': resi,
					'nomresidue': "%3s %s%4d" % (res, chn, resi)
				}
				seqres[chn].append(resinfo)
				resi += 1
	fp.close()
	if len(seqres) == 0:
		raise Exception("No SEQRES in", pdb)
	for k,v in chl.items():
		if k not in seqres:
			raise Exception(f"PDB chain '{k}' not found in seqres, code error")
		if v != len(seqres[k]):
			raise Exception(f"Expected PDB chain '{k}' length {v} does not match found seqres length {len(seqres[k])}")
	if preferred_chn is None:
		return seqres
	if preferred_chn not in seqres:
		raise Exception(f"Preferred chain '{preferred_chn}' not in SEQRES {pdb}")
	return seqres[preferred_chn]

def aligned_residues(aln, pdb1='mol1.pdb', chn1='A', res1=1, pdb2='mol2.pdb', chn2='A', res2=1):
	''' retrieve two sets of residues for a pair of aligned sequences
		Note, this is somewhat fragile, because PDB files are (possibly) not guaranteed to have
		numerically matching SEQRES index and ATOM|HETATM residue numbers.
		Secondly, pdb_seqres returns a list of dicts, not residue strings.
	'''
	seqres1 = pdb_seqres(pdb1, chn1)
	seqres2 = pdb_seqres(pdb2, chn2)
	gaps = ['-', '+']
	reslist1 = []
	reslist2 = []
	n1 = 0
	n2 = 0
	for i in range(0, aln['plen']):
		a = aln['qaln'][i]
		b = aln['haln'][i]
		ar = None
		br = None
		if a not in gaps :
			if a != seqres1[n1]['slc'] :
				raise Exception(f"Alignment mismatch: i {i} a {a} != seqres1[n1 {n1}] {seqres1[n1]}")
			ar = seqres1[n1]
			n1 += 1
		if b not in gaps :
			if b != seqres2[n2]['slc'] :
				raise Exception(f"Alignment mismatch: i {i} b {b} != seqres2[n2 {n2}] {seqres1[n2]}")
			br = seqres2[n2]
			n2 += 1
		if a in gaps or b in gaps:
			continue
		reslist1.append(ar)
		reslist2.append(br)
	#
	if (len(reslist1) != len(reslist2)):
		raise Exception(f"Aligned residues lists have unequal length: reslist1 {len(reslist1)}, reslist2 {len(reslist2)}")
	return reslist1, reslist2

def equivalent_atoms_test(atoms1=[], atoms2=[]):
	n1 = len(atoms1)
	n2 = len(atoms2)
	if n1 != n2:
		raise Exception(f"Equivalent_atoms_test: lists have unequal lengths list1 {n1} and list2 {n}")
	for i in range(0, n1):
		a = atoms1[i]
		b = atoms2[i]
		if a['name'] != b['name']:
			raise Exception(f"Equivalent_atoms_test: Atoms do not have same 'name':\n{a}\n{b}")

def equivalent_atoms(atoms1=[], atoms2=[], strict=False):
	''' Remove 'dangling' CB atoms in (non-GLY) residues that align to a GLY residue in the other sequence.
	    Using strict=False to avoid residues with atoms in non-canonical order (e.g. SEC)
	'''
	len1 = len(atoms1)
	len2 = len(atoms2)
	i1 = 0
	i2 = 0
	prune1 = []
	prune2 = []
	while ( i1 < len1 and i2 < len2 ):
		a = atoms1[i1]
		b = atoms2[i2]
		if a['name'] == b['name']:
			prune1.append(a)
			prune2.append(b)
		elif re.search('GLY', atoms1[i1-1]['line']) and re.search(' CB', atoms2[i2]['line']):
			i2 += 1
			continue
		elif re.search(' CB', atoms1[i1]['line']) and re.search('GLY', atoms2[i2-1]['line']):
			i1 += 1
			continue
		else:
			if strict:
				raise Exception(f"Atoms mismatch '{a['name']}' != '{b['name']}\n{a}\n{b}")
			else:
				sys.stderr.write(f"Ignoring mismatched atoms '{a['name']}' != '{b['name']}\n{a}\n{b}")
		i1 += 1
		i2 += 1
	# Strict requirement that the equivalenced atom lists have identical length.
	equivalent_atoms_test(prune1, prune2)
	return prune1, prune2

def aligned_atoms(aln, pdb1='mol1.pdb', chn1='A', res1=1, pdb2='mol2.pdb', chn2='A', res2=1):
	''' Return two 'equivalent' sets of atoms (N, CA, C, O and CB) for a pair of aligned sequences.
		1. Get aligned residues.
		2. Get N, CA, C, O and CB atoms in the aligned residues.
		3. Remove CB atoms in (non-GLY) residues that align to GLY in the other sequence.
	'''
	# Get aligned residues
	reslist1, reslist2 = aligned_residues(aln, pdb1, chn1, res1, pdb2, chn2, res2)
	if len(reslist1) != len(reslist2):
		raise Exception(f"Length of residue list1 {len(reslist1)} != list2 {len(reslist2)}")
	# Get selected atoms in the aligned residues
	atoms1 = getatoms(pdb1, [x['nomresidue'] for x in reslist1])
	atoms2 = getatoms(pdb2, [x['nomresidue'] for x in reslist2])
	# Remove non-equivalent atoms
	prune1, prune2 = equivalent_atoms(atoms1, atoms2)
	return prune1, prune2

def write_rotatepdb(pdbfile, reslist, quat, newpdb, base):
	''' Read and write a pdbfile with transformed ATOM/HETATM coordinates.
	    Fill in B factor for atoms in listed (for example aligned) residue.
		formerly putatoms(oldpdbfile, quat, newpdbfile, reslist=[], base=20)
		
	'''
	with open(newpdb, "w") as fpo:
		with open(pdbfile, "r") as fp:
			count = 0
			for line in fp:
				line = line.strip()
				if line == "DATA":
					raise Exception("DATA");
				if re.match("^(ATOM|HETATM)", line):
					if count == 0 :
						fpo.write("REMARK 000 COORDINATES REWRITTEN WITH TRANSFORMATION MATRIX APPLIED COMPARED TO ORIGINAL ENTRY\n")
						fpo.write("REMARK 000 {}\n".format(quat))
					atom = ATOM(line)
					xyz = atom['xyz']
					trx = qxv(quat, xyz, format=True)
					q   = atom['q']
					# aligned /non-aligned residues get a different B factor
					res = line[17:26]
					b  = "%5.2f" % (base if res in reslist else base-10)
					'''
					ATOM  19058  CA  ALA L 214      19.422  56.522  62.473  1.00 20.71           C
					ATOM  19058  CA  ALA L 214    xxxx.xxxyyyy.yyyzzzz.zzzqqqqqqrrrrrr           t
					q = str(line[54:60]) # don't need as number here
					r = str(line[60:66]) # don't need as number here
					t = str(line[77:78])
					'''
					newline = "".join([line[0:30], trx[0], trx[1], trx[2], q, b, line[66:]])
					fpo.write("{}\n".format(newline))
					count += 1
				else:
					fpo.write("{}\n".format(line))

def write_xyz(filename, atoms=[]):
	''' write x y z atom coordinates to a file '''
	count = 0
	with open(filename, 'w') as fp:
		for atom in atoms:
			line = " ".join(["%8.3f" % x for x in atom['xyz']])
			fp.write(f"{line}\n")
			count += 1
	print(f"Wrote {count} xyz positions to {filename}")
