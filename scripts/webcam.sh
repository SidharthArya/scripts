#!/bin/sh
ARG1=${1:-0}
pkill -f /dev/video || mpv av://v4l2:/dev/video${ARG1} --vf=hflip --x11-name=Webcam --geometry=-0-0 --autofit=30% --profile=low-latency --untimed
