#!/bin/sh
while [[ $(bspc query -N | wc -l) > 0 ]];
do
    sleep 5;
done
st -e sh ~/.local/scripts/sync.sh;
