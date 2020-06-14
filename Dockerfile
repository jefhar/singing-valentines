# jefhar/singing-valentines:yarn
# For unit testing and deployment
FROM jefhar/singing-valentines:latest

# Install yarn
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g yarn
