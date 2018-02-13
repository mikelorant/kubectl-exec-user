# kubectl-exec-user

## Overview

Exec as a specified user into a Kubernetes container.

This works by creating a pod on the name node as the container and mapping the docker socket into this container. The container runs docker which is able to use the exec command with the `--user` argument.

## Install

Run the install script:

```
./install.sh
```

## Usage

Exec into first container in `example-pod` with `sh`.
```
kubectl plugin exec-user example-pod
```

Exec into first container in `example-pod` with `bash`.
```
kubectl plugin exec-user example-pod bash
```

Exec into first container in `example-pod` with `bash` as user `admin`.
```
kubectl plugin exec-user -u admin example-pod bash
```

## Todo

- Add support for container name rather than defaulting to the first container.
