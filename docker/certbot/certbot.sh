#!/bin/sh

set -e

echo "hi there"

certbot certonly \
    --webroot \
    --webroot-path=/srv \
    --non-interactive \
    --email me@gwilyn.com \
    --agree-tos \
    --expand \
    --preferred-challenges http \
    --domain fieldassistant.app

# and forever after.
while true; do
    echo "sleeping..."
    sleep 1d
    certbot renew \
        --webroot \
        --webroot-path=/srv \
        --non-interactive \
        --preferred-challenges http
done
