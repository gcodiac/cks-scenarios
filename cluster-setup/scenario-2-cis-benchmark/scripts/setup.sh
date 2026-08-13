#!/bin/bash
set -euo pipefail

# Prepare the workload fixture used by the Required CIS stage.
bash cis-benchmark-required/scripts/setup.sh
kubectl delete job kube-bench --ignore-not-found >/dev/null 2>&1 || true
