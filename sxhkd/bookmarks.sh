#!/bin/sh
browser="surf"
ROFI="rofi -dmenu -theme Pop-Dark -font 'Noto Sans 14' "
getarg2 () {
	/usr/bin/ls /home/arya/Documents/Org/Brain/Learning | $ROFI -pSubject
}

arg2=getarg2
fd .org /home/arya/Org/Brain/Learning/$arg2 | xargs rg "http"  | sed 's/^\s*+\s*//g' | rofi -dmenu -theme Pop-Dark -font 'Noto Sans 14' -p "bookmark"
