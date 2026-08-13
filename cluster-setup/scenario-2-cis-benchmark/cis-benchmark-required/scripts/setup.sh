#!/bin/bash
set -euo pipefail
kubectl create namespace cis-required --dry-run=client -o yaml | kubectl apply -f - >/dev/null
kubectl label namespace cis-required pod-security.kubernetes.io/enforce=privileged --overwrite >/dev/null
kubectl create deployment app --image=nginxinc/nginx-unprivileged:1.27-alpine -n cis-required --dry-run=client -o yaml | kubectl apply -f - >/dev/null
kubectl rollout status deployment/app -n cis-required --timeout=120s >/dev/null
