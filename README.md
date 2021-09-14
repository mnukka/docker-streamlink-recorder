# docker-streamlink-recorder
Automated Dockerfile to record livestreams with streamlink

## Description
This is a Docker Container to record a livestream. It uses the official [Python Image](https://hub.docker.com/_/python) with the Tag *buster*  , installs [streamlink](https://github.com/streamlink/streamlink) and uses the Script [streamlink-recorder.sh](https://raw.githubusercontent.com/lauwarm/docker-streamlink-recorder/python3.8.1_buster_1.3.1/streamlink-recorder.sh) to periodically check if the stream is live.

## Usage
To run the Container:
```bash
$ docker-compose up -d
```

## Notes
    
`/home/download` - the place where the vods will be saved. Mount it to a desired place with `-v` option or replace docker-compose volume.

`/home/script` - the place where the scripts are stored. (entrypoint.sh and streamlink-recorder.sh)

`/home/plugins` - the place where the streamlink plugins are stored.

`STREAM_QUALITY` - quality options "720p,480p,best"

`STREAM_QUALITY` - name for the stream.

`STREAM_OPTIONS` - streamlink flags (--twitch-disable-hosting, separated by space)

Read more from documentation: https://streamlink.github.io/cli.html

The File will be saved as `streamName-YearMonthDay-HourMinuteSecond.mkv`