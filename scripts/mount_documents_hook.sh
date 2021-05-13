#!/bin/bash

export SUDO_ASKPASS="/home/arya/.local/scripts/askpass.sh"
if ! pgrep -f crypto.py;then python ~/.files/Bots/Crypto-tracking-bot/crypto.py; fi &

sudo -A sh ~/.local/scripts/zfs_snapshot.sh &

emacs --script ~/.emacs.d/scripts/diet &
