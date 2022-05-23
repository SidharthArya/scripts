#!/usr/bin/env bash

FILES=""
while inotifywait -e close_write *.org --format '%w'| while read FILE
    do
        FILES="$FILES\n$FILE"
    done
do
    git stash push -m "tbc"
    git pull
    git stash pop tbc
    for FILE in $FILES;
    do
        
	git add $FILE
	git commit -m "Auto: $FILE changed"
    done
    git push
    FILES=""
done

