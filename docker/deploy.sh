#!/usr/bin/env bash
set -e

cd "$(dirname $0)"
cd ..

docker-compose up \
    --build \
    --remove-orphans \
    --detach
