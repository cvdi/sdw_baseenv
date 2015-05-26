FROM debian:wheezy

# install nodejs
RUN apt-get update -y
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_0.12 | bash -
RUN apt-get install -y nodejs
RUN npm update -g npm@2.7.0
RUN npm install pm2@0.12.5 -g --unsafe-perm

# install nginx
RUN echo "deb http://packages.dotdeb.org wheezy all" >> /etc/apt/sources.list && \
    echo "deb-src http://packages.dotdeb.org wheezy all" >> /etc/apt/sources.list
RUN curl http://www.dotdeb.org/dotdeb.gpg > dotdeb.gpg && \
    apt-key add dotdeb.gpg && \
    rm -f dotdeb.gpg && \
    apt-get update
RUN apt-get install -y nginx
RUN service nginx stop
