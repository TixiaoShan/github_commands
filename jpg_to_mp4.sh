#!/bin/sh
frameRate="60"
jpgName="image_%03d.jpeg"
mp4Name="output.mp4"

ffmpeg -r ${frameRate} \
       -i ${jpgName} \
       -vcodec libx264 \
       -crf 20 \
       -vf "pad=ceil(iw/2)*2:ceil(ih/2)*2" \
       ${mp4Name}
