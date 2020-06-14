# jefhar/singingvalentines:pcov
# For unit testing and deployment
# Set the base image for subsequent instructions
FROM jefhar/singingvalentines:latest

# Install pcov
RUN apt-get update \
    && apt-get -y --no-install-recommends install \
	    php7.4-pcov \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*
