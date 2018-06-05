#!/bin/bash
# vim: set et sw=4

USER_UID=$(id -u)
USER_GID=$(id -g)

name='ubuntu18'
#image='ubuntu-18-devenv:latest'
image='nickdiego/develenv:0.1'
opts=(
    --name "$name"
    -e "DISPLAY=${DISPLAY}"
    -e "USER_UID=${USER_UID}"
    -e "USER_GID=${USER_GID}"
    -e "DEVELENV_USER=${USER}"
    -v '/tmp/.X11-unix:/tmp/.X11-unix:rw'
    -v "${HOME}:${HOME}:rw"
)

docker run "${opts[@]}" --rm -it "${image}" bash
