#!/bin/bash
set -euo pipefail
kubectl delete job kube-bench --ignore-not-found >/dev/null 2>&1 || true
