#!/bin/sh
VOLUME="$(pamixer --get-volume)"

echo $VOLUME
case "$1" in
    "increase")
        if  [ $VOLUME -lt 100 ];
        then
            pactl -- set-sink-volume 0 +2% && canberra-gtk-play -i audio-volume-change;
        fi
        ;;
    "decrease")
        if [ $VOLUME -gt 0 ];
        then
            pactl -- set-sink-volume 0 -2% && canberra-gtk-play -i audio-volume-change;
        fi
        ;;
esac

echo 1 > /tmp/bspwm_brightness_volume
