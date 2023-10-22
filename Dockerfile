FROM node:16

MAINTAINER Dongasai 1514582970@qq.com

RUN mkdir -p /home/node/www

RUN npm install -g http-server

COPY . /home/node/www
WORKDIR /home/node/www
EXPOSE 80
CMD http-server -p 80 -a 0.0.0.0