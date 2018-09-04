#!/usr/bin/env bash

TOP="$(git rev-parse --show-toplevel)"

. "$TOP/scripts/env.sh"

DOCKER=$(basename "$PWD")
TAG="$(git rev-parse --abbrev-ref HEAD)"

if [ "$DOCKER_REGISTRY_LOCAL_LOGIN" ]; then
  . "$TOP/scripts/login.env.sh"
  echo "Pushing image: $DOCKER:$VERSION to registry: $REGISTRY_HOST"
  docker push "$REGISTRY_HOST":"$REGISTRY_PORT"/"$DOCKER":"$VERSION"
fi

if [ "$DOCKER_ID_USER" ]; then
  echo "Pushing image $DOCKER:$VERSION to docker hub:"
  docker tag "$DOCKER":"$VERSION" "$DOCKER_ID_USER"/"$DOCKER"
  docker push "$USER"/"$DOCKER:$VERSION"
fi
