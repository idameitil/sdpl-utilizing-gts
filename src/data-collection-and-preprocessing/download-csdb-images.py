#! /usr/bin/python3
''' Download png images for csdb sugars
'''

import os
import re
import sys
import csv
import wget
import pandas as pd

DB = "data/csdb/CSDB_slice_for_Ida.txt"

os.system("ls -l {}".format(DB))

images = "data/csdb/images"

def not_pd_null(value):
    return not pd.isnull(value)

def doit(cmd, forgive=False):
	s = os.system(cmd)
	if s != 0 :
		sys.stderr.write("{} = system({})\n".format(s, cmd))
		if not forgive :
			raise Exception("system call non zero")
	return s

def fetch_snfg_image(record_id, csdb_linear, scale=3, overwrite=False):
	outfil = f"{images}/{record_id}.gif"
	clean = False
	if clean :
		cmd = "/bin/rm -f {}".format(outfil)
		doit(cmd)
	if os.path.isfile(outfil) :
		if not overwrite :
			print("File exists {}, and not overwrite ... skipping\n".format(outfil))
			return
	print("record_id: {} linear: {}\n".format(record_id, csdb_linear))
	'''
		Some of the direct CSDB_linear images are not rendered properly by csdb themselves, therefore we allow to strip comment sections.

		Some of these rendering failures are mitigated by removal of square-bracketed sections. Others are not so easy.
		For example 110981
	'''

	print("record_id: {} linear: {}\n".format(record_id, csdb_linear))
	image_url = f"http://csdb.glycoscience.ru/database/core/graphic.php?to_draw={csdb_linear}&scale={scale}&on_white=0&backdrop=checkers&no_reducing=0"
	print("IMAGE_URL:".format(image_url))
	try:
		# Use wget download method to download specified image url.
		wget.download(image_url)
		# move to specific image file
		cmd = 'mv -f graphic.php {}'.format(outfil)
		doit(cmd)
		print("record_id: {} linear: {}, outfile %s created".format(record_id, csdb_linear, outfil))
	except:
		print("Cannot get image for CSDB id", record_id)
		leave_evidence_of_having_tried = True
		if leave_evidence_of_having_tried :
			if not os.path.isfile(outfil):
				doit('touch ' + outfil)
			
	print("DONE {} {}\n".format(record_id, csdb_linear))

polymerase_df = pd.read_csv("data/wzy/wzy.tsv", sep='\t', dtype={'CSDB_record_ID':'string'})
waal_df = pd.read_csv("data/waal/waal.tsv", sep='\t', dtype={'CSDB_record_ID':'string'})
# wanted = list(polymerase_df.CSDB_record_ID.dropna())
# hits_df = pd.read_csv("data/wzy/blast-full-genbank/1e-15/hits-enriched.tsv", sep='\t', dtype={'CSDB_record_ID_y':'string'})
# wanted = list(hits_df.CSDB_record_ID_y.dropna())

# Open DB file, iterate over rows, avoiding record_ids we have already seen
for index, row in polymerase_df.iterrows():

	if not not_pd_null(row.CSDB_record_ID):
		continue

	fetch_snfg_image(row.CSDB_record_ID, row.CSDB_Linear_corrected)

for index, row in waal_df.iterrows():

	if not not_pd_null(row.CSDB_record_ID):
		continue

	fetch_snfg_image(row.CSDB_record_ID, row.CSDB_Linear_corrected)
