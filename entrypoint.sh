#!/bin/sh

# Add local user and group
# Either use the uid and gid if passed in at runtime or
# fallback to 9001

USER_ID=${uid:-9001}
GROUP_ID=${gid:-9001}

addgroup --gid $GROUP_ID mygroup
adduser --disabled-password myuser --uid $USER_ID --gecos myuser --ingroup mygroup --shell /bin/sh

echo "UID : $USER_ID \nGID : $GROUP_ID"
useradd --shell /bin/bash -u $USER_ID -o -c "" -m user
export HOME=/home/user

mkdir /home/download
chown -R $USER_ID:$GROUP_ID /home/plugins
chown -R $USER_ID:$GROUP_ID /home/script
chown -R $USER_ID:$GROUP_ID /home/download
chmod 700 ./home/script/streamlink-recorder.sh

exec gosu myuser './home/script/streamlink-recorder.sh' ${STREAM_OPTIONS} ${STREAM_QUALITY} ${STREAM_NAME}