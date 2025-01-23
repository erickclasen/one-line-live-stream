#!/bin/bash

# Always start with a clean dir so recording works correctly, not mixed.
rm /tmp/media/live-stream.*

parec --format=s16le --rate=11025 --channels=1 | ffmpeg -f s16le -ar 11025 -ac 1 -i - -c:a libmp3lame -b:a 32k -f hls -hls_time 10 -hls_list_size 6 -hls_segment_filename "/tmp/media/live-stream%03d.ts" /tmp/media/live-stream.m3u8

