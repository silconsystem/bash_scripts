#!/bin/bash
# copy files multiple times
# this script loops the cp command
# and creates multiple instances of the same file
timestamp=$(date +%Y%m%d)
counter=0
for i in {0..20} 
do
	echo created file > "L@TofNAstyCHARS$(printf "%03d" "$i").txt"
done
