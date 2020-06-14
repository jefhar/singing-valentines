# jefhar/singing-valentines:pcov
# For unit testing and deployment
FROM jefhar/singing-valentines:latest

# Install pcov
RUN apt-get update \
    && apt-get -y --no-install-recommends install \
	    php7.4-pcov \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*
