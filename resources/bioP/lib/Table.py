# See also https://blogs.harvard.edu/rprasad/2014/06/16/reading-excel-with-python-xlrd/

""" Table methods
	A 'table' is a list of lists of dict cells with a reserved set of keys.

		#! /usr/bin/python3
		# Example, write a table containing a single cell in a single row
		from Table import table_write_json
		cell = { 'key': 'cellkey', 'value': 'cellvalue' }.
		row = []
		row.append(cell)
		table = []
		table.append(row)
		table_write_json(table, filename='my.json', rotate=True)

	Please note the distinction:
		Right: { 'key': 'A', 'value': 1 }
		Wrong: { 'A' : 1 }

	Reserved keys:
		Required: 'key' and 'value'
		Optional: 'type'
		TODO for Excel-like behaviour: 'color', 'bgcolor', 'url', 'comment'

	Scalar vs dict and list values.
		TODO
"""

import os
import os.path
import re
import sys
import json
import xlrd
from xlrd.sheet import ctype_text
import xlwt

def table_validate(table=[]):
	''' test that 'table' is a list of lists of dict elements with at least 'key' and 'value' elements
		TODO: add option to not check existence of 'value'
		TODO: check for duplicate keys
		TODO: check for some rows that are completely disjoint to other rows (non-overlapping keys)
	'''
	if type(table) != list:
		raise Exception("Filename %s does not contain list data" % filename)
	i = 0
	for row in table:
		i += 1
		if type(row) != list:
			raise Exception("Filename %s data row %d does not list data '%'" % ( filename, i, row))
		j = 0
		for cell in row:
			j += 1
			if type(cell) != dict:
				raise Exception("Filename %s data row %d cell %d not dict (%s) '%'" % (filename, i, j, type(cell),str(cell)))
			if 'key' not in cell:
				raise Exception("Filename %s data row %d cell %d missing key '%s'" % (filename, i, j, str(cell)))
			if 'value' not in cell:
				raise Exception("Filename %s data row %d cell %d missing value '%s'" % (filename, i, j, str(cell)))
	return True

def table_dict(table=[], key='rowkey'):
	''' return a dictionary keyed by primary/unique rowkey.
		print(table1)
		[
			[{ 'key': 'Name', 'value': 'Kz1', ...},],
			...
		]
		dict1 = table_dict(table1, key='Name')
		print(dict1)
		{
			'Kz1' : [{ 'key': 'Name', 'value': 'Kz1', ...},], 
			...
		}
	'''
	#table_validate(table)
	tdict = {}
	for row in table:
		cell = row_cell(row, key)
		if cell is None:
			raise Exception("Cell matching key: {} not found: {}".format(key, row))
		value = cell['value']
		if value is None or value in ['']:
			raise Exception("Cell matching key: {} has value {}".format(key, value))
		if value in tdict:
			raise Exception("Table contains duplicate key '{}' {}".format(key, value))
		tdict[value] = row
	return tdict

def table_read_json(filename="my.json", format='json'):
	''' read json into table
		TODO: implement other formats, if format == 'json' or filename suffix == 'json'
	'''
	try:
		with open(filename, 'r') as fp:
        		table = json.load(fp)
		fp.close()
	except:
		raise Exception("Filename %s does not contain json data" % filename)
	table_validate(table)
	return table

def table_read(filename, format='json', default=[]):
	if not os.path.isfile(filename):
		return default
	return table_read_json(filename, format)

def table_columns(table=[]):
	table_validate(table)
	keys = []
	for row in table:
		for cell in row:
			key = cell['key']
			if key is None or key == '':
				continue
			# Accumulate column header (key) and count
			column = row_cell(keys, key)
			if column == None:
				item = {
					'key': key,
					'count': 1,
				}
				if 'unit' in cell:
					item['unit'] = cell['unit']
				keys.append(item)
			else:
				column['count'] += 1
	# consider to return count
	return(keys)

