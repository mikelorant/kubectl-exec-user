#!/usr/bin/env bash

env

ls -l ~

mkdir -p ~/.kube/plugins

cp -r exec-user ~/.kube/plugins/
chmod +x ~/.kube/plugins/exec-user
