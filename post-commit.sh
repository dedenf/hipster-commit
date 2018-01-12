#!/bin/bash

### start post commit ###
if ! command -v ls .gitsnap >/dev/null; then
  printf "creating selfie folder...\n"
  mkdir .gitsnap
fi

FILENAME=''
if command -v git rev-parse HEAD  > /dev/null; then
    FILENAME=$(date +%Y-%m-%d-%H-%M-%s)_FIRST
else
    FILENAME=$(date +%Y-%m-%d-%H-%M-%S)_$(git rev-parse HEAD)
fi
### take a selfie!
printf "📸  trying to take your awesome selfie..... 📸\n"
ffmpeg -f avfoundation -video_size 1280x720 -framerate 30 -i "0" -vframes 1 .gitsnap/$FILENAME.jpg -loglevel quiet >> /dev/null