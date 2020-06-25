ARG UBUNTU=rolling
FROM ubuntu:$UBUNTU
MAINTAINER Sebastian Braun <sebastian.braun@fh-aachen.de>

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y -q \
    redis \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

COPY redis.conf /etc/redis.conf

EXPOSE 6379

ENTRYPOINT ["redis-server", "/etc/redis.conf"]
