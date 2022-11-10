FROM ubuntu:20.04

RUN apt-get update \
    && DEBIAN_FRONTEND="noninteractive" apt-get -y install \
        git \
        openssh-server \
        rsync \
    && rm -rf /var/lib/apt/lists/*

RUN set -e ; \
    mkdir /var/run/sshd ; \
    mkdir -p -m 0700 ~/.ssh; \
    if [ -n "${http_proxy}" ]; then \
        sed -ri 's/#PermitUserEnvironment no/PermitUserEnvironment yes/g' /etc/ssh/sshd_config; \
        echo "http_proxy=${http_proxy}" > ~/.ssh/environment; \
        echo "https_proxy=${https_proxy}" >> ~/.ssh/environment; \
        echo "no_proxy=${no_proxy}" >> ~/.ssh/environment; \
    fi \
    ;

EXPOSE 22

ENTRYPOINT ["/usr/sbin/sshd", "-D" ]