FROM python:3.8.4-alpine3.12

LABEL maintainer="Carlos Remuzzi <carlosremuzzi@gmail.com>"
LABEL org.label-schema.vcs-url="https://github.com/cremuzzi/mpsyt"

RUN apk add --no-cache \
        ffmpeg \
        mpv \
        pulseaudio \
    && pip3 install --upgrade \
        mps-youtube \
        youtube-dl \
    && adduser -u 1000 -D mpsyt \
    && mkdir -p /home/mpsyt/.config/pulse \
    && echo "default-server = unix:/run/user/1000/pulse/native" > /home/mpsyt/.config/pulse/client.conf \
    && echo "autospawn = no" >> /home/mpsyt/.config/pulse/client.conf \
    && echo "daemon-binary = /bin/true" >> /home/mpsyt/.config/pulse/client.conf \
    && echo "enable-shm = false" >> /home/mpsyt/.config/pulse/client.conf \
    && chown -R mpsyt:mpsyt /home/mpsyt

USER mpsyt

WORKDIR /home/mpsyt

CMD ["mpsyt"]
