#!/bin/bash

chosen=$(cut -d ';' -f1 ~/.local/scripts/assets/emoji | rofi -dmenu -theme dmenu | sed "s/ .*//")
# Exit if none chosen.
[ -z "$chosen" ] && exit


if [ -n "$1" ]; then
	xdotool type "$chosen"
else
	echo "$chosen" | tr -d '\n' | xclip -selection clipboard
	notify-send "'$chosen' copied to clipboard." &
fi
