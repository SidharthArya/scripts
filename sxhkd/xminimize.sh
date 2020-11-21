#!/bin/sh
case "$1" in 
	"+") 	ID="$(xdo id)"
		echo $ID >> /tmp/xminimize
		xdo hide $ID
		;;
	"-") 	ID=$(tail -n 1 /tmp/xminimize)
		sed -i '$ d' /tmp/xminimize
		echo $ID
		xdo show "$ID"
		;;
esac

