#!/bin/bash
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
OUTPUT_FILE="/tmp/media/stream_recorded_$TIMESTAMP.mp3"
INPUT_FILE="/tmp/media/file_list.txt"
AUDIO_FILES="/tmp/media/live-stream*.ts"

DEST_DIR="/home/yourname/servedir/live/recorded-audio"
REMOTE_SERVER="yourname@yourhost.com"

# Make a txt file with all the ts segments listed
ls $AUDIO_FILES | sort | awk '{print "file '\''"$0"'\''"}' > "$INPUT_FILE"

ffmpeg -f concat -safe 0 -i "$INPUT_FILE" -c copy "$OUTPUT_FILE"

# Upload to server
#RSYNC_CMD="rsync -av -e 'ssh -p 2222' --progress \"$OUTPUT_FILE\" \"$REMOTE_SERVER:$DEST_DIR/\""

#eval "$RSYNC_CMD" 


