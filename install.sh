#!/usr/bin/env bash

mkdir -p ~/.kube/plugins

cp -r /usr/local/Cellar/kubectl-exec-user/kubectl/libexec/exec-user ~/.kube/plugins/
chmod +x ~/.kube/plugins/exec-user
