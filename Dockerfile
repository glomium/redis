FROM alpine:3.11.2
MAINTAINER Sebastian Braun <sebastian.braun@fh-aachen.de>
# base alpine template

# Download requirements
RUN apk add --no-cache \
    redis

COPY redis.conf /etc/redis.conf

EXPOSE 6379

ENTRYPOINT ["redis-server", "/etc/redis.conf"]
