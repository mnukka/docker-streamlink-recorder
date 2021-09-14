#!/bin/sh

# For more information visit: https://github.com/downthecrop/TwitchVOD

while [ true ];
do
	Date=$(date +%Y%m%d-%H%M%S)
  echo $Date
	streamlink --url twitch.tv/$STREAM_NAME $STREAM_OPTIONS --default-stream $STREAM_QUALITY -o /home/download/$STREAM_NAME"-$Date".mkv
	sleep 60s
done