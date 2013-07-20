#!/bin/bash
# change delimiter in a file

for file in *_*;
	do
		mv "${file}" "${file/_/-}"
	done

# mv changes the filename
# 2013, r.van Ardenne.
# script concept taken from Stackoverflow
