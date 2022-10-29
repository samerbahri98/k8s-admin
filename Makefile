
default:
	make ansible

.PHONY: ansible
ansible:
	sh ./scripts/ansible_docker_container.sh

.PHONY: playbook
playbook:
	ansible-playbook -i inventory --ask-vault-pass $(P)

.PHONY: jp
jp:
	ansible-playbook ./playbooks/misc/ansible_jenkins.yml -i inventory --ask-vault-pass --extra-vars "playbook=$(P)"