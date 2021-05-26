#!/bin/bash

# export SUDO_ASKPASS="/home/arya/.local/scripts/askpass.sh"
if ! pgrep -f crypto.py;then { conky -c ~/.files/Bots/Crypto-tracking-bot/conky.conf  & python crypto.py --cb -f /home/arya/Documents/Org/Bots/Telegram/crypto --conky ~/.cache/crypto; } fi &

sudo sh ~/.local/scripts/zfs_snapshot.sh &

emacs --script ~/.emacs.d/scripts/diet &
emacs --script ~/.emacs.d/scripts/exercises &

st -e sh ~/.local/scripts/sync.sh &
sxiv ~/Documents/Org/Tracking/images &
python ~/.local/scripts/electricitybill.py &
