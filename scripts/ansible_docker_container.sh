#! /bin/sh

docker run --rm -it\
    -v "$(dirname "$SSH_AUTH_SOCK")":"$(dirname "$SSH_AUTH_SOCK")"\
    -v "$PWD":/ansible \
    -v "$PWD/.aws":"/root/.aws" \
    -e SSH_AUTH_SOCK="$SSH_AUTH_SOCK" \
    -e KUBECONFIG=/ansible/.kube/config \
    --privileged \
    ghcr.io/samerbahri98/k8s-admin-ansible:main /bin/bash