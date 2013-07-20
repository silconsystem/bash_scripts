#!/bin/bash
# change spaces to underscores for multiple files
# courtesy of ArchLinux forum
ls | while read -r FILE
do
	mv -v "$FILE" `echo $FILE | tr ' ' '_' `
done
