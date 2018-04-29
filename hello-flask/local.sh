#!/usr/bin/env bash

TAG="$(git rev-parse --abbrev-ref HEAD)"
SCRIPT=$(readlink -f $0)
SCRIPTPATH=$(dirname $SCRIPT)
DOCKER=$(basename $SCRIPTPATH)

docker run --name="$DOCKER" \
    -d \
    -p 5000:5000 \
    "$DOCKER":"$TAG"
