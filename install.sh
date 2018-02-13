#!/usr/bin/env bash

echo "Starting..."

ls -ltr .

mkdir -p ~/.kube/plugins

cp -r exec-user ~/.kube/plugins/
chmod +x ~/.kube/plugins/exec-user
