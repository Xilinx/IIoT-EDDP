#! /usr/bin/python

# Important: Run this file first to fix the path for temporary files in Petalinux projects.

import os


FILENAME="project-spec/configs/config"
KEYWORD="CONFIG_TMP_DIR_LOCATION"

if __name__=="__main__":
	pwd = os.getcwd()
	# Input
	fi = open(FILENAME, "rt")
	lines = fi.readlines()
	fi.close()
	# Output
	fo = open(FILENAME, "wt")
	for line in lines:
		if line.startswith(KEYWORD):
			fo.write(KEYWORD + '="' + pwd + '/build/tmp"\n')
		else:
			fo.write(line)
	fo.close()

