#!/usr/bin/env bash

while inotifywait -e close_write *.org --format '%w'| while read FILE
    do
        git add .
        git stash push -m "tbc"
        git pull
        STASH="$(git stash list | grep tbc | head -n 1 | awk '{print $1}' | rev | cut -c 2- | rev)"
        git stash pop $STASH
        notify-send "Git" "Committed: $FILE changed"
	git add $FILE
	git commit -m "Auto: $FILE changed"
        git push
    done
do
    echo "Committed to Github";
done
