#!/bin/sh

set -e

ssh-keygen -A
chmod 600 /root/.ssh/*
exec "$@"
