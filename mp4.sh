#!/bin/sh
ffmpeg -i input.ogv \
       -c:v libx264 -preset medium -crf 22 \
       -c:a libmp3lame -qscale:a 2 -ac 2 -ar 44100 \
       -pix_fmt yuv420p \
       output.mp4

# convert batch
# for i in /path/to/*.ogv;
#   do name=`echo "$i" | cut -d'.' -f1`
#   echo "$name"
#   ffmpeg -i "$i" "${name}.mp4" \
#        -c:v libx264 -pix_fmt yuv420p -preset medium -crf 22
# done
