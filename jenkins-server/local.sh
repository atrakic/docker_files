#!/usr/bin/env bash

SCRIPT=$(readlink -f $0)
SCRIPTPATH=$(dirname $SCRIPT)
DOCKER=$(basename $SCRIPTPATH)
TAG="$(git rev-parse --abbrev-ref HEAD)"

# https://damnhandy.com/2016/03/06/creating-containerized-build-environments-with-the-jenkins-pipeline-plugin-and-docker-well-almost/
docker run --name "$DOCKER" \
  -p 8080:8080 \
  -d \
  --restart=always \
  --env JAVA_OPTS=-Djenkins.install.runSetupWizard=false \
  -v $(which docker):/bin/docker \
  -v "/var/run/docker.sock:/var/run/docker.sock:ro" \
  -v "$(pwd)":/var/jenkins_home/workspace/seed \
  -v "jenkins_home:/var/jenkins_home" \
  "$DOCKER:$TAG"

