FROM oraclelinux:6.6 

# install nodejs
RUN yum install -y tar
RUN cd /usr/local
RUN curl http://nodejs.org/dist/v0.12.2/node-v0.12.2-linux-x64.tar.gz > node-v0.12.2-linux-x64.tar.gz
RUN tar --strip-components 1 -xzf node-v0.12.2-linux-x64.tar.gz
RUN rm node-v0.12.2-linux-x64.tar.gz
RUN npm install pm2@0.12.5 -g --unsafe-perm

# install nginx
RUN rpm -ivh http://nginx.org/packages/rhel/6/noarch/RPMS/nginx-release-rhel-6-0.el6.ngx.noarch.rpm
RUN yum install -y nginx
RUN mkdir -p /etc/nginx/sites-available
RUN mkdir -p /etc/nginx/sites-enabled
