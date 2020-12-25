#!/bin/sh
export IFS=$'\n'
case "$1" in
    "current")
        bspc query -N -n focused >> /tmp/bspwm_minimize_stack
        bspc node -g hidden
        ;;
esac


