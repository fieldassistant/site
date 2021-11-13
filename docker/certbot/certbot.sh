#!/bin/sh

case "$1" in
    create)
        echo "Creating a certificate..."
        certbot certonly \
            --webroot \
            --webroot-path=/acme \
            --non-interactive \
            --email me@gwilyn.com \
            --agree-tos \
            --expand \
            --preferred-challenges http \
            --domain fieldassistant.app
        exit $?
    ;;

    renew)
        while true; do
            echo "Sleeping..."
            sleep 1d
            echo "Renewing..."
            certbot renew \
                --webroot \
                --webroot-path=/acme \
                --non-interactive \
                --preferred-challenges http
        done
    ;;

    *)
        exec $@
        exit $?
    ;;
esac
