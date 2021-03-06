FROM node:latest AS builder
RUN npm install -g cnpm --registry=https://registry.npm.taobao.org

COPY ./client /tmp

WORKDIR /tmp

RUN cnpm i
RUN npm run build

FROM ubuntu:18.04
LABEL maintainer = "zhixiang@live.cn"
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN mkdir -p /app/client
COPY --from=builder /tmp/dist /app/client

# change apt source list to Aliyun, update and upgrade.
COPY ./env/sys/source.list /etc/apt/sources.list
RUN apt update -y
RUN apt upgrade -y

# install softwares and python dependencies.
RUN apt install -y python3 python3-pip mongodb nginx
COPY ./env/py/requirements.txt /tmp
RUN pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple -r /tmp/requirements.txt

# copy ssl certificate and key
RUN mkdir /app/ssl
COPY ./env/ssl /app/ssl/

# create nginx log directory and apply nginx configuration
COPY ./env/nginx/site.conf /etc/nginx/sites-available/
RUN ln -s ../sites-available/site.conf /etc/nginx/sites-enabled/site.conf
# RUN echo 'daemon off;' >> /etc/nginx/nginx.conf
RUN mkdir /logs
RUN mkdir -p /data/db


# copy service code
RUN mkdir /app/service
WORKDIR /app/service
COPY ./service/src .