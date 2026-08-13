#!/bin/bash
set -euo pipefail
kubectl get nodes --no-headers | awk '$2 == "Ready" { found=1 } END { exit !found }'
kubectl get --raw='/readyz' >/dev/null
test -f /etc/kubernetes/manifests/kube-apiserver.yaml
test -f /var/lib/kubelet/config.yaml
