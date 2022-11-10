FROM ubuntu:20.04

LABEL maintainer="samer.bahri@edu.bme.hu"
LABEL version="0.1"
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV TZ="Europe/Budapest"

RUN apt-get update \
    && DEBIAN_FRONTEND="noninteractive" apt-get -y install \
        --no-install-recommends \
        git \
        ssh \
        openssh-server \
        rsync \
    && rm -rf /var/lib/apt/lists/*

RUN set -e ; \
    mkdir /var/run/sshd ; \
    mkdir -m 0700 ~/.ssh; \
    if [ -n "${http_proxy}" ]; then \
        sed -ri 's/#PermitUserEnvironment no/PermitUserEnvironment yes/g' /etc/ssh/sshd_config; \
        echo "http_proxy=${http_proxy}" > ~/.ssh/environment; \
        echo "https_proxy=${https_proxy}" >> ~/.ssh/environment; \
        echo "no_proxy=${no_proxy}" >> ~/.ssh/environment; \
    fi \
    ;

EXPOSE 22

ENTRYPOINT ["/usr/sbin/sshd", "-D" ]