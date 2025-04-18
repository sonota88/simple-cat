FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    build-essential \
    ca-certificates \
    curl \
    git \
    libncurses5-dev \
    ruby \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

ARG user
ARG group

# https://askubuntu.com/questions/1513927/ubuntu-24-04-docker-images-now-includes-user-ubuntu-with-uid-gid-1000
RUN userdel -r ubuntu

RUN groupadd ${user} \
  && useradd ${user} -g ${group} -m

USER ${user}

WORKDIR /home/${user}

ENV USER=${user}

# --------------------------------
# asdf

WORKDIR /home/${user}/bin

RUN curl -L https://github.com/asdf-vm/asdf/releases/download/v0.16.7/asdf-v0.16.7-linux-386.tar.gz -o /tmp/asdf.tar.gz \
  && tar xzf /tmp/asdf.tar.gz \
  && rm /tmp/asdf.tar.gz
#=> ~/bin/asdf (executable)

ENV PATH="/home/${user}/bin:${PATH}"

ENV ASDF_DATA_DIR="/home/${user}/.asdf"
ENV PATH="${ASDF_DATA_DIR}/shims:${PATH}"

RUN asdf plugin add erlang \
  && asdf install erlang 27.3.2 \
  && asdf set --home erlang 27.3.2

# --------------------------------

WORKDIR /home/${user}/work

ENV IN_CONTAINER=1
# ENV LANG=en_US.UTF-8
