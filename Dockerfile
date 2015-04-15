FROM debian:wheezy

RUN apt-get update -y
RUN apt-get install -y git curl python g++ make

RUN curl -sL https://deb.nodesource.com/setup_0.12 > nodesetup_0.12
RUN bash -c "source nodesetup_0.12"
RUN rm nodesetup_0.12
RUN apt-get install -y nodejs
RUN npm update -g npm@2.7.0

RUN apt-get install -y nginx
RUN service nginx stop
