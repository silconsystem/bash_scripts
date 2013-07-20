#!/bin/bash
# script utility to create a year range list for datepickers, etc.
# creates array, increments and writes to file
# 2013, R. van Ardenne
# for name/year password combination generator
yearList[0]
startyear = 1900
counter = 0
for ((i = 0; i < 124; i++));
	do
		yearList[$counter] = $startyear++
		echo $yearList[*]
	done
