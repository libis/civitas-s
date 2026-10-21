FROM php:8.4-apache

RUN a2enmod rewrite

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -qq update && apt-get -qq -y upgrade
RUN apt-get -qq update && apt-get -qq -y --no-install-recommends install \
    unzip \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpng-dev \
    libjpeg-dev \
    libmemcached-dev \
    zlib1g-dev \
    imagemagick \
    libmagickwand-dev \
    wget \
    ghostscript \
    ffmpeg \
    dos2unix

RUN apt-get update && \
    apt-get install -y net-tools && \
    apt-get install -y rsyslog
RUN apt-get install -y mailutils

RUN docker-php-ext-install opcache \
  && docker-php-ext-enable opcache

# Install the PHP extensions we need
RUN docker-php-ext-install -j$(nproc) iconv pdo pdo_mysql mysqli

# GD
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
  && docker-php-ext-install -j "$(nproc)" gd

RUN usermod -u 1000 www-data
RUN wget --no-verbose "https://github.com/omeka/omeka-s/releases/download/v4.2.1/omeka-s-4.2.1.zip" -O /var/www/omeka-s.zip
RUN unzip -q /var/www/omeka-s.zip -d /var/www/ \
&&  rm /var/www/omeka-s.zip \
&&  rm -rf /var/www/html/civitas/ \
&&  mv /var/www/omeka-s /var/www/html/civitas/ \
&&  chown -R www-data:www-data /var/www/html/


COPY themes /var/www/html/civitas/themes
COPY modules /var/www/html/civitas/modules  

CMD ["apache2-foreground"]
