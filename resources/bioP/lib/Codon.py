''' codon methods
'''
# Genetic codes from https://www.ncbi.nlm.nih.gov/Taxonomy/taxonomyhome.html/index.cgi?chapter=cgencodes#SG11
genetic_code = {
	1: {
		'AAs'    : 'FFLLSSSSYY**CC*WLLLLPPPPHHQQRRRRIIIMTTTTNNKKSSRRVVVVAAAADDEEGGGG',
		'Starts' : '---M------**--*----M---------------M----------------------------',
		'Base1'  : 'TTTTTTTTTTTTTTTTCCCCCCCCCCCCCCCCAAAAAAAAAAAAAAAAGGGGGGGGGGGGGGGG',
		'Base2'  : 'TTTTCCCCAAAAGGGGTTTTCCCCAAAAGGGGTTTTCCCCAAAAGGGGTTTTCCCCAAAAGGGG',
		'Base3'  : 'TCAGTCAGTCAGTCAGTCAGTCAGTCAGTCAGTCAGTCAGTCAGTCAGTCAGTCAGTCAGTCAG',

	},
	11 : {
 		'AAs'    : 'FFLLSSSSYY**CC*WLLLLPPPPHHQQRRRRIIIMTTTTNNKKSSRRVVVVAAAADDEEGGGG',
 		'Starts' : '---M------**--*----M------------MMMM---------------M------------',
 		'Base1'  : 'TTTTTTTTTTTTTTTTCCCCCCCCCCCCCCCCAAAAAAAAAAAAAAAAGGGGGGGGGGGGGGGG',
 		'Base2'  : 'TTTTCCCCAAAAGGGGTTTTCCCCAAAAGGGGTTTTCCCCAAAAGGGGTTTTCCCCAAAAGGGG',
 		'Base3'  : 'TCAGTCAGTCAGTCAGTCAGTCAGTCAGTCAGTCAGTCAGTCAGTCAGTCAGTCAGTCAGTCAG',
	}
}

def translate(dna, transl_table=1):
	''' codons = [dna[i:i+n] for i in range(0, len(dna), n)] '''
	if transl_table not in genetic_code:
		raise Exception("transl_table {} not in genetic_code\n".format(transl_table))
	trans = genetic_code[transl_table]
	table = {}
	start = {}
	for i in range(0, len(trans['AAs'])):
		aa = trans['AAs'][i]
		codon = trans['Base1'][i] + trans['Base2'][i] + trans['Base3'][i]
		table[codon] = aa
		st = trans['Starts'][i]
		if st != '-':
			start[codon] = st
	n = 3
	pro = []
	for codon in [dna[i:i+n] for i in range(0, len(dna), n)]:
		aa = '*' if len(codon) < n else table[codon]
		aa = start[codon] if len(pro) == 0 and codon in start else aa
		pro.append(aa)
	return ''.join(pro)
