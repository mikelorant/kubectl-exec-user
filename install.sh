#!/usr/bin/env bash

mkdir -p ~/.kube/plugins

cp -r exec-user ~/.kube/plugins/
chmod +x ~/.kube/plugins/exec-user
