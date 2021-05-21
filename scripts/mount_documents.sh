#!/bin/sh

export SUDO_ASKPASS=/home/arya/.local/scripts/askpass.sh
sudo -A ls
rofi -dmenu -password -theme dmenu -p "Documents Password: " | sudo zfs load-key pool/documents
sudo zfs mount pool/documents && bash ~/.local/scripts/mount_documents_hook.sh
