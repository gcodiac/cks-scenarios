#!/bin/bash
set -euo pipefail
kubectl get --raw='/readyz' >/dev/null
kubectl get nodes --no-headers | awk '$2 == "Ready" { found=1 } END { exit !found }'
