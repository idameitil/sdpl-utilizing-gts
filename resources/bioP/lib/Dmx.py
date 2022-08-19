''' DMX distance matrix utilities '''

import re
def read_dmx_list(dmxfile, select=[]):

	dmx = {}
	with open(dmxfile, "r") as fp:
		for line in fp.readlines():
			if re.match('^#', line):
				continue
			a, b, d = line.strip().split()
			if len(select) == 0 or ( a in select and b in select ) :
				dmx[a,b] = d
	return dmx
