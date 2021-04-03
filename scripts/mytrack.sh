#!/bin/sh
if ! pgrep -f tracking;
then
	DISPLAY=:0 emacs --config tracking 
fi
