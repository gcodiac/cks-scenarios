#!/bin/bash
set -euo pipefail
kubectl get networkpolicy -n cks-network default-deny >/dev/null
kubectl get networkpolicy -n cks-network frontend-to-backend >/dev/null
kubectl get nodes --no-headers | awk '$2 == "Ready" { ok=1 } END { exit !ok }'
