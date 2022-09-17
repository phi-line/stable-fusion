# !/bin/bash

source ./.env

watch -n 300 ffmpeg -y -vcodec png -r $FPS -start_number 0 -an -i $FRAME_PATH/${TIMESTAMP}_%05d.png -vn -i $VIDEO_PATH -pix_fmt yuv420p -crf 17 -preset veryfast -vcodec libx264 -vf fps=$FPS -shortest $FRAME_PATH/preview.mp4
