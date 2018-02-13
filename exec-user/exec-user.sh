#!/usr/bin/env bash

POD=${1}
COMMAND=${2:=sh}

KUBECTL=${KUBECTL_PLUGINS_CALLER}
NAMESPACE=${KUBECTL_PLUGINS_CURRENT_NAMESPACE}
USER=${KUBECTL_PLUGINS_LOCAL_FLAG_USER}

NODENAME=$( $KUBECTL --namespace ${NAMESPACE} get pod ${POD} -o go-template='{{.spec.nodeName}}' )
CONTAINER=$( $KUBECTL --namespace ${NAMESPACE} get pod ${POD} -o go-template='{{ (index .status.containerStatuses 0).containerID }}' )
CONTAINERID=${CONTAINER#*//}

read -r -d '' OVERRIDES <<EOF
{
    "apiVersion": "v1",
    "spec": {
        "containers": [
            {
                "image": "docker",
                "name": "docker",
                "stdin": true,
                "stdinOnce": true,
                "tty": true,
                "restartPolicy": "Never",
                "args": [
                  "exec",
                  "-it",
                  "-u",
                  "${USER}",
                  "${CONTAINERID}",
                  "$COMMAND}"
                ],
                "volumeMounts": [
                    {
                        "mountPath": "/var/run/docker.sock",
                        "name": "docker"
                    }
                ]
            }
        ],
        "nodeSelector": {
          "kubernetes.io/hostname": "${NODENAME}"
        },
        "volumes": [
            {
                "name": "docker",
                "hostPath": {
                    "path": "/var/run/docker.sock",
                    "type": "File"
                }
            }
        ]
    }
}
EOF

eval kubectl run -it --rm --restart=Never --image=docker --overrides="'${OVERRIDES}'" docker
