#!/bin/sh

ARG=$1
if [[ ${ARG:0:1} =~ [0-9] ]];
then
    cpupower frequency-set -u $ARG
    cpupower frequency-set -f $ARG
else
    cpupower frequency-set -g $ARG
fi

