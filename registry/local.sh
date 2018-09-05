#!/usr/bin/env bash

#set -e

TOP="$(git rev-parse --show-toplevel)"
. "$TOP/scripts/env.sh"

docker run -d \
  --name "$DOCKER" \
  -p "$REGISTRY_PORT":"$REGISTRY_PORT" \
  --restart=always \
  -e REGISTRY_HTTP_ADDR="$REGISTRY_HOST":"$REGISTRY_PORT" \
  -e LOGLEVEL=INFO -e DEBUG=true \
  "$DOCKER:$TAG"
#   -v /mnt/registry:/var/lib/registry \

