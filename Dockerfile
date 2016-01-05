FROM debian:8
MAINTAINER Arnau Siches <arnau@ustwo.com>

RUN apt-get update -qq \
 && apt-get install -qqy \
      openssh-client \
      python-dev \
      python-pip \
 && apt-get autoclean \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pip install \
      ansible \
      markupsafe

RUN mkdir /root/.ssh \
 && echo "Host *\nStrictHostKeyChecking no" > /root/.ssh/config

WORKDIR /playbooks
VOLUME /root/.ssh/id_rsa
VOLUME /etc/ansible/hosts
VOLUME /playbooks
CMD ["ansible"]
