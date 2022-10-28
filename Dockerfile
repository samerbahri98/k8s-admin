FROM ubuntu:22.04

LABEL maintainer="samer.bahri@edu.bme.hu"
LABEL version="0.1"
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV TZ="Europe/Budapest"

WORKDIR /ansible
RUN chmod 777 /ansible
COPY . .
RUN sh scripts/install_ansible_in_docker.sh && rm -rf ./*