def table_keyvalues(table=[], key='rowkey', strict=True):
	''' return list of key values in order of appearance.
	'''
	values = []
	for row in table:
		for cell in row:
			if 'key' not in cell:
				msg = "table_keyvalues 'key' not in cell {}".format(cell)
				if strict:
					raise Exception(msg)
				else:
					sys.stderr.write("Skip %s\n".format(msg))
					continue
			if 'value' not in cell:
				msg = "table_keyvalues 'value' not in cell {}".format(cell)
				if strict:
					raise Exception(msg)
				else:
					sys.stderr.write("Skip %s\n".format(msg))
					continue
			if cell['key'] == key:
				value = cell['value']
				if value in values:
					msg = "table_keyvalues duplicate key '{}' value {}".format(key, value)
					if strict:
						raise Exception(msg)
					else:
						sys.stderr.write('Allow %s\n'.format(msg))
				values.append(value)
	return values

def die(msg=None):
	raise Exception(msg);

def do_file_rotate(filename='filename', t=10):
	sys.stderr.write('doing rotate {}\n'.format(filename));
	if os.path.isfile(filename):
		cmd = 'rotate -t {} {}'.format(t, filename)
		s = os.system(cmd)
		sys.stderr.write("Status {} for `{}`\n".format(s, cmd))

def reversed_string(a_string):
    return a_string[::-1]

def prepare_filename(suffix=".suffix (including dot)", filename="canbejustaprefix", rotate=True):
	'''
	Descr: Returns altered filename parameter with added extension. Optionally rotates file.
	Usage: filename=prepare_filename(suffix='.xlsx', my_filenamne, rotate=True)
	'''
	xiffus=reversed_string(suffix)
	emanelif=reversed_string(filename)
	if not re.match(xiffus,emanelif):
		print("no re.match({}, {})".format(xiffus, emanelif))
		# TODO check for dot, etc.
		filename += suffix
		sys.stderr.write("Writing to {}\n".format(filename))
	if rotate :
		do_file_rotate(filename, t=100)
	return filename

def count_rows(table=[]):
	return len(table)

def count_cells(table=[]):
	count = 0
	for row in table:
		count += len(row)
	return count

def table_write_json(table=[], filename='random.json', rotate=True):
	''' write table to json, append '.json' to filename as necessary '''
	table_validate(table)
	filename = prepare_filename('.json', filename, rotate)
	with open(filename, 'w') as fp:
		json.dump(table, fp, ensure_ascii=False, indent=4)
	fp.close()
	sys.stderr.write("Write_json to {} from table containing {} rows, {} cells\n".format(
		filename, count_rows(table), count_cells(table)));
	
def table_write_excel(table=[], filename="my.xlsx", sheetname='Sheet 1', rotate=False):
	''' write table to excel, append '.xlsx' to filename as necessary '''
	columns = table_columns(table)
	header_font = xlwt.Font()
	header_font.name = 'Arial'
	header_font.bold = True
	header_style = xlwt.XFStyle()
	header_style.font = header_font
	workbook = xlwt.Workbook()
	sheet = workbook.add_sheet(sheetname)
	filename = prepare_filename('.xlsx', filename, rotate)
	i = 0
	# write header row
	if True:
		j = 0
		for col in columns:
			value = col['key']
			if 'unit' in col:
				value += '\n' + col['unit']
			sheet.write(i, j, value, header_style)
			j += 1
		i += 1
	# write numerical data rows with specific formatting
	fmt = {
		'int': '0',
		'float': '0.0',
		'exp': '0.0E+00'
	}
	# example custom numerical formats
	# { 'key': 'blah', 'value': 0.932, 'fmt': '0.000' } -> will display as 0.932
	# { 'key': 'blah', 'value': 0.932, 'fmt': 'float' } -> will display as 0.9 (is this correct?)
	styles = { }
	for row in table:
		j = 0
		for col in columns:
			cell = row_cell(row, col['key'])
			if cell != None:
				if 'fmt' not in cell or cell['fmt'] == 'str':
					sheet.write(i, j, cell['value'])
				else:
					f = cell['fmt']
					if f not in styles:
						styles[f] = xlwt.XFStyle()
						if f in fmt:
							styles[f].num_format_str = fmt[f]
						else:
							styles[f].num_format_str = f
					sheet.write(i, j, cell['value'], styles[f])
			j += 1
		i += 1
	workbook.save(filename)
	sys.stderr.write("Write_xlsx to {} from table containing {} rows, {} cells\n".format(
		filename, count_rows(table), count_cells(table)));

