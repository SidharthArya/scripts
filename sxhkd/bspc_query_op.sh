#!/bin/sh

all_args=("$@")
arg1=$1
arg2=$2
arg3="${all_args[@]:2}"
case $arg1 in
    operate)
        NODES=$(bspc query -N -n $arg2)
        echo $NODES
        if [ -z "$NODES" ];
        then
            exit 2
        fi
        for i in "$NODES";
        do
            echo bspc node $i $arg3
            bspc node $i $arg3
        done
        ;;
esac
