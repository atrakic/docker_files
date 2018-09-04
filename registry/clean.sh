#!/usr/bin/env bash

SCRIPT="$(readlink -f $0)"
SCRIPTPATH="$(dirname $SCRIPT)"
DOCKER="$(basename $SCRIPTPATH)"
TAG="$(git rev-parse --abbrev-ref HEAD)"

docker container stop "$DOCKER" && docker container rm -v "$DOCKER"

