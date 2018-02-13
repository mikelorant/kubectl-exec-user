#!/usr/bin/env bash

ls -ltr .

mkdir -p ~/.kube/plugins

cp -r exec-user ~/.kube/plugins/
chmod +x ~/.kube/plugins/exec-user
