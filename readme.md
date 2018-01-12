## Hipster Commit
Take a selfie if you commit and push your code to your repo

### Selfie
Selfie photo will be saved at your project directory at `.gitsnap` folder specifically

### How to run

Install few requirement

`brew install ffmpeg`

`brew install imagemagick`

go to your project folder, `cd` to `.git/hooks/` folder, see whether there's `post-commit` file, if not create it and put this lines.

```
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
```