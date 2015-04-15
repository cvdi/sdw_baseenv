FROM debian:wheezy

RUN curl -sL https://deb.nodesource.com/setup_0.12 > nodesetup_0.12
RUN bash -c "source nodesetup_0.12"
RUN rm nodesetup_0.12
RUN apt-get install -y nodejs
RUN npm update -g npm@2.7.0
RUN npm install pm2@0.12.5 -g --unsafe-perm

RUN apt-get install -y nginx
RUN mkdir /var/cache/nginx
RUN service nginx stop
