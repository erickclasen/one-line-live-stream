#!/bin/bash

mkdir -p /tmp/media
# Define source and destination directories
SOURCE_DIR="/tmp/media"
DEST_DIR="/home/yourname/yourdir/live"
REMOTE_SERVER="yourname@yourserver.com"

# Define the pattern for the segment files and the playlist file
TS_PATTERN="live-stream.*\.ts"
M3U8_FILE="live-stream.m3u8"

# Monitor for new .ts files being created or modified
inotifywait -m -e create -e modify --format "%f" "$SOURCE_DIR" | while read FILE
do
    echo "Detected file: $FILE"  # Log the detected file
    # If a .ts file is created, trigger file transfer
    if [[ "$FILE" =~ $TS_PATTERN ]]; then
        echo "Detected new segment: $FILE"
        
        # Debugging: Log the rsync command before running it
        RSYNC_CMD="rsync -av -e 'ssh -p 2222' --progress \"$SOURCE_DIR/$FILE\" \"$REMOTE_SERVER:$DEST_DIR/\""
        echo "Running command: $RSYNC_CMD"

        # Copy the .ts segment files
        eval "$RSYNC_CMD"  # Run rsync using eval to handle variables correctly

        # After a new .ts segment is added, copy the .m3u8 playlist file
        RSYNC_CMD="rsync -av -e 'ssh -p 2222' --progress \"$SOURCE_DIR/$M3U8_FILE\" \"$REMOTE_SERVER:$DEST_DIR/\""
        echo "Running command: $RSYNC_CMD"

        eval "$RSYNC_CMD"  # Run rsync for the playlist file

        # Optionally: Print message when done
        echo "Successfully transferred $FILE and $M3U8_FILE to remote server."
    else
        echo "No match for: $FILE"
    fi
done
