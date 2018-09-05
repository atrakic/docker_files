#!/usr/bin/env bash

set -e 

TOP="$(git rev-parse --show-toplevel)"
. "$TOP/scripts/env.sh"

echo "Login $REGISTRY_HOST:$REGISTRY_PORT"

docker login -u "$REGISTRY_USER" -p "$REGISTRY_PASS" https://"$REGISTRY_HOST":"$REGISTRY_PORT"

# curl -u "$REGISTRY_USER":"$REGISTRY_PASS" -k https://"$REGISTRY_HOST":"$REGISTRY_PORT"/v2/
