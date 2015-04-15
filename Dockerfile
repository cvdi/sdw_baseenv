FROM debian:wheezy

RUN apt-get update -y
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_0.12 | sudo bash -
RUN apt-get install -y nodejs
RUN npm update -g npm@2.7.0
RUN npm install pm2@0.12.5 -g --unsafe-perm

RUN apt-get install -y nginx
RUN mkdir /var/cache/nginx
RUN service nginx stop
