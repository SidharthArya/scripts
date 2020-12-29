#!/bin/sh
pkill -f panel && bspc config top_padding 0 || sh ~/.config/bspwm/scripts/panel.sh
