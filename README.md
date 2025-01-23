# one-line-live-stream
One line of code to generate an audio or video live stream. A bit more code to move the files.

Here’s a suggested `README.md` file for your GitHub repository based on the files and details in `all.txt`:

---

# Live Audio and Video Streaming Scripts

This repository contains scripts and configuration files to set up and manage live audio and video streaming using tools like `ffmpeg`, `parec`, and `rsync`. The project is designed to create simple, efficient, and scalable streaming workflows for use cases such as live broadcasts, event recordings, and server-hosted media streams.

## Features
- Live audio streaming with configurable sampling rates and bitrates (via `parec` and `ffmpeg`).
- HLS (HTTP Live Streaming) for video streams with `.m3u8` and `.ts` segment generation.
- Local and remote file synchronization using `rsync`.
- Integration with web servers for serving live and recorded streams.
- Automated stream cleanup and file management with cron jobs.

## File Overview

### Streaming Scripts
- `parec-streaming-11025-32k.sh`: Streams mono audio at 11,025 Hz, compressed to 32 kbps.
- `parec-streaming-22050-64k.sh`: Streams mono audio at 22,050 Hz, compressed to 64 kbps.
- `parec-streaming-44100-128k.sh`: Streams mono audio at 44,100 Hz, compressed to 128 kbps.
- `hls-video-stream.sh`: Captures the screen and audio, encoding video to HLS format with `.m3u8` and `.ts` segments.
- `ts-live-stream-to-mp3-local.sh`: Converts `.ts` HLS segments into a single MP3 file for local archiving.

### Synchronization and File Management
- `rsync-stream-to-server.sh`: Syncs HLS segments (`.ts` and `.m3u8`) to a remote server for live streaming.
- `rsync-stream-to-laptop.sh`: Syncs HLS segments locally for testing purposes.
- `cron`: Suggestions for automated cleanup of old streaming files on the server.

### Web Server Integration
- `index.html`: A sample HTML page that embeds a live stream and lists recorded streams.
- `.htaccess`: Configuration for Apache servers to support CORS, MIME types for HLS files, and cache control for `.m3u8` and `.ts` files.

### Utilities
- `screen-recorder.sh`: Captures the screen as a video and encodes it to MP4 format.
- `notes-on-streaming.txt`: Detailed notes on SSH setup, CORS configuration, and testing tools like `curl`.

## Prerequisites
1. **Tools and Dependencies**:
   - `ffmpeg`: For audio and video encoding.
   - `parec`: PulseAudio sound capturing.
   - `rsync`: For file synchronization.
   - `inotify-tools`: Monitors changes in directories to trigger file uploads.
   - `Apache/Nginx`: To serve live and recorded streams.
2. **SSH Setup**:
   - Ensure SSH key-based authentication is configured for seamless synchronization.
   - Persistent SSH connections are recommended to avoid reconnection overhead (see notes on `~/.ssh/config`).

## Setup Instructions
1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/yourrepository.git
   cd yourrepository
   ```

2. Configure your environment:
   - Update `REMOTE_SERVER`, `SOURCE_DIR`, `DEST_DIR`, and other paths in the scripts to match your setup.

3. Start streaming:
   - Audio (11,025 Hz, 32 kbps): `./parec-streaming-11025-32k.sh`
   - Audio (22,050 Hz, 64 kbps): `./parec-streaming-22050-64k.sh`
   - Audio (44,100 Hz, 128 kbps): `./parec-streaming-44100-128k.sh`
   - Video HLS: `./hls-video-stream.sh`

4. Set up your web server:
   - Place `index.html` and `.htaccess` in your server's root directory.
   - Enable CORS and configure MIME types as detailed in `.htaccess`.

5. Test your stream:
   - Use a browser or VLC to open the `.m3u8` file: `http://yourserver.com/live/live-stream.m3u8`.

6. Clean up:
   - Use a cron job to remove old HLS files:
     ```bash
     0 0 * * * rm /home/username/yourfolder/live/live-stream.*
     ```

## Sample Web Page
The repository includes a sample `index.html` that:
- Embeds a live video player for HLS streams.
- Lists recorded streams with timestamps.
- Provides links to your main website and donation page.

## Troubleshooting
1. **Buffer Issues in VLC**:
   - Ensure `.m3u8` and `.ts` files are continuously updated and no caching is enabled.
2. **SSH/rsync Issues**:
   - Confirm the server's `~/.ssh/authorized_keys` includes your public key.
   - Use `ssh -v` to debug connection issues.

## Future Plans
- MAYBE Add support for WebSocket-based audio streaming.
- MAYBECreate a Dockerized version for easier deployment.
- MAYBE Optimize for real-time low-latency streaming.

## License
This project is open-source and available under the MIT License.

---

This `README.md` should be comprehensive for your GitHub repository, guiding users through setup and usage of the scripts and their integration with a web server. Let me know if you'd like any adjustments!
