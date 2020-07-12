#!/bin/sh
ffmpeg -i input.ogv \
       -c:v libx264 -preset medium -crf 22 \
       -c:a libmp3lame -qscale:a 2 -ac 2 -ar 44100 \
       output.mp4
