FROM ubuntu:22.04

LABEL maintainer="samer.bahri@edu.bme.hu"
LABEL version="0.1"
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV LC_CTYPE en_US.UTF-8
ENV TZ="Europe/Budapest"
WORKDIR /ansible
COPY . .
RUN sh scripts/install_ansible_in_docker.sh
WORKDIR /
RUN rm -rf /ansible
WORKDIR /ansible
