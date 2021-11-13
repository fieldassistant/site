#!/usr/bin/env bash
set -e

cd "$(dirname $0)"

export USER_UID="$(id -u):$(id -g)"

case "$1" in
    "up")
        shift 1
        docker-compose \
            --project-name bugman \
            up \
            --build \
            --remove-orphans \
            --detach
            $@
    ;;

    *)
        docker-compose \
            --project-name bugman \
            $@
    ;;
esac
