
default:
	make ansible

.PHONY: ansible
ansible:
	sh ./scripts/ansible_docker_container.sh