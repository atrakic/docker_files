#!/usr/bin/env bash

# set -e 

TOP="$(git rev-parse --show-toplevel)"
. "$TOP/scripts/env.sh"

container="$1"
state=$(docker inspect --format "{{.State.Running}}" "$container" 2>/dev/null)

if [[ "$state" == "true" ]]; then
    echo "Stopping container: $container"
    docker stop $container; \
    docker rm -f $(docker ps -aq --filter name=/$container) 2>/dev/null; \
else
    echo "Not running: $container"
fi
