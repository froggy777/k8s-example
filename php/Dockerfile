FROM php:7.2-fpm

VOLUME /webpub/www
WORKDIR /webpub/www
RUN echo "<?php phpinfo();?>" > index.php
COPY ./php.ini /usr/local/etc/php/php.ini

