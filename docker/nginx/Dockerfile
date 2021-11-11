FROM nginx:alpine

RUN set -xe \
    apk update \
    && apk add --update --no-cache \
    openssl

COPY craft.conf /etc/nginx/craft.conf
COPY default.conf /etc/nginx/conf.d/default.conf
COPY start.sh /start.sh

ENTRYPOINT ["/start.sh"]
CMD ["nginx", "-g", "daemon off;"]
