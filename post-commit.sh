#!/bin/bash
if ! command -v ls .gitsnap >/dev/null; then
  printf "creating selfie folder..."
  mkdir .gitsnap
fi
COMMITID=''
if command -v git rev-parse HEAD  > /dev/null; then
    COMMITID=$(date +%Y-%m-%d-%H-%M-%S)-FIRST
else
    COMMITID=$(date +%Y-%m-%d-%H-%M-%S)-$(git rev-parse HEAD)
fi

FILENAME=$(date +%Y-%m-%d-%H-%M-%S)_$COMMITID

ffmpeg -f avfoundation -video_size 1280x720 -framerate 30 -i "0" -vframes 1 .gitsnap/$FILENAME.jpg