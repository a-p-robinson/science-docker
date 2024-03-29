#!/bin/bash

echo "$@"

CONTAINER='root6-u22.04:6.28.00'

X11VOL='-v /tmp/.X11-unix:/tmp/.X11-unix'
X11ENV="-e DISPLAY=$DISPLAY"
HOMEVOL="-v $HOME:/home/$USER"

CONTAINER_CMD="root"

docker run --rm -it --user $(id -u)\
    $X11ENV $X11VOL $HOMEVOL $CONTAINER /bin/bash -c 'cd '$PWD' ; '$CONTAINER_CMD' '$@''


