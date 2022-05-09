
def ls(directory="."):
	print(directory)
	cmd=f"ls -lt {directory}"
	s = os.system(cmd)
	print(s, cmd)
	return s

def uniq(input=[]):
	''' first version just do a uniq, later make it more like the command line uniq '''
	vec = []
	for i in input:
		if i not in vec:
			vec.append(i)
	return vec

def venn( input = [] ):
	''' Produce 'Venn' partitioning of elements on a list of lists

		Example with three lists with some shared elements:

			l1 = "386+387+390+471+473+474+549+552+553+554+556+557+558+562+587+592+811+812+813+814+914+923".split('+')
			l2 = "557+558+811+812+813+814+914+923".split('+')
			l3 = "556+557+558+811+812+813+815+916+917".split('+')

			import sys
			from pathlib import Path
			sys.path.append(f"{Path.home()}/bioP/lib")
			from Utils import venn
			r = venn([l1, l2, l3])
			print(r)

			[{'com': [0], 'mem': ['386', '387', '390', '471', '473', '474', '549', '552', '553', '554', '562', '587', '592']},
			 {'com': [1], 'mem': []},
			 {'com': [2], 'mem': ['815', '916', '917']},
			 {'com': [0, 1], 'mem': ['814', '914', '923']},
			 {'com': [0, 2], 'mem': ['556']},
			 {'com': [1, 2], 'mem': []},
			 {'com': [0, 1, 2], 'mem': ['557', '558', '811', '812', '813']} ]

		Limitations:
			Input elements are not type-checked for consistency, e.g., 400 and '400' are different.
			I was too lazy to write a N-pick-M algorithm to generate all possible combinations.
	'''

	def combinations(N):
		'''
		return list of all combinations 'N pick K' in range (0, N) of integers
			combinations(2) produces [[0], [1], [0, 1]]
			combinations(3) produces [[0], [1], [2], [0, 1], [0, 2], [1, 2]]
			etc.]
		There is a combinatorial/recursive way to solve this but I am too lazy on this day 20220223, garryg.
		'''
		com = []
		if N >= 1:
			for i in range(0, N):
				com.append([i])
		if N >= 2:
			for i in range(0, N):
				for j in range(i+1, N):
					com.append([i, j])
		if N >= 3:
			for i in range(0, N):
				for j in range(i+1, N):
					for k in range(j+1, N):
						com.append([i, j, k])
		if N >= 4:
			for i in range(0, N):
				for j in range(i+1, N):
					for k in range(j+1, N):
						for l in range(k+1, N):
							com.append([i, j, k, l])
		if N >= 5:
			for i in range(0, N):
				for j in range(i+1, N):
					for k in range(j+1, N):
						for l in range(k+1, N):
							for m in range(l+1, N):
								com.append([i, j, k, l, m])
		if N >= 6:
			for i in range(0, N):
				for j in range(i+1, N):
					for k in range(j+1, N):
						for l in range(k+1, N):
							for m in range(l+1, N):
								for n in range(m+1, N):
									com.append([i, j, k, l, m, n])
		if N >= 7:
			raise Exception(f"N {N} >= 7, get busy and write a recursive algorithm!")
		return(com)

	if type(input) is not list:
		raise Exception(f"Venn: input must be type 'list', got '{type(input)}'")
	grp = {}
	N = len(input)
	for i in range(0, N):
		if type(input[i]) is not list:
			raise Exception(f"Venn: input segment must be type 'list', got '{type(input[i])}'")
		for e in input[i]:
			if e not in grp:
				grp[e] = []
			grp[e].append(i)
	result = []
	for com in combinations(N):
		mem = []
		for e in sorted(grp):
			if grp[e] == com:
				mem.append(e)
		result.append({'com': com, 'mem': mem})

	return result
