#!/usr/bin/env bash

TOP="$(git rev-parse --show-toplevel)"
. "$TOP/scripts/env.sh"

export IMAGE_ID="$1"
export VERSION="$2"
export DOCKER="$3"

if [ "$DOCKER" ]; then 
    echo "pushing docker: $DOCKER"
    docker push "$REGISTRY_HOST":"$REGISTRY_PORT"/"$DOCKER":"$VERSION"
fi
