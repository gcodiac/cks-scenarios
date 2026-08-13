#!/bin/bash
set -euo pipefail
kubectl create namespace cks-network --dry-run=client -o yaml | kubectl apply -f - >/dev/null
kubectl -n cks-network create deployment frontend --image=nginx:1.27 --dry-run=client -o yaml | kubectl apply -f - >/dev/null
kubectl -n cks-network create deployment backend --image=nginx:1.27 --dry-run=client -o yaml | kubectl apply -f - >/dev/null
kubectl -n cks-network rollout status deployment/frontend --timeout=120s >/dev/null
kubectl -n cks-network rollout status deployment/backend --timeout=120s >/dev/null
