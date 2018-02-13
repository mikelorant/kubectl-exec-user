# kubectl-exec-user

## Overview

Exec as a specified user into a Kubernetes container.

This works by creating a pod on the same node as the container and mapping the docker socket into this container. The container runs docker which is able to use the exec command with the user flag.

## Install

Run the install script to copy the plugin to `~/.kube/plugins`.

```
./install.sh
```

## Usage

```
kubectl plugin exec-user $POD $COMMAND
```

If the command is not specified, falls back to the `sh` command.

**Flags**

| Name      | Shorthand | Default | Usage                                                                     |
|-----------|-----------|---------|---------------------------------------------------------------------------|
| user      | -u        | root    | Username or UID.                                                          |
| container | -c        |         | Container name. If omitted, the first container in the pod will be chosen |

## Examples

Exec into first container in `example` pod with `sh` as user `root`.
```
kubectl plugin exec-user example
```

Exec into first container in `example` pod with `bash` as user `root`.
```
kubectl plugin exec-user example bash
```

Exec into first container in `example` pod with `bash` as user `admin`.
```
kubectl plugin exec-user -u admin example-pod bash
```

Exec into `another-container` in `example` pod with `bash` as user `admin`.
```
kubectl plugin exec-user -c another-container -u admin example-pod bash
```
