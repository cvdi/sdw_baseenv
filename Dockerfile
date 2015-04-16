FROM oraclelinux:6.6 

# install nodejs
RUN rpm -ivh ftp://rpmfind.net/linux/centos/6.6/os/x86_64/Packages/tar-1.23-11.el6.x86_64.rpm
RUN cd /usr/local
RUN curl http://nodejs.org/dist/v0.12.2/node-v0.12.2-linux-x64.tar.gz > node-v0.12.2-linux-x64.tar.gz
RUN tar --strip-components 1 -xzf node-v0.12.2-linux-x64.tar.gz
RUN rm node-v0.12.2-linux-x64.tar.gz
RUN npm install pm2@0.12.5 -g --unsafe-perm

# install nginx
RUN rpm -ivh http://nginx.org/packages/rhel/6/x86_64/RPMS/nginx-1.6.3-1.el6.ngx.x86_64.rpm
RUN mkdir -p /etc/nginx/sites-available
RUN mkdir -p /etc/nginx/sites-enabled
