#!/bin/bash
ffmpeg -f x11grab -s 1360x768 -i :0.0+0,0 -c:v libx264 -pix_fmt yuv420p output.mp4
