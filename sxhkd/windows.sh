#!/usr/bin/env bash
wmctrl -l | awk '{$3="";print}' | dmenu | awk '{print $1}' | xargs -I{} bspc node {} -g hidden=off -f
