# vim:set ft=dockerfile:
ARG BASEIMAGE=ubuntu:rolling
FROM $BASEIMAGE
MAINTAINER Sebastian Braun <sebastian.braun@fh-aachen.de>

ENV DEBIAN_FRONTEND noninteractive
ENV LANG en_US.UTF-8

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install --no-install-recommends -y -q \
    redis \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

COPY redis.conf /etc/redis.conf

EXPOSE 6379

HEALTHCHECK --interval=10s --timeout=1s --start-period=5s CMD redis-cli ping
ENTRYPOINT ["redis-server", "/etc/redis.conf"]
