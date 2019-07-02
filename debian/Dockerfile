FROM python:3.7-slim-stretch

LABEL maintainer="Carlos Remuzzi <carlosremuzzi@gmail.com>"

RUN apt-get update \
    && apt-get install --no-install-recommends -y \
        alsa-utils \
        dbus \
        ffmpeg \
        mplayer \
        openssl \
    && pip3 install \
        mps-youtube \
        youtube-dl \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean \
    && apt-get purge \
    && useradd -m -s /bin/bash mpsyt

USER mpsyt

WORKDIR /home/mpsyt

CMD ["mpsyt"]
