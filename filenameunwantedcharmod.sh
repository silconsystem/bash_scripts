#!/bin/bash
# cleanup multiple filenames:
# - remove special characters
# - convert whitespace to delimeter 'e.g.: _ or -'
# - convert filename to lowercase
for x in *;
	do
		if [ -f "$x" ]; then
			lc=${x,,}	# convert to lowercase
			y=${lc// /_}	# convert space to hyphen

			if [ "$x" != "$y" ]; then
			mv "$x" "$y"
		fi
	fi
done
