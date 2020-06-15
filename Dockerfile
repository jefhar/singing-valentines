# jefhar/singing-valentines:pcov
# For unit testing and deployment
FROM jefhar/singing-valentines:latest

# Install pcov
RUN apt-get update \
    && apt-get -y install \
	    php7.4-pcov \
        php7.4-sqlite3 \
        sqlite3 \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*
