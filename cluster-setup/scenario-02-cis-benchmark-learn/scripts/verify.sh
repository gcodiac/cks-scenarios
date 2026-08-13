#!/bin/bash
set -euo pipefail
kubectl get job kube-bench >/dev/null 2>&1
kubectl wait --for=condition=complete job/kube-bench --timeout=5s >/dev/null 2>&1
