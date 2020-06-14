# jefhar/singing-valentines:xdebug
# For unit testing and deployment
FROM jefhar/singing-valentines:latest

# Install xdebug
RUN apt-get update \
    && apt-get -y --no-install-recommends install \
	    php-xdebug \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*
