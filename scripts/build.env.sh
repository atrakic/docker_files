#!/usr/bin/env bash

DOCKER=$(basename "$PWD")
TOP="$(git rev-parse --show-toplevel)"
. "$TOP/scripts/env.sh"

docker build --rm=true --force-rm -t "$DOCKER":"$TAG" .
