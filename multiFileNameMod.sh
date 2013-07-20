#!/bin/bash
# renaming multiple files by removing first x characters
# courtesy of stackoverflow
for file in *;
do mv $file $(echo $file | sed 's/^.\{20\}//g');
done
