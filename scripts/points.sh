#!/bin/sh
LEDGER_FILE="/home/arya/Documents/Org/Ledger/points.ledger"
case $1 in
    "today")
        DATE="$(date +'%Y%m%d')"
        FILE="/home/arya/.cache/org-points-$DATE.points"
        POINTS=$(cat $FILE | paste -sd + | bc)
        DATE_LEDGER="$(date --date=$DATE +'%Y/%m/%d')"
        rm $FILE
        printf "\n\n$DATE_LEDGER Points Earned\n\tAssets:Points\t$POINTS\n\tIncome:Points" >> $LEDGER_FILE
        echo $POINTS
        ;;
    "all")
        for i in $(ls /home/arya/.cache/org-points-*.points);
        do
            
            DATE="$(echo $i | awk -F / '{print $NF}'|  sed 's/org-points-//g' | sed 's/.points//g')"
            FILE="/home/arya/.cache/org-points-$DATE.points"
            POINTS=$(cat $FILE | paste -sd + | bc)
            DATE_LEDGER="$(date --date=$DATE +'%Y/%m/%d')"
            rm $FILE
            printf "\n\n$DATE_LEDGER Points Earned\n\tAssets:Points\t$POINTS\n\tIncome:Points" >> $LEDGER_FILE
            echo $POINTS
        done
        ;;
esac
