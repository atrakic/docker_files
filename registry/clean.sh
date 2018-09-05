#!/usr/bin/env bash

set -e

TOP="$(git rev-parse --show-toplevel)"
. "$TOP/scripts/env.sh"

docker container stop "$DOCKER" && docker container rm -fv "$DOCKER"
