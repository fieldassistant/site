#!/bin/sh
set -e

DOMAINS="fieldassistant.app"

if [ "$1" = "nginx" ]; then
    echo $PATH
    echo "EXEC: $@"

    for domain in $DOMAINS; do
        mkdir -p "/etc/letsencrypt/live/$domain"
        cd "/etc/letsencrypt/live/$domain"

        [ -f "fullchain.pem" ] && continue

        echo "Creating a placeholder certificate..."
        openssl req -x509 -newkey rsa:4096 \
            -keyout privkey.pem \
            -out fullchain.pem \
            -subj "/C=US/ST=Fake/L=Fake/O=Fake/CN=$domain" \
            -nodes \
            -sha256 \
            -days 1
    done
fi

exec "$@"
