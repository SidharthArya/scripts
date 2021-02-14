#!/bin/sh

POINTS_STORE=~/Documents/Org/Personal/points_store 
LEDGER_FILE="/home/arya/Documents/Org/Ledger/points.ledger"

DATE="$(date +'%m/%d/%Y')"
DATE_LEDGER="$(date +'%Y/%m/%d')"

DO_POINTS="$(cat $POINTS_STORE | rofi -dmenu)"

if [ -z "$DO_POINTS" ];
then
    exit 0
fi
DO=$(echo $DO_POINTS | awk -F, '{print $1}')
POINTS=$(echo $DO_POINTS | awk -F, '{print $2}')
INVERSION=$(echo $DO_POINTS | awk -F, '{print $3}')
LAST_ENTRY=$(ledger --date-format "%m/%d/%Y" -f  "$LEDGER_FILE" reg | grep "$DO" | tail -n 1 | awk '{print $1}')
if [ -z "$LAST_ENTRY" ];
then
LAST_ENTRY=$(ledger --date-format "%m/%d/%Y" -f  "$LEDGER_FILE" reg | head -n 1 | awk '{print $1}')
fi

DIFF=1
if ! [ -z "$LAST_ENTRY" ];
then
   DATE_PREV=$(date --date="$LAST_ENTRY" +'%s')
   DATE_NOW=$(date --date="$DATE" +'%s')
   DIFF=$(echo "($DATE_NOW - $DATE_PREV)/86400.0" | bc)
fi


if [ -z $INVERSION ];
then
     if ! ([[ $DIFF -eq "1" ]] || [[ $DIFF -eq "0" ]]);
     then
         POINTS=$(echo "$POINTS/l($DIFF)" | bc -l)
     else
         POINTS=$POINTS
     fi

elif [[ $INVERSION -eq "A" ]];
then
    POINTS=$POINTS;
elif [[ $DIFF -lt $INVERSION ]];
then
    if ! [[ $DIFF -eq "1" ]];
    then
        POINTS=$(echo "$POINTS/l($DIFF)" | bc -l)
    else
        POINTS=$POINTS
    fi
elif [[ $DIFF -gt $(( 2 * $INVERSION )) ]];
then
     POINTS=$(( -1 * $POINTS ));
else
    DIFF=$(( 2 * $INVERSION - $DIFF ));
    if ! ([[ $DIFF -eq "1" ]] || [[ $DIFF -eq "0" ]]);
    then
        POINTS=$(echo "-1 * $POINTS/l($DIFF)" | bc -l)
    else
        POINTS=$(( -1 * $POINTS ))
    fi
fi
    
printf "%d" $POINTS
printf "\n\n$DATE_LEDGER $DO\n\tAssets:Points\t%d\n\tExpenses" $POINTS >> $LEDGER_FILE


