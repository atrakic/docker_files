#!/usr/bin/env bash
TOP="$(git rev-parse --show-toplevel)"
. "$TOP/scripts/env.sh"

echo "Login $REGISTRY_HOST"
docker login "$REGISTRY_HOST":"$REGISTRY_PORT" -u "$REGISTRY_USER" -p "$REGISTRY_PASS"
