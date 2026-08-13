#!/bin/bash
set -euo pipefail
kubectl delete job kube-bench --ignore-not-found >/dev/null 2>&1 || true
kubectl apply -f https://raw.githubusercontent.com/aquasecurity/kube-bench/main/job.yaml >/dev/null
kubectl wait --for=condition=complete job/kube-bench --timeout=180s >/dev/null
