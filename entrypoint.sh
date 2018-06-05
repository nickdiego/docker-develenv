#!/bin/bash
# vim: set et sw=4
set -e

USER_UID=${USER_UID:-1000}
USER_GID=${USER_GID:-1000}

# create group with USER_GID
if ! getent group ${DEVELENV_USER} >/dev/null; then
    groupadd -f -g ${USER_GID} ${DEVELENV_USER} >/dev/null 2>&1
fi

# create user with USER_UID
if ! getent passwd ${DEVELENV_USER} >/dev/null; then
    adduser --disabled-login --gecos 'Dockerizer developer' \
            --uid ${USER_UID} --gid ${USER_GID} ${DEVELENV_USER}
    echo "%${DEVELENV_USER} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
fi

# TODO when $HOME is not mapped as a volume (??)
#chown ${DEVELENV_USER}:${DEVELENV_USER} -R /home/${DEVELENV_USER}

cd /home/${DEVELENV_USER}
exec sudo -HEu ${DEVELENV_USER} bash

