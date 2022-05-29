#!/usr/bin/env bash


while inotifywait -m -r -e create -e close_write -e moved_to * --format '%w' | while read FILE
    do
        if [[ $FILE =~ ".org" ]];
        then
           git add .
           git stash push -m "tbc"
           git pull
           STASH="$(git stash list | grep tbc | head -n 1 | awk '{print $1}' | rev | cut -c 2- | rev)"
           git stash pop $STASH
           notify-send "Git" "Committed: $FILE changed"
	   git add $FILE
	   git commit -m "Auto: $FILE changed"
           git push
        fi
    done
do
    echo "Committed to Github";
done
