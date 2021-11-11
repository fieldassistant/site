#!/usr/bin/env bash
set -e

cd "$(dirname $0)"

case "$1" in
    "up")
        docker-compose \
            --project-name bugman \
            up \
            --build \
            --remove-orphans \
            --detach
    ;;
    *)
    docker-compose --project-name bugman $@
    ;;
esac
