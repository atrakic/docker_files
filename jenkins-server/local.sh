#!/usr/bin/env bash

SCRIPT=$(readlink -f $0)
SCRIPTPATH=$(dirname $SCRIPT)
DOCKER=$(basename $SCRIPTPATH)
TAG="$(git rev-parse --abbrev-ref HEAD)"

docker volume create "${DOCKER}"-data

docker run --name "$DOCKER" \
  -p 8080:8080 \
  -v "$(which docker)":"/bin/docker"\
  -v "/var/run/docker.sock":"/var/run/docker.sock:ro"\
  -v "jenkins_home:/var/jenkins_home"\
  -v "$(pwd)":"/var/jenkins_home/workspace/seed"\
  -v "${DOCKER}"-data:"/var/jenkins_home"\
  "$DOCKER:$TAG"
