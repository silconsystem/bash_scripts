#!/bin/sh
# wav2mp3.sh, convert .wav files into .mp3
for i in *.wav; do
	if [ -e "$i" ]; then
		file=`basename "$i" .wav`
		lame -h -b 192 "$i" "$file.mp3"
	fi
done
