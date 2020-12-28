#! /bin/sh
bspc node $(bspc query -N -n @/2 ) -B
num=$(bspc query -N -n '.leaf.!floating' -d | wc -l)

firstSplit=$(bspc query -T -d -n '@/' | jq -r '.splitType')

if [ $num < 3 ]; then
        echo "node=@/"
        echo "split_dir=west"
        echo "split_ratio=0.55"
        exit 0
else
        echo "node=@/"
        echo "split_dir=north"
        echo "split_ratio=0.55"
        bspc node @/2 -R 90
        exit 0
    
fi

