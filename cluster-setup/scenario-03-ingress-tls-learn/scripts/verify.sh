#!/bin/bash
set -euo pipefail
kubectl get service web -n cks-ingress >/dev/null
command -v openssl >/dev/null
