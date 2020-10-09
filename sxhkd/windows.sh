#!/usr/bin/env bash
CURRENT_WINDOW="$(xdo id)"
wmctrl -l | grep -v $CURRENT_WINDOW | awk '{$3="";print}' | fzf | awk '{print $1}' | xargs -I{} bspc node {} -g hidden=off -f
