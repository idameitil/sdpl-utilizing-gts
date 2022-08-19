import re, sys, hashlib

def write_fasta(filename, fasta=[], format='adm', verbose=False):
	'''  todo: more sophistocated control of header '''
	cnt = 0
	with open(filename, "w") as fp:
		for f in fasta:
			fp.write(f">{f['acc']}")
			if 'des' in f:
				fp.write(f" {f['des']}")
			fp.write(f"\n{f['seq']}\n")
			cnt += 1
	fp.close()
	if verbose:
		sys.stderr.write(f"Wrote {cnt} FASTA records to file {filename}\n")

def read_fasta(filename, accs=[], verbose=False):
	if verbose:
		print("Filename", filename)
		print("Accs", accs)
		print("Verbose", verbose)
	''' Usage: Read a list of Fasta sequence records
		filename = "/Users/garrygippert/group//wzy_polymerases/garryg/Ftul_Wzy.fa"
		fasta = read_fasta(filename)
		print(fasta)
	    Usage 2: Read specific Fasta sequence records, preserving accession order in the returned list.
		filename = "/Users/garrygippert/group//wzy_polymerases/garryg/Ftul_Wzy.fa"
		fasta = read_fasta(filename, accs=['1ABCXYZ', ...])
		print(fasta)
		NB: it is up to the calling method to ensure that the fasta list matches the accs list.
	'''
	fasta = []
	record = None
	countline = 0
	with open(filename, 'r') as fp:
		while True:
			line = fp.readline()
			if not line:
				break
			line = line.strip()
			# skip blank lines and comment lines
			if re.match("^\s*$", line):
				continue
			if re.match("^\s*#", line):
				continue
			m = re.match("^>(.*)$", line)
			if m:
				w = m.group(1).split()
				acc,des = (w[0],None) if len(w) == 1 else (w[0],' '.join(w[1:]))
				if record is not None:
					if len(accs)==0 or record['acc'] in accs:
						fasta.append(record)
				record = {'acc': acc, 'des': des, 'seq': ''}
				continue
			# else, everything should be appended to the current sequence record
			record['seq'] += line
	if record is not None:
		if len(accs)==0 or record['acc'] in accs:
			fasta.append(record)
	# preserve accessions order using brute force (elegance later using qsort, or similar)
	preserve_order=True
	if preserve_order and len(accs)>0:
		fasta = sorted(fasta, key=lambda f: accs.index(f['acc']))
	# assign sequence md5
	for f in fasta:
		f['md5'] = hashlib.md5(f['seq'].upper().encode('utf-8')).hexdigest()
	return fasta
