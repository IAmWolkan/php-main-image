FROM php:8.3.2-fpm-alpine3.19

RUN apk add --update --no-interactive \
  yaml-dev \
  curl-dev \
  openssl-dev \
  pcre-dev ${PHPIZE_DEPS}

RUN pecl channel-update pecl.php.net
RUN pecl install yaml && docker-php-ext-enable yaml

RUN docker-php-ext-install pdo_mysql
