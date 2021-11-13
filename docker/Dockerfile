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
    php7-tokenizer \
    php7-xml \
    php7-zip \
    php7-zlib \
    nodejs \
    npm

COPY docker/conf.d/*.ini /etc/php7/conf.d/

WORKDIR /srv

# Application
FROM base AS app

# Listen on unix socket
RUN echo -e "[global]\n\
error_log = /proc/self/fd/2 \n\
daemonize = no \n\
[www]\n\
pm = ondemand \n\
pm.max_children = 5 \n\
listen = 0.0.0.0:9000 \n\
access.log = /proc/self/fd/2 \n\
catch_workers_output = yes \n\
" > /etc/php7/php-fpm.d/www.conf


EXPOSE 9000
CMD [ "/usr/sbin/php-fpm7", "-F" ]
