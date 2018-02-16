#!/usr/bin/env bash
. ./env.sh

echo "login"
docker login "$REGISTRY_HOST":"$REGISTRY_PORT" -u "$REGISTRY_USER" -p "$REGISTRY_PASS"
