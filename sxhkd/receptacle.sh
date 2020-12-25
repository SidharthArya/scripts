#! /bin/sh

# . ./prelude

bspc monitor -a "test-receptacle"
bspc desktop -f "test-receptacle"

bspc node -i
bspc node @/ -p east -i
bspc node @/2 -p north -i

bspc rule -a Test:test -o node=@/1
bspc rule -a Test:test -o node=@/2/1
bspc rule -a Test:test -o node=@/2/2

window add 3

bspc query -N -n '.leaf.!window.local' > /dev/null && fail "At least one remaining receptacle."

window remove 3

bspc desktop "test-receptacle" -r
