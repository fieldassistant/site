#!/usr/bin/env bash
set -e
cd "$(dirname "$0")"
cd ..

composer install --no-dev --no-scripts

npm ci --ignore-scripts --no-dev
export NODE_ENV=production
npm run build
