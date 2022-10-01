apt update

apt upgrade -y

apt install -y --no-install-recommends software-properties-common

rm -rf /var/lib/apt/lists/*

apt update

apt install -y --no-install-recommends locales build-essential python3.10 python3-pip ssh

pip3 install --no-cache-dir -r requirements.txt

ansible-runner run /ansible -p playbooks/misc/k8s_client.yml