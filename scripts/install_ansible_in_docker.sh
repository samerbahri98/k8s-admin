#! /bin/sh

apt update

apt upgrade -y

apt install -y --no-install-recommends software-properties-common

rm -rf /var/lib/apt/lists/*

apt update

apt install -y --no-install-recommends locales build-essential python3.10 python3-pip ssh mysql-client libmysqlclient-dev libpq-dev python3-dev git gnupg unzip

rm -rf /var/lib/apt/lists/*

pip3 install --no-cache-dir -r requirements.txt

ansible-galaxy install -r requirements.yml

ansible-runner run /ansible -p playbooks/misc/k8s_client.yml

ansible-runner run /ansible -p playbooks/misc/terraform.yml
