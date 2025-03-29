FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    ca-certificates \
    ruby \
    wget \
    xz-utils \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# --------------------------------

ARG user
ARG group
ARG home=/home/${user}

# https://askubuntu.com/questions/1513927/ubuntu-24-04-docker-images-now-includes-user-ubuntu-with-uid-gid-1000
RUN userdel -r ubuntu

RUN groupadd ${user} \
  && useradd ${user} -g ${group} -m

USER ${user}

# --------------------------------

WORKDIR ${home}

ARG version="0.14.0"
ARG archive_file="zig-linux-x86_64-${version}.tar.xz"

RUN wget -q \
    "https://ziglang.org/download/${version}/${archive_file}" \
  && tar xf "$archive_file" \
  && mv "zig-linux-x86_64-${version}/" "zig/" \
  && rm "$archive_file"

ENV PATH="/home/${user}/zig:${PATH}"

# --------------------------------

WORKDIR ${home}/work
