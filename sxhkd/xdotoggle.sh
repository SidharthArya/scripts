#!/bin/sh
arg1=$1
if pgrep bspwm;
then
    sh ~/.config/sxhkd/scripts/scratchpad.sh class "$arg1"
    exit 0
fi
if  [[ -z "$arg1" ]]
then
ID=$(xdo id)
else
ID=$(xdo id -n "$arg1")
fi
if  [[ -z "$ID" ]]
then
    exit 1
fi
MAP="$(xwininfo -id $ID | grep 'Map State:' | awk '{print $3}')"  
if [[ "$MAP" == "IsUnMapped" ]];
then
	xdo show $ID
else
	xdo hide $ID
fi
