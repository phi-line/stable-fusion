# !/bin/bash

source ./.env

watch -n 600 $(ffmpeg -y -vcodec png -r $FPS -start_number 0 -i $FRAME_PATH/${TIMESTAMP}_%05d.png -i $VIDEO_PATH -filter_complex '[1:a]volume=1.0[audio]' -filter_complex "[1:v]format=rgba,colorchannelmixer=aa=0.25[fg];[0][fg]overlay" -map '[audio]' -pix_fmt yuv420p -crf 17 -preset veryfast -vcodec libx264 $FRAME_PATH/overlay.mp4)


