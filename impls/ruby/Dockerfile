FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    ruby \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

ARG user
ARG group
ARG home=/home/${user}

# https://askubuntu.com/questions/1513927/ubuntu-24-04-docker-images-now-includes-user-ubuntu-with-uid-gid-1000
RUN userdel -r ubuntu

RUN groupadd ${user} \
  && useradd ${user} -g ${group} -m

USER ${user}

WORKDIR ${home}/work
