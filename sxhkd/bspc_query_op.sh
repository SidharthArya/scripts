#!/bin/bash
all_args=("$@")
arg1="${all_args[0]}"
arg2="${all_args[1]}"
arg3="${all_args[@]:2}"
echo $all_args
if [ -z "$arg1" ];
then
    exit 1
fi

if [ -z "$arg3" ];
then
    arg3="$arg2"
    arg2=""
fi

       
case $arg1 in
    "operate")
        for i in $(bspc query -N -n $arg2);
        do
            bspc node $i $arg3
        done
        ;;
    "echo")
        for i in $(bspc query -N -n $arg2);
        do
            echo $arg1 $arg2 $arg3 $i
        done
        ;;

    "marked")

        for i in $(bspc query -N -n .marked);
        do
            bspc node $i $arg3
        done
        ;;
        
esac
