#!/bin/sh
VOLUME="$(pamixer --get-volume)"
echo $VOLUME
case "$1" in
    "increase")
        if  [ $VOLUME -lt 100 ];
        then
            pactl -- set-sink-volume 0 +2%;
        fi
        ;;
    "decrease")
        if [ $VOLUME -gt 0 ];
        then
            pactl -- set-sink-volume 0 -2%;
        fi
        ;;
esac

echo 1 > /tmp/bspwm_brightness_volume
