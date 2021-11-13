FROM alpine:3.14 AS base

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

RUN set -xe \
    && apk add --update --no-cache \
    ca-certificates \
    curl \
    mariadb-client \
    php7 \
    php7-cli \
    php7-bcmath \
    php7-common \
    php7-ctype \
    php7-curl \
    php7-dom \
    php7-exif \
    php7-fileinfo \
    php7-fpm \
    php7-gd \
    php7-intl \
    php7-json \
    php7-openssl \
    php7-opcache \
    php7-mbstring \
    php7-phar \
    php7-pdo_mysql \
    php7-session \
    php7-xml \
    php7-zip \
    php7-zlib \
    nodejs \
    npm

COPY docker/php/*.ini /etc/php7/conf.d/

WORKDIR /srv


# Application
FROM base AS app

EXPOSE 9000
CMD [ "/usr/sbin/php-fpm7", "-F" ]
