#!/bin/bash
docker run \
       -ti \
       --privileged \
       --name steam \
       -e DISPLAY=$DISPLAY \
       -m 3G \
       --cpus=1 \
       -e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native \
       -v /tmp/.X11-unix:/tmp/.X11-unix \
       -v /dev/shm:/dev/shm \
       -v ${XDG_RUNTIME_DIR}/pulse:${XDG_RUNTIME_DIR}/pulse \
       -v /home/arya/.local/share/Steam:/home/steam/.local/share/Steam \
       tianon/steam || docker start steam
