FROM python:3.7-alpine3.10

LABEL maintainer="Carlos Remuzzi <carlosremuzzi@gmail.com>"
LABEL org.label-schema.vcs-url="https://github.com/cremuzzi/mpsyt"

RUN apk add --no-cache \
        ffmpeg \
        mpv \
        pulseaudio \
    && pip3 install --upgrade \
        mps-youtube \
        youtube-dl \
    && adduser -u 1000 -s /bin/sh -D mpsyt

USER mpsyt

WORKDIR /home/mpsyt

CMD ["mpsyt"]
