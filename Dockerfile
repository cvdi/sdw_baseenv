FROM debian:wheezy

# install nodejs
RUN apt-get update -y
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_0.12 | bash -
RUN apt-get install -y nodejs
RUN npm update -g npm
RUN npm install pm2 -g

# install nginx
RUN echo "deb http://packages.dotdeb.org wheezy all" >> /etc/apt/sources.list && \
    echo "deb-src http://packages.dotdeb.org wheezy all" >> /etc/apt/sources.list
RUN curl http://www.dotdeb.org/dotdeb.gpg > dotdeb.gpg && \
    apt-key add dotdeb.gpg && \
    rm -f dotdeb.gpg && \
    apt-get update
RUN apt-get install -y nginx
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log
RUN service nginx stop

# install a simple editor for easy debugging
RUN apt-get install -y nano
