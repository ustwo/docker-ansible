FROM alpine:3.2
MAINTAINER Arnau Siches <arnau@ustwo.com>

RUN echo "http://dl-3.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories \
 && apk add --update \
      openssh-client \
      ansible=1.9.4-r0 \
 && rm -rf /var/cache/apk/*

RUN mkdir /root/.ssh \
 && echo "StrictHostKeyChecking no" > /root/.ssh/config

WORKDIR /playbooks
VOLUME /root/.ssh/id_rsa
VOLUME /etc/ansible/hosts
VOLUME /playbooks
CMD ["ansible"]
