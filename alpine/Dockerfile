FROM python:3.7-alpine3.9

LABEL maintainer="Carlos Remuzzi <carlosremuzzi@gmail.com>"

RUN apk add --no-cache \
        alsa-lib \
        alsa-utils \
        alsaconf \
        dbus \
        ffmpeg \
        mpv \
        openssl \
    && pip3 install \
        mps-youtube \
        youtube-dl \
    && addgroup -g 1000 mpsyt \
    && adduser -u 1000 -G mpsyt -s /bin/sh -D mpsyt

USER mpsyt

WORKDIR /home/mpsyt

CMD ["mpsyt"]
