FROM debian:wheezy

RUN apt-get update -y
RUN apt-get install -y git curl python g++ make

RUN curl -sL https://deb.nodesource.com/setup_0.12 > nodesetup_0.12
RUN bash -c "source nodesetup_0.12"
RUN rm nodesetup_0.12
RUN apt-get install -y nodejs
RUN npm update -g npm@2.7.0
RUN npm install pm2@0.12.5 -g --unsafe-perm
RUN npm install jshint@2.6.0 grunt-cli@0.1.13 bower@1.4.1 mocha@2.2.3 -g

RUN apt-get install -y nginx
RUN service nginx stop
