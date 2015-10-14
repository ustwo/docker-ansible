# Dockerised Ansible

This image is based on [Alpine](https://alpinelinux.org).

## Versions

* 1.9.4, latest

## Assumptions

* Workdir: `/home/ustwo`.

## Usage

    docker run --rm -t \
      -v /path/to/my/id_rsa:/root/.ssh/id_rsa \
      -v /path/to/my/ansible/hosts:/etc/ansible/hosts \
      -v /path/to/my/ansible/playbooks:/playbooks \
      ustwo/ansible:1.9.4 \
      ansible --help


## Maintainers

* [Arnau Siches](mailto:arnau@ustwo.com)
