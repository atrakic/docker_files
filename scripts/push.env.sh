#!/usr/bin/env bash

TOP="$(git rev-parse --show-toplevel)"
. "$TOP/scripts/env.sh"

#export DOCKER="$1"
DOCKER=$(basename "$PWD")
TOP="$(git rev-parse --show-toplevel)"
TAG="$(git rev-parse --abbrev-ref HEAD)"

if [ "$DOCKER_REGISTRY_LOCAL_LOGIN" ]; then 
  echo "pushing docker: $DOCKER:$VERSION to $REGISTRY_HOST"
  docker push "$REGISTRY_HOST":"$REGISTRY_PORT"/"$DOCKER":"$VERSION"
fi

#if [ "$DOCKER_ID_USER" ]; then
  echo "Pushing $DOCKER:$VERSION to docker hub:"
  docker tag "$DOCKER":"$VERSION" "$DOCKER_ID_USER"/"$DOCKER"
  docker push "$DOCKER_ID_USER"/"$DOCKER"	
#fi
