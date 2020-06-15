# jefhar/singing-valentines:xdebug
# For unit testing and deployment
FROM jefhar/singing-valentines:latest

# Install xdebug
RUN apt-get update \
    && apt-get -y install \
        php7.4-sqlite3 \
	    php-xdebug \
	    sqlite3 \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*
