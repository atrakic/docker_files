#!/usr/bin/env bash

set -euxo pipefail

. "$(git rev-parse --show-toplevel)/scripts/env.sh"

envsubst < Dockerfile | docker build --rm=true --force-rm -t "$DOCKER":"$TAG" -f - .
