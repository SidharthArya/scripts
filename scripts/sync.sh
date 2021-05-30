#!/bin/bash
source ~/Documents/Org/Scripts/personal.sh
sh ~/.local/scripts/repository.sh
echo $GIT_ASKPASS
CURRENT_DIR="$(pwd)"
cd "$(cat ~/Documents/Sync/drive)";
drive push *;
cd "$CURRENT_DIR"
