FROM ubuntu:18.04
LABEL maintainer Nick Yamane <nick@diegoyam.com>

ENV DEVELENV_USER=nick

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    ca-certificates gnupg sudo build-essential python wget git unzip \
    cmake make tmux

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    neovim python3-pip python3-powerline

RUN pip3 install --upgrade neovim powerline

# Set the locale
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    locales
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod 755 /sbin/entrypoint.sh

ENTRYPOINT ["/sbin/entrypoint.sh"]
