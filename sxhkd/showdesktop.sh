#!/bin/sh

#mkdir -p /tmp/bspwm_desktops
if bspc query -N -n focused;
then
    for i in $(bspc query -N  -d focused );
    do
        bspc node "$i" -g hidden=on
    done
else
    for i in $(bspc query -N  -d focused );
    do
        bspc node "$i" -g hidden=off
    done
fi

