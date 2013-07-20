#!/bin/bash
for EACH in `seq 1 2000`
do
	NUMBER=`echo "(2 ^ 32) * $EACH + 1065435274" | bc`
	FACTORS=`factor $NUMBER | cut -f 2 -d " " `
	NOF=`echo $FACTORS | tr " " "\n" | wc -l`
#echo "the number of FACTORS in $NUMBER is $NOF, WHICH ARE $FACTORS"
	BAD=0
for EACH2 in `seq 1 $NOF`
do
	FACTOR=`echo $FACTORS | cut -t $EACH2 -d " "`
#	echo -n "$FACTOR"
	if [ $FACTOR -gt 101 ]; then
		BAD=1
	fi
done

if [ $BAD -eq 0 ]; then
	echo "the number of FACTORS in $NUMBER is $NOF, WHICH ARE $FACTORS"
fi
done
