#!/bin/bash
sh ~/.local/scripts/repository.sh
CURRENT_DIR="$(pwd)"
DRIVE_VALUES="$(cat ~/Documents/Sync/drive)"
for i in "${DRIVE_VALUES}";
do
    pushd "${DRIVE_VALUES%%:*}";
    FILES="${DRIVE_VALUES##*:}"
    drive push ${FILES//;/ }
    popd
done
