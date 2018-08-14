#!/usr/bin/env bash

# set -e 

TOP="$(git rev-parse --show-toplevel)"
. "$TOP/scripts/env.sh"

container="$1"
state=$(docker inspect --format "{{.State.Running}}" "$container" 2>/dev/null)

if [[ "$state" == "false" ]] || [[ "$state" == "" ]]; then
    echo "Starting container: $container"
    docker run "$container"
else
    echo "Already running: $container"
fi
