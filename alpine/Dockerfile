FROM python:3.7-alpine3.10

LABEL maintainer="Carlos Remuzzi <carlosremuzzi@gmail.com>"

RUN apk add --no-cache \
        alsa-lib \
        alsa-utils \
        alsaconf \
        dbus \
        ffmpeg \
        mpv \
        openssl \
    && pip3 install --upgrade \
        mps-youtube \
        youtube-dl \
    && adduser -u 1000 -s /bin/sh -D mpsyt

USER mpsyt

WORKDIR /home/mpsyt

CMD ["mpsyt"]
