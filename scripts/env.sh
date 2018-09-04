#!/usr/bin/env bash

USER="$(whoami)"
TAG="$(git rev-parse --abbrev-ref HEAD)"
VERSION="$(git rev-parse --abbrev-ref HEAD)"

export DOCKER
export REGISTRY_USER=user-$TAG
export REGISTRY_PASS=1234
export REGISTRY_HOST=0.0.0.0
export REGISTRY_PORT=5000
