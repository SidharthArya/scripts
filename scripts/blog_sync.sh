#!/usr/bin/env bash

while inotifywait -r -e close_write *
do
	bash ~/.blog/hugo
done

