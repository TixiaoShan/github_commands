#!/bin/sh
frameRate="60"
jpgName="image_%03d.jpeg"
mp4Name="output.mp4"

ffmpeg -framerate ${frameRate} \
       -i ${jpgName} \
       -c:v libx264 -profile:v high -crf 20 -pix_fmt yuv420p \
       ${mp4Name}
