FROM python:3.9.7-buster

ARG STREAMLINK_VERSION
ARG STREAM_OPTIONS
ARG STREAMLINK
ARG STREAM_QUALITY
ARG STREAM_NAME
ENV STREAMLINK_VERSION=$STREAMLINK_VERSION
ENV STREAM_OPTIONS=$STREAM_OPTIONS
ENV STREAM_QUALITY=$STREAM_QUALITY
ENV STREAM_NAME=$STREAM_NAME

RUN echo Arguments passed in:
RUN echo STREAMLINK_VERSION -> $STREAMLINK_VERSION
RUN echo STREAM_OPTIONS -> $STREAM_OPTIONS
RUN echo STREAM_QUALITY -> $STREAM_QUALITY
RUN echo STREAM_NAME -> $STREAM_NAME
#ENV STREAMLINK_VERSION=2.4.0

ADD https://github.com/streamlink/streamlink/releases/download/${STREAMLINK_VERSION}/streamlink-${STREAMLINK_VERSION}.tar.gz /opt/

RUN apt-get update && apt-get install gosu

RUN tar -xzf /opt/streamlink-${STREAMLINK_VERSION}.tar.gz -C /opt/ && \
	rm /opt/streamlink-${STREAMLINK_VERSION}.tar.gz && \
	cd /opt/streamlink-${STREAMLINK_VERSION}/ && \
	python setup.py install

RUN mkdir /home/download
RUN mkdir /home/script
RUN mkdir /home/plugins

COPY ./streamlink-recorder.sh /home/script/
COPY ./entrypoint.sh /home/script

RUN ["chmod", "+x", "/home/script/entrypoint.sh"]

ENTRYPOINT [ "sh", "/home/script/entrypoint.sh" ]