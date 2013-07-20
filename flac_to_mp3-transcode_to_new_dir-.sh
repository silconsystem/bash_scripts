#! /bin/bash
#
# FLAC to Mp3 convertor script utility using lame, flac, id3
# Script will transcode from one given directory to another
# usage: ./flac_to_mp3.sh /path/to/flac/dir /path/to/mp3/dir
# 2013, R.van Ardenne, source:
# https://wiki.archlinux.org/index.php/Convert_Flac_to_Mp3 

find "$1" -name *.flac -print0 | while read -d $'\0' IF
do
  OF=$(echo "$IF" | sed -e 's/\.flac$/.mp3/g' -e "s,$1,$2,g")
  echo "$IF -> $OF"
  mkdir -p "${OF%/*}"

  ARTIST=`metaflac "$IF" --show-tag=ARTIST | sed s/.*=//g`
  TITLE=`metaflac "$IF" --show-tag=TITLE | sed s/.*=//g`
  ALBUM=`metaflac "$IF" --show-tag=ALBUM | sed s/.*=//g`
  GENRE=`metaflac "$IF" --show-tag=GENRE | sed s/.*=//g`
  TRACKNUMBER=`metaflac "$IF" --show-tag=TRACKNUMBER | sed s/.*=//g`
  DATE=`metaflac "$IF" --show-tag=DATE | sed s/.*=//g`

  flac -c -d "$IF" 2> /dev/null | lame -m j -q 0 --vbr-new -V 0 -s 44.1 - "$OF" 2> /dev/null
  id3 -t "$TITLE" -T "${TRACKNUMBER:-0}" -a "$ARTIST" -A "$ALBUM" -y "$DATE" -g "${GENRE:-12}" "$OF"
done
