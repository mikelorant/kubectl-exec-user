#!/usr/bin/env bash

mkdir -p /$USER/.kube/plugins

cp -r exec-user /$USER/.kube/plugins/
chmod +x /$USER/.kube/plugins/exec-user
