
default:
	make ansible

.PHONY: ansible
ansible:
	sh ./scripts/ansible_docker_container.sh

.PHONY: playbook
playbook:
	ansible-playbook -i inventory --ask-vault-pass $(P)
