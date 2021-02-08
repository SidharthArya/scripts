#!/bin/sh

POINTS_STORE=~/Documents/Org/Personal/points_store 
LEDGER_FILE="/home/arya/Documents/Org/Ledger/points.ledger"

DATE="$(date +'%Y%m%d')"
DATE_LEDGER="$(date --date=$DATE +'%Y/%m/%d')"

DO_POINTS="$(cat $POINTS_STORE | rofi -dmenu)"
DO=${DO_POINTS%%,*}
POINTS=${DO_POINTS##*,}
printf "\n\n$DATE_LEDGER $DO\n\tAssets:Points\t-$POINTS\n\tExpenses" >> $LEDGER_FILE


