#!/bin/sh

rofi -dmenu -password -theme dmenu -p "Documents Password: " | zfs load-key pool/documents
zfs mount pool/documents
