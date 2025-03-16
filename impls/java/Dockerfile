FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    openjdk-21-jdk-headless \
    rake \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /root/work
