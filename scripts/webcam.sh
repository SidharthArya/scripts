#!/bin/sh
pkill -f /dev/video || mpv av://v4l2:/dev/video0 --vf=hflip --x11-name=Webcam --geometry=-0-0 --autofit=30% --profile=low-latency --untimed
