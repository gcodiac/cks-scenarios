#!/bin/bash
set -euo pipefail
kubectl delete job kube-bench --ignore-not-found >/dev/null 2>&1 || true
kubectl apply -f https://raw.githubusercontent.com/aquasecurity/kube-bench/main/job.yaml >/dev/null
kubectl wait --for=condition=complete job/kube-bench --timeout=180s >/dev/null
kubectl create namespace cis-required --dry-run=client -o yaml | kubectl apply -f - >/dev/null
kubectl label namespace cis-required pod-security.kubernetes.io/enforce=privileged --overwrite >/dev/null
kubectl create deployment app --image=nginxinc/nginx-unprivileged:1.27-alpine -n cis-required --dry-run=client -o yaml | kubectl apply -f - >/dev/null
kubectl rollout status deployment/app -n cis-required --timeout=120s >/dev/null
