#!/bin/bash

set -euo pipefail
set -x
input_file="${1?Input file required}"
output_file="${2?Output file required}"
transform_file="${output_file}.trf"
ffmpeg -i "$input_file" -vf "vidstabdetect=shakiness=10:accuracy=15:result=$transform_file" -f null -
ffmpeg -i "$input_file" -filter:v vidstabtransform=zoom=25:input="$transform_file":interpol=bicubic -crf 23 -preset slow "$output_file"

