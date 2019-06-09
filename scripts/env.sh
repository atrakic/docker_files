#!/usr/bin/env bash

DOCKER=$(basename "$PWD")
export DOCKER

TAG="$(git rev-parse --abbrev-ref HEAD)"
export TAG

export REGISTRY_USER=user-$TAG
export REGISTRY_PASS=pass-$TAG-$RANDOM
export REGISTRY_HOST=localhost
export REGISTRY_PORT=5000
