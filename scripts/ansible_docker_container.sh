#! /bin/sh

docker run --rm -it\
    -v "$(dirname "$SSH_AUTH_SOCK")":"$(dirname "$SSH_AUTH_SOCK")"\
    -v /var/run/docker.sock:/var/run/docker.sock\
    -v "$PWD":/ansible \
    -v "$PWD/.aws":"/root/.aws" \
    -e SSH_AUTH_SOCK="$SSH_AUTH_SOCK" \
    -e KUBECONFIG=/ansible/.kube/config \
    --privileged \
    --add-host=host.docker.internal:host-gateway \
    ghcr.io/samerbahri98/k8s-admin-ansible:main /bin/bash