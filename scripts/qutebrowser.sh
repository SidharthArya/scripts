#!/bin/bash
docker run \
       -ti \
       --privileged \
       --name qutebrowser \
       -e DISPLAY=$DISPLAY \
       -m 2G \
       --cpus=3 \
       -e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native \
       -e STEAM_UID=$UID \
       -v /tmp/.X11-unix:/tmp/.X11-unix \
       -v /home/arya/.config/qutebrowser:/home/arya/.config/qutebrowser \
       -v /dev/shm:/dev/shm \
       -v ${XDG_RUNTIME_DIR}/pulse:${XDG_RUNTIME_DIR}/pulse \
        qutebrowser-ref || docker start qutebrowser
