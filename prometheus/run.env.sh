#!/usr/bin/env bash
. ../env.sh
# docker run -d -p 9118:9118 lovoo/jenkins_exporter:latest --user $USER --password $PASS -j http://localhost:8080 -p 9118
docker run -d -v /var/lib/"$DOCKER" --name "$DOCKER-storage" "$DOCKER":"$TAG"
docker run --name="$DOCKER" -d --restart=always -p 9090:9090 --volumes-from "$DOCKER-storage" -v /var/run/docker.sock:/var/run/docker.sock "$DOCKER":"$TAG"
