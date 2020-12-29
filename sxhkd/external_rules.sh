#! /bin/sh

wid=$1
class=$2
instance=$3
consequences=$4

notify-send $wid "$class $instance $consequences"
