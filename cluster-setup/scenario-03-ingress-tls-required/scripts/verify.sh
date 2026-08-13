#!/bin/bash
set -euo pipefail
kubectl get ingress -n cks-ingress web >/dev/null
kubectl get secret -n cks-ingress demo-tls -o jsonpath='{.type}' | grep -q kubernetes.io/tls
