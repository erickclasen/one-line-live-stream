#!/bin/bash
#ffmpeg -f x11grab -s 1360x768 -i :0.0+0,0 -vf "scale=854:480" -c:v libx264 -preset veryfast -b:v 500k -c:a aac -ar 44100 -b:a 128k -f hls -hls_time 10 -hls_list_size 6 -hls_wrap 10 live-stream.m3u8
#ffmpeg -f x11grab -s 1360x768 -i :0.0+0,0 -vf "scale=854:480" \
#  -c:v libx264 -preset veryfast -b:v 500k -c:a aac -ar 44100 -b:a 128k \
#  -f hls -hls_time 10 -hls_list_size 6 -hls_wrap 10 \
#  /tmp/media/live-stream.m3u8


ffmpeg -f x11grab -s 1360x768 -i :0.0+0,0 \
  -f pulse -i default \
  -vf "scale=854:480" \
  -c:v libx264 -preset veryfast -b:v 500k \
  -c:a aac -ar 11025 -b:a 32k \
  -f hls -hls_time 10 -hls_list_size 6 -hls_wrap 10 \
  /tmp/media/live-stream.m3u8

