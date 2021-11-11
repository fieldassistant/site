#!/usr/bin/env bash
set -e

cd "$(dirname $0)"

docker-compose \
    --project-name bugman \
    up \
    --build \
    --remove-orphans \
    --detach
