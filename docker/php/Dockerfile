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


# NPM dependencies
FROM base AS npm

COPY package.json package-lock.json /srv/
RUN npm ci --ignore-scripts --no-optional --no-audit

COPY gulpfile.js /srv/
COPY patterns /srv/patterns
RUN npm run build


# Composer dependencies
FROM base AS composer

COPY composer.json composer.lock /srv/
RUN composer install --no-scripts --no-dev


# Application
FROM base AS app

COPY config/ /srv/config/
COPY modules/ /srv/modules/
COPY templates/ /srv/templates/
COPY --from=npm /srv/web/css/ /srv/web/css/
COPY --from=composer /srv/vendor/ /srv/vendor/

RUN ls -lha /srv

EXPOSE 9000
CMD [ "/usr/sbin/php-fpm7", "-F" ]
