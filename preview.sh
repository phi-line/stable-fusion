# !/bin/bash

source ./.env

cat $(find $FRAME_PATH -maxdepth 1 -name "*.png" | sort -V) | ffmpeg -framerate $FPS -i - $FRAME_PATH/preview$FPS.mp4 -v debug
# ffmpeg -y -vcodec png -r $FPS -start_number 0 -an -i $FRAME_PATH/${PREFIX}%d$SUFFIX.png -vn -i $VIDEO_PATH -pix_fmt yuv420p -crf 17 -preset veryfast -vcodec libx264 -vf fps=$FPS -shortest $FRAME_PATH/preview.mp4
