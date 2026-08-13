#!/bin/bash
set -euo pipefail
kubectl create namespace cks-metadata --dry-run=client -o yaml | kubectl apply -f - >/dev/null
kubectl -n cks-metadata create deployment metadata-demo --image=nginx:1.27 --dry-run=client -o yaml | kubectl apply -f - >/dev/null
kubectl -n cks-metadata rollout status deployment/metadata-demo --timeout=120s >/dev/null
