#!/usr/bin/env bash

SCRIPT="$(readlink -f $0)"
SCRIPTPATH="$(dirname $SCRIPT)"
DOCKER="$(basename $SCRIPTPATH)"
TAG="$(git rev-parse --abbrev-ref HEAD)"

# ./gen-security-data.sh"
  
docker run --name "$DOCKER" \
     -p 5000:5000 \
     -d \
     --restart=always \
     "$DOCKER:$TAG"
