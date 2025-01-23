#!/bin/bash

# Always start with a clean dir so recording works correctly, not mixed.
rm /tmp/media/live-stream.*

parec --format=s16le --rate=22050 --channels=1 | ffmpeg -f s16le -ar 22050 -ac 1 -i - -c:a libmp3lame -b:a 64k -f hls -hls_time 10 -hls_list_size 6 -hls_segment_filename "/tmp/media/live-stream%03d.ts" /tmp/media/live-stream.m3u8

