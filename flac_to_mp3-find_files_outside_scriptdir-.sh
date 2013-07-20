#! /bin/bash
#
# FLAC to Mp3 converter script utility, using lame, flac & id3
# 
# this file looks for FLAC encoded files outside the script directory
# Converts also filenames with spaces
# 2013 R.van Ardenne, source:
# https://wiki.archlinux.org/index.php/Convert_Flac_to_Mp3

find . -type f -name "*.flac" -print0 | while read -d $'\0' a

do
    OUTF=${a%.flac}.mp3

    ARTIST=`metaflac "$a" --show-tag=ARTIST | sed s/.*=//g`
    TITLE=`metaflac "$a" --show-tag=TITLE | sed s/.*=//g`
    ALBUM=`metaflac "$a" --show-tag=ALBUM | sed s/.*=//g`
    GENRE=`metaflac "$a" --show-tag=GENRE | sed s/.*=//g`
    TRACKNUMBER=`metaflac "$a" --show-tag=TRACKNUMBER | sed s/.*=//g`
    DATE=`metaflac "$a" --show-tag=DATE | sed s/.*=//g`

    flac -c -d "$a" | lame -m j -q 0 --vbr-new -V 0 -s 44.1 - "$OUTF"
    id3 -t "$TITLE" -T "${TRACKNUMBER:-0}" -a "$ARTIST" -A "$ALBUM" -y "$DATE" -g "${GENRE:-12}" "$OUTF"
done
