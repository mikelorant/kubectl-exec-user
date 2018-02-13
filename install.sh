#!/usr/bin/env bash

echo "Starting..."

pwd
echo "Files in current dir..."
find .
echo "Files in parent dir..."
find ..

mkdir -p ~/.kube/plugins

cp -r exec-user ~/.kube/plugins/
chmod +x ~/.kube/plugins/exec-user
