#!/usr/bin/env bash
#CURRENT_WINDOW="$(xdo id)"
FOCUS=$(wmctrl -l | 
	#grep -v $CURRENT_WINDOW | 
	awk '{$3="";print}' | dmenu -l 50| awk '{print $1}')
echo "$FOCUS"
if pgrep bspwm;
then bspc node "$FOCUS" -g hidden=off -f
else xdo activate "$FOCUS"
fi
