# This is not as slim as https://hub.docker.com/r/jefhar/singing-valentines.
# The image presented here is a general purpose php environment like you might
# find in a shared hosting environment.
FROM phpdockerio/php74-fpm:latest
ARG BUILD_DATE
ARG VCS_REF

LABEL maintainer="Jeff Harris <jeff@jeffharris.us>" \
  org.label-schema.build-date=$BUILD_DATE \
  org.label-schema.description="Singing Valentines backend" \
  org.label-schema.name="backend.singing-valentines" \
  org.label-schema.schema-version="1.0" \
  org.label-schema.url="https://singing-valentines.jeffharris.us" \
  org.label-schema.vcs-ref=$VCS_REF \
  org.label-schema.vcs-url="https://gitlab.com/jefhar/singing-valentines" \
  PHP="7.4"

# For local use:

# Update packages
RUN apt-get update \
	&& apt-get -y --no-install-recommends install \
	    php7.4-dom \
		php7.4-gd \
		php7.4-json \
		php7.4-mbstring \
        php7.4-mysql \
        php7.4-opcache \
        php7.4-pcov \
        php7.4-pdo \
        php7.4-redis \
        php7.4-sqlite3 \
        php7.4-zip \
        sqlite \
        unzip \
    && apt-get install -y --only-upgrade php7.4-cli php7.4-common \
    && apt-get autoremove -y \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

# Install Laravel Envoy
RUN  composer self-update \
    && composer global require "laravel/envoy=~1.0" \
    && composer clear-cache

RUN mkdir /application && ln -s /application /opt/project
