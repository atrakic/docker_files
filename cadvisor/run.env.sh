#!/usr/bin/env bash

. ../env.sh

docker run --name "$DOCKER" -p 8090:8080 \
       -v /:/rootfs:ro \
       -v /var/run:/var/run:rw \
       -v /sys:/sys:ro  \
       -v /var/run/docker.sock:/var/run/docker.sock:ro \
       -d \
       --restart always \
	"$DOCKER:$TAG"
