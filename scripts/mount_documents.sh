#!/bin/sh

export SUDO_ASKPASS=/home/arya/.local/scripts/askpass.sh
rofi -dmenu -password -theme dmenu -p "Documents Password: " | sudo -A zfs load-key pool/documents
sudo -A zfs mount pool/documents && bash ~/.local/scripts/mount_documents_hook.sh
