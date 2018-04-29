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
    -p 9000:9000 \
    --volumes-from "$DOCKER-storage" \
    -v /var/run/docker.sock:/var/run/docker.sock:ro \
    "$DOCKER":"$TAG"
