import math as m

def distance(x1, x2, dim=3):
	''' return Euclidean distance between two N d vectors (assumed to be 3) '''
	sum = 0.0
	for i in range(0, dim):
		delta = x1[i] - x2[i]
		sum += delta*delta
	return m.sqrt(sum)

def squared_distance(A, B):
	d0 = A['xyz'][0] - B['xyz'][0]
	d1 = A['xyz'][1] - B['xyz'][1]
	d2 = A['xyz'][2] - B['xyz'][2]
	return d0*d0 + d1*d1 + d2*d2

def vdot(u=[], v=[]):
	if len(u) != len(v):
		raise Exception(f"vdot - unequal vector lengths {len(u)} vs (len{v})")
	sum = 0.0
	for i in range(0, len(u)):
		sum += u[i] * v[i]
	return sum

def vlen(u=[]):
	sum = 0.0
	for i in range(0, len(u)):
		sum += u[i] * u[i]
	return m.sqrt(sum)
