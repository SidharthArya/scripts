#!/usr/bin/env bash
all_args=("$@")
arg1="${all_args[0]}"
arg2="${all_args[@]:1}"
QUERY=""
URL=""
echo "$arg1 $arg2" >> ~/.cache/browsesh-cache
case "$arg1" in
    "y")
        QUERY=$(echo "$arg2" | sed 's/ /\+/g')
        NAME=$(echo "https://youtube.com/results?search_query=$QUERY")
        ;;
    "g")
        QUERY=$(echo "$arg2" | sed 's/ /\+/g')
        NAME=$(echo "https://google.com/search?q=$QUERY")
        ;;
esac

echo $QUERY
surf "$NAME"
