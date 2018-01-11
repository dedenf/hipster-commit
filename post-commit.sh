#!/bin/bash
#COMMITID=$(git rev-parse HEAD)
#imagesnap -q -w 1 .gitsnap/$COMMITID.jpg
if ! command -v ls .gitsnap >/dev/null; then
  printf "creating selfie folder..."
  mkdir .gitsnap
fi
COMMITID='lah'
if command -v git rev-parse HEAD  > /dev/null; then
    COMMITID=$(date +%Y-%m-%d-%H-%M-%S)-FIRST
else
    COMMITID=$(date +%Y-%m-%d-%H-%M-%S)-$(git rev-parse HEAD)
fi

FILENAME=$(date +%Y-%m-%d-%H-%M-%S)-$COMMITID.png
echo $FILENAME

#ffmpeg -f avfoundation -video_size 1280x720 -framerate 30 -i "0" -vframes 1 .gitsnap/$COMMITID.jpg