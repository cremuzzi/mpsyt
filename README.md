# How to use this image

```sh
docker run -i -t \
    --device /dev/snd \
    --group-add 29 \
    cremuzzi/mpsyt
```

The flag `--device /dev/snd` adds your host sound device to the container.
Permissions to access `/dev/snd` are usually granted to the root user or members of the `audio` group on your system.
This container runs by default as the unpriviledged user `mpsyt` with uid `1000`. This is why we need to add the user to the `audio` group, with the same GID as your host `audio` group.



The flag `--group-add` assigns the correct `audio` GID from your specific host to the `mpsyt` user inside the container.
By default Alpine Linux sets `18` as the audio GID (`audio:x:18:`) but this value is usually different on your host.
Using `--group-add` allows you to take care of these differences and run your container with the right permissions on `/dev/snd`.

You can find the `audio` GID specific to your host by inspecting the `/etc/group` file.
For instance:

```sh
awk -F\: '/audio/{print $3}' /etc/group
```


### Change the default sound device

By default the container uses the sound card with id 0. To change this behaviour you can pass it a custom `.asoundrc` file on run.

For instance, you can create a file named `.asoundrc` with the following content:

```
defaults.ctl.card 1
defaults.pcm.card 1
```

then pass it to the container as a volume like this:

```sh
docker run -i -t \
    --device /dev/snd \
    --group-add 29 \
    -v $HOME/.asoundrc:/home/mpsyt/.asoundrc \
    cremuzzi/mpsyt
```
