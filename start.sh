#!/usr/bin/env bash
set -e

cd "$(dirname $0)"

docker-compose up \
    --project-name bugman \
    --build \
    --remove-orphans \
    --detach