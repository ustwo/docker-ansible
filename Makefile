image_name := ustwo/ansible

volumes = -v $(ANSIBLE_IDENTITY_FILE):/root/.ssh/id_rsa \
					-v $(PWD)/playbooks:/playbooks \
					-v $(PWD)/hosts:/etc/ansible/hosts

build:
	docker build -t $(image_name) .

shell:
	docker run --rm -it \
		$(volumes) \
		--link sshd_mock:mock \
		$(image_name) sh

test:
	docker run --rm -it \
		$(volumes) \
		--link sshd_mock:mock \
		$(image_name) \
		ansible -vvvv test -a "ls -la"

mock-test:
	docker run --rm -it \
		$(volumes) \
		--link sshd_mock:mock \
		$(image_name) \
		sh

mock-build:
	docker build -t sshd_mock -f Dockerfile.mock .

mock-shell:
	docker run --rm -it \
		sshd_mock sh

mock-run:
	docker run -d -p 2222:22 \
		-v $(PWD):/source \
		--name sshd_mock \
		sshd_mock

mock-clean:
	docker rm -vf sshd_mock