def type_value_decimal_number(t, v):
	# WARNING, does not work for arbitrary/faulty numbers.
	# Detect number, and convert 'comma' (danish/french) numbers to decimal
	# TODO: Generalize to arbitrary numbers, for example
	#	1.000.000,0 -> 1000000.0
	#	1,000,000.0 -> 1000000.0
	# TODO: detect faulty numbers, with too many decimal or too many comma
	# First strip leading and trailing whitespace
	x = str(v).strip()
	# recognize integers
	if re.match(r'^[-+]?[0-9]+$', x):
		return('integer', int(x))
	# recognize decimal number
	if re.match(r'^[-+]?([0-9]*[.])?[0-9]+([eE][-+]?\d+)?$', x):
		return('float', float(x))
	# recognize comma number, convert to decimal
	if re.match(r'^[-+]?([0-9]*[,])?[0-9]+([eE][-+]?\d+)?$', x):
		nx = x.replace(',', '.')
		sys.stderr.write("Number with comma %s converted to decimal %s\n" % (x, nx))
		return('float', float(nx))
	# return unaltered
	return t, v
	# Some proposed test cases
	raise Exception(type_value_decimal_number('this', '100,0.0'))
	raise Exception(type_value_decimal_number('this', ' 6.4 '))
	raise Exception(type_value_decimal_number('this', ' 6,4 '))
	raise Exception(type_value_decimal_number('this', '6,4'))
	raise Exception(type_value_decimal_number('this', '6.4'))
	raise Exception(type_value_decimal_number('this', '1,000.0'))
	raise Exception(type_value_decimal_number('this', '1,000,000.0'))
	raise Exception(type_value_decimal_number('this', '1,0000,000.0')) # faulty
	raise Exception(type_value_decimal_number('this', '1.000.000,0'))
	raise Exception(type_value_decimal_number('this', '1.0000.000,0')) # faulty
	raise Exception(type_value_decimal_number('this', '1.000.000,0,0')) # faulty etc.

def table_read_excel(filename='my.xlsx'):
	''' read Excel file into workbook
	'''
	book = xlrd.open_workbook(filename)
	sys.stderr.write("excel {} sheet names {}\n".format(filename, book.sheet_names()))
	# get first sheet
	sheet = book.sheet_by_index(0)
	# print first row values and types
	# get column names and units from zeroth row
	names = []
	units = []
	sheet_row = sheet.row(0)
	for idx, cell in enumerate(sheet_row):
		cn = cell.value
		try:
			n,u = cn.split('\n', 2)
		except:
			n,u = cn,None
		names.append(n)
		units.append(u)
	sys.stderr.write("colum names {}\ncolumn units {}\n".format(names, units))
	strict = False
	types = []
	table = []
	append_empty = False
	# get data from first-Nth rows
	for rx in range(1, sheet.nrows):
		sheet_row = sheet.row(rx)
		table_row = []
		for idx, sheet_cell in enumerate(sheet_row):
			n = names[idx]
			v = sheet_cell.value
			t = ctype_text.get(sheet_cell.ctype, 'unknown type')
			# set type of None and blanks to 'empty'
			if v in [None, ' '] or re.match(r'\s+', str(v)):
				t = 'empty'
			# fix flip-flop interpretation of numbers as text
			t, v = type_value_decimal_number(t, v)
			if rx == 1:
				types.append(t)
			if t != types[idx]:
				if t not in ['empty']:
					msg = "Row %d, Column %d Name %s, sheet_cell type '%s' value '%s' does not match '%s'" % (rx, idx, n, t, v, types[idx])
					sys.stderr.write("%s\n" % msg)
					if strict:
						raise Exception(msg)
					else:
						types[idx] = t
			table_cell = {'key': n, 'type': t, 'value': v, 'row': rx+1, 'col': idx+1}
			if units[idx] != None:
				table_cell['unit'] = units[idx]
			if type != 'empty' or append_empty:
				table_row.append(table_cell)
		table.append(table_row)
		#TODO: accumulate 'statistics' on column cell types, and review table data to point out non-compliant cells.
	sys.stderr.write("colum names {}\ncolumn types {}\n".format(names, types))
	return table

''' ROW Methods '''

