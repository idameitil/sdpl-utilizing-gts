"""
	Deal with rotation and quaternion transformation matrices.
"""

import math as m

PI=	3.1415926535897932384626433832795028841972
TEMPFACTOR=	(8.0*PI*PI/3.0)
DEGPERRAD=	(180.0/PI)
RADPERDEG=	(PI/180.0)
ROOT2PI=	2.50662827463100024161

def euler_matrix(phi, theta, psi, unit='rad'):
	if unit == 'deg':
		phi *= RADPERDEG
		theta *= RADPERDEG
		psi *= RADPERDEG
	return [[m.cos(psi)*m.cos(phi) - m.cos(theta)*m.sin(phi)*m.sin(psi), m.cos(psi)*m.sin(phi) + m.cos(theta)*m.cos(phi)*m.sin(psi), m.sin(psi)*m.sin(theta)],
		[-m.sin(psi)*m.cos(phi) - m.cos(theta)*m.sin(phi)*m.cos(psi), -m.sin(psi)*m.sin(phi) + m.cos(theta)*m.cos(phi)*m.cos(psi), m.cos(psi)*m.sin(theta)],
		[m.sin(theta)*m.sin(phi), -m.sin(theta)*m.cos(phi), m.cos(theta)]]

def test_euler_matrix():
	''' print xamples of euler matrix '''
	print(euler_matrix(0.1, 0.0, 0.0, unit='deg'))
	print(euler_matrix(0.0, 0.1, 0.0, unit='deg'))
	print(euler_matrix(0.0, 0.0, 0.1/DEGPERRAD))
	raise Exception("test_euler_matrix done")

def unit_rotation():
	unit_rt = [
		[1.0, 0.0, 0.0],
		[0.0, 1.0, 0.0],
		[0.0, 0.0, 1.0] ]
	return unit_rt

def test_unit_rotation():
	unit_mtx = euler_matrix(0.0, 0.0, 0.0)
	# TODO: test that unit_mtx is equivalent to unit_rt

unit_quaternion = [
	[1.0, 0.0, 0.0, 0.0],
	[0.0, 1.0, 0.0, 0.0],
	[0.0, 0.0, 1.0, 0.0],
	[0.0, 0.0, 0.0, 1.0]
]

def quaternion_matrix(b=[0.0,0.0,0.0], r=unit_rotation(), a=[0.0,0.0,0.0]):
	'''
	void dquaternion(double ***q, double *b, double **r, double *a)
	compute quaternion (4x4 transformation matrix) from rotation and
	translation elements:
		b = center of mass translation for structure B
		r = rotation of structure A onto structure B
		a = center of mass translation for structure A
		Q = B x R x A such that Q.xa - xb is minimized
	'''
	q = unit_quaternion
	for i in range(0,4):
		for j in range(0,4):
			q[i][j] = 0.0
	for i in range (0,3):
		for j in range (0,3):
			q[i][j] = r[i][j]
		q[i][3] = b[i]
		for j in range(0,3):
			q[i][3] -= r[i][j] * a[j]
	q[3][3] = 1.0
	return q

def test_unit_quaternion():
	''' Generate default (unit) quaternion '''
	A0 = [0.0, 0.0, 0.0]
	B0 = [0.0, 0.0, 0.0]
	R0 = euler_matrix(0.0, 0.0, 0.0)
	unit_qt = quaternion_matrix(b=B0,r=R0,a=A0)
	# TODO: add strict test that unit_qt == unit_quaternion
	return unit_qt

def nearest(x, p):
	return p * int(x/p + 0.5)

def precise(v, n=3, precision=0.001, format="%8.3f"):
	for i in range (0, n):
		if precision>0:
			v[i] = nearest(v[i], precision)
		if format is not None:
			v[i] = format % v[i]
	return v

def qxv(qt=unit_quaternion, v=[0.0,0.0,0.0], precision=None, format=None):
	''' return vector obtained by multiplying 4x4 quaternion q with 3 vector x '''
	''' precision=0.001, format="%8.3f" '''
	t = [0.0, 0.0, 0.0] # transformed coordinates
	t[0] = qt[0][0] * v[0] + qt[0][1] * v[1] + qt[0][2] * v[2] + qt[0][3]
	t[1] = qt[1][0] * v[0] + qt[1][1] * v[1] + qt[1][2] * v[2] + qt[1][3]
	t[2] = qt[2][0] * v[0] + qt[2][1] * v[1] + qt[2][2] * v[2] + qt[2][3]
	if precision is not None or format is not None: # optional reformatting
		t = precise(t)
	return t
