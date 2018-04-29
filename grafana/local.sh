#!/usr/bin/env bash

SCRIPT="$(readlink -f $0)"
SCRIPTPATH="$(dirname $SCRIPT)"
DOCKER="$(basename $SCRIPTPATH)"
TAG="$(git rev-parse --abbrev-ref HEAD)"

docker run -d --name "$DOCKER-storage" \
    -v /var/lib/"$DOCKER" \
    "$DOCKER":"$TAG"

docker run --name="$DOCKER" \
    -d \
    --restart=always \
    -p 3000:3000 \
    --volumes-from "$DOCKER-storage" \
    -v /var/run/docker.sock:/var/run/docker.sock:ro \
    "$DOCKER":"$TAG"