verbose = False # again, object parameter
def row_cellkeys(row=[], strict=True, verbose=False):
	''' return list of cell 'key' values in order of appearance
		Disallow duplicate key or value None if strict is True.
	'''
	keys = []
	for cell in row:
		if 'key' not in cell:
			key = None
			msg = 'row_cellkeys keyless cell {} in row {}\n'.format(cell, row)
			if strict:
				raise Exception(msg)
			else:
				sys.stderr.write('Allow %s\n'.format(msg))
		else:
			key = cell['key'] 
		if key in keys:
			msg = 'row_cellkeys duplicate key {} in row {}\n'.format(key, row)
			if strict:
				raise Exception(msg)
			else:
				sys.stderr.write('Allow %s\n'.format(msg))
		keys.append(key)
	if verbose:
		print('row_cellkeys', keys)
	return keys

def row_cell_exactkey(row=[], key='exactkey', all=False, require_value=False):
	result = []
	for cell in row:
		if 'key' not in cell:
			raise Exception("Exactkey", key, "Cell missing 'key':", cell)
		if cell['key'] == key:
			if require_value and 'value' not in cell:
				raise Exception("Exactkey", key, "Require_value and Cell missing 'value':", cell)
			result.append(cell)
	if all:
		return result
	return result[0] if len(result)>0 else None

def row_cell_matchkey(row=[], key='regexp', all=False, require_value=False):
	result = []
	for cell in row:
		if 'key' not in cell:
			raise Exception("Matchkey", key, "Cell missing 'key':", cell)
		if re.match(key, cell['key']):
			if require_value and 'value' not in cell:
				raise Exception("Matchkey", key, "Require_value and Cell missing 'value':", cell)
			result.append(cell)
	if all:
		return result
	return result[0] if len(result)>0 else None

def row_cell(row=[], key='somekey', match='exact', all=False, require_value=False):
        if match in [ 'e', 'exact' ]:
                return row_cell_exactkey(row, key, all=all, require_value=require_value)
        elif match in [ 'r', 'regex', 'match' ]:
                return row_cell_matchkey(row, key, all=all, require_value=require_value)
        else:
                raise Exception("Match must be 'exact' or 'match'")

def row_cell_value(row=[], key='somekey', match='exact', all=False, require_value=True):
	return row_cell(row, key, match, all, require_value)['value']

def row_unique_identifier(row=[], identifier_key='blah_underscore_blah', local_row_cell_key='row_native unique identifier'):
	# TODO die if identifier value not defined or None
	identifier_value = row_cell_value(row, local_row_cell_key)
	identifier_cell = row_cell(row, identifier_key) 
	if identifier_cell is None:
		row.append({'key': identifier_key, 'value': identifier_value})
	elif 'value' not in identifier_cell:
		raise Exception("'value' not in existing identifier cell {}".format(identifier_cell))
	elif identifier_value != identifier_cell['value']:
		raise Exception("'value' {} != to existing identifier cell {}".format(value, identifier_cell))
	return row

''' MERGE methods '''

def row_merge(row_1=[],row_2=[],key='rowkey'):
	''' return row formed by combining cells of row_1 and row_2
	'''
	if row_1 is None:
		raise Exception('row_merge row_1 is None')
	if type(row_1) is not list:
		raise Exception('row_merge row_1 is not list {}'.format(type(row_1)))
	if row_2 is None:
		raise Exception('row_merge row_2 is None')
	if type(row_2) is not list:
		raise Exception('row_merge row_2 is not list {}'.format(type(row_2)))
	row = []
	verbose = False
	for cell in row_1:
		found = (row,ocell['key'])
		if found is None:
			row.append(cell)
		else:
			if 'value' not in cell:
				raise Exception('value not in cell {}'.format(cell))
			if 'value' not in found:
				raise Exception('value not in found {}'.format(found))
			if cell['value'] == found['value']:
				if verbose:
					print("Skip identical cells")
			elif str(cell['value']).strip() == str(found['value']).strip():
				if verbose:
					print("Skip near identical cells {} and found {}".format(cell, found))
			else:
				raise Exception('row_merge does not allow alteration from found {} to proposed {}'.format(found, cell))
	for cell in row_2:
		found = row_cell(row, cell['key'])
		if found is None:
			if verbose:
				print("Some data in row2 not in row1: {} {}".format(cell['key'], found))
			row.append(cell)
		else:
			if 'value' not in cell:
				raise Exception('value not in cell {}'.format(cell))
			if 'value' not in found:
				raise Exception('value not in found {}'.format(found))
			if cell['value'] == found['value']:
				if verbose:
					print("Skip identical cells")
			elif str(cell['value']).strip() == str(found['value']).strip():
				if verbose:
					print("Skip near identical cells {} and found {}".format(cell, found))
			else:
				raise Exception('row_merge does not allow alteration from found {} to proposed {}'.format(found, cell))
			if verbose:
				print("Apparent duplicate {} value {} : {}".format(cell['key'], cell['value'], cell))
	return row

