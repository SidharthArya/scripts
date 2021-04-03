#!/bin/sh
emacs --config tracking & 
# emacs --config org &
st -e sh ~/.local/scripts/sync.sh &
sxiv ~/Documents/Org/Tracking/images &
python ~/.local/scripts/electricitybill.py &
# if ! pgrep urxvtd; then urxvtd -q -o -f; fi
