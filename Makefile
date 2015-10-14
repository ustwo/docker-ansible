image_name := ustwo/ansible

volumes = -v $(ANSIBLE_IDENTITY_FILE):/root/.ssh/id_rsa \
					-v $(PWD)/playbooks:/playbooks \
					-v $(PWD)/hosts:/etc/ansible/hosts

build:
	docker build -t $(image_name) .

shell:
	docker run --rm -it \
		$(volumes) \
		$(image_name) sh

test:
	docker run --rm -it \
		$(volumes) \
		$(image_name) \
		ansible test -a "ls -la"