def table_merge(table1=[], table2=[], key='rowkey', flexible=False):
	''' return table formed by merging rows of two tables having identical rowkeys.
	'''
	dict1 = table_dict(table1, key)
	dict2 = table_dict(table2, key)
	#
	# Quick check if dicts have identical keys
	for k in dict1.keys():
		if k not in dict2:
			msg = 'Key from table1 {} not found in table2'.format(k)
			if flexible:
				sys.stderr.write(f'{msg}\n')
			else:
				raise Exception(msg)
	for k in dict2.keys():
		if k not in dict1:
			msg ='Key from table2 {} not found in table1'.format(k)
			if flexible:
				sys.stderr.write(f'{msg}\n')
			else:
				raise Exception(msg)
	#
	# Accumulate merged rows in principal order
	table=[]
	for value in table_keyvalues(table1, key):
		if value is None:
			raise Exception('Not allowed: table_keyvalues {} is None'.format(value))
		# use dict1 and dict2
		row1 = dict1[value]
		row2 = dict2[value]
		row = row_merge(row1, row2, key)
		table.append(row)
		# TODO delete dict1[value] and delete dict2[value] and 
		#	at the end make sure that dict1 and dict2 are empty
	return table

def cellvaluetrivial(cell, key=None):
	if key is None:
		key = 'key'
	if key not in cell:
		sys.stderr.write("Key '{}' not in cell {}\n".format(key, cell))
		return True
	value = cell[key]
	if value is None or value == '':
		if verbose:
			sys.stderr.write("cell[key: {}] None or '' in cell {}\n".format(key, cell))
		return True
	if 'type' in cell and cell['type'] == 'empty':
		sys.stderr.write("cell[key: {}] valid, but type 'empty' in cell {}\n".format(key, cell))
		return True
	return False

def cellvaluematches(cell={}, matches=[]):
	if 'value' not in cell:
		raise Exception("cellvaluematches: invalid cell does not contain 'value' {}".format(cell))
	if cellvaluetrivial(cell, 'value'):
		return False
	value = cell['value']
	if value in matches:
		if verbose:
			sys.stderr.write("Value {} in matches {}".format(value, matches))
		return True;
	value = re.sub("\.[0-9]$","", value)
	if value in matches:
		sys.stderr.write("Reduced_value {} in matches {}".format(value, matches))
		return True
	for mat in matches:
		if re.match(value, mat):
			sys.stderr.write("RE.match( value: {}, mat: {} ) for mat in matches {}\n".format(value, mat, matches))
			return True
	return False

def rowoneof(row=[], oneof=[]):
	'''
		return first nontrivial 'key', 'value' pair in the row, where key is one of a list
		key, value = rowoneof(row, ['firstkey', 'secondkey'])
	'''
	for cell in row:
		if 'key' not in cell:
			raise Exception("No 'key' in cell {}".format(cell))
		if cell['key'] not in oneof:
			continue
		if cellvaluetrivial(cell, 'value'):
			continue
		return cell['key'], cell['value']
	return None, None

def rowfasta(row=[], fp=sys.stderr, accession_keys=[], sequence_keys=[]):
	'''
		if rowfasta(row, fp, accession_keys=['protein_accession', 'wgs_accession'], sequence_keys=['sequence']):
			count_fasta_records_written_to_fp += 1
	'''
	if len(accession_keys) == 0:
		raise Exception("rowfasta requires non-zero accession_keys")
	if len(sequence_keys) == 0:
		raise Exception("rowfasta requires non-zero sequence_keys")
	akey, protein_accession = rowoneof(row, accession_keys)
	if protein_accession is None:
		sys.stderr.write("Row does not have oneof ({}), row {}\n".format(accession_keys, row))
		return False
	skey, protein_sequence = rowoneof(row, sequence_keys)
	if protein_sequence is None:
		sys.stderr.write("Row does not have oneof ({}), row {}\n".format(sequence_keys, row))
		return False
	fp.write(">{}\n{}\n".format(protein_accession, protein_sequence))
	return True
