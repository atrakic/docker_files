#!/usr/bin/env bash

TAG="$(git rev-parse --abbrev-ref HEAD)"
SCRIPT=$(readlink -f $0)
SCRIPTPATH=$(dirname $SCRIPT)
DOCKER=$(basename $SCRIPTPATH)

docker run -d --name "$DOCKER-storage" \
    -v /var/lib/"$DOCKER" \
    "$DOCKER":"$TAG"

docker run --name="$DOCKER" \
    -d \
    --restart=always \
    -p 9090:9090 \
    --volumes-from "$DOCKER-storage" \
    -v /var/run/docker.sock:/var/run/docker.sock:ro \
    "$DOCKER":"$TAG"
