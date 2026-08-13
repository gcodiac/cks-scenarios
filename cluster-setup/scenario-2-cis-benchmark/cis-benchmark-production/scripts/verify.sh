#!/bin/bash
set -euo pipefail
kubectl get nodes --no-headers | awk '$2 == "Ready" { found=1 } END { exit !found }'
kubectl get --raw='/readyz' >/dev/null
kubectl get job kube-bench >/dev/null 2>&1
kubectl wait --for=condition=complete job/kube-bench --timeout=5s >/dev/null 2>&1
