# kubectl-exec-user

## Overview

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
