FROM ubuntu:20.04

RUN apt-get update \
    && DEBIAN_FRONTEND="noninteractive" apt-get -y install \
        git=1:2.25.1-1ubuntu3.6 \
        openssh-server=1:8.9p1-3 \
        rsync=3.1.3-8ubuntu0.4 \
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