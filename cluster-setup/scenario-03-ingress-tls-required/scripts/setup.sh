#!/bin/bash
set -euo pipefail
kubectl create namespace cks-ingress --dry-run=client -o yaml | kubectl apply -f - >/dev/null
kubectl -n cks-ingress create deployment web --image=nginx:1.27 --dry-run=client -o yaml | kubectl apply -f - >/dev/null
kubectl -n cks-ingress expose deployment web --port=80 --target-port=80 --name=web --dry-run=client -o yaml | kubectl apply -f - >/dev/null
kubectl -n cks-ingress rollout status deployment/web --timeout=120s >/dev/null
command -v openssl >/dev/null || { echo "openssl is required"; exit 1; }
