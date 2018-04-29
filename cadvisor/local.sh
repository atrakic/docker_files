#!/usr/bin/env bash

SCRIPT=$(readlink -f $0)
SCRIPTPATH=$(dirname $SCRIPT)
DOCKER=$(basename $SCRIPTPATH)
TAG="$(git rev-parse --abbrev-ref HEAD)"

docker run --name "$DOCKER" \
    -p 8090:8080 \
    -v /:/rootfs:ro \
    -v /var/run:/var/run:rw \
    -v /sys:/sys:ro  \
    -v /var/run/docker.sock:/var/run/docker.sock:ro \
    -d \
    --restart always \
    "$DOCKER:$TAG"
