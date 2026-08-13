#!/bin/bash
set -euo pipefail
kubectl get namespace cis-required -o jsonpath='{.metadata.labels.pod-security\.kubernetes\.io/enforce}' | grep -q restricted
kubectl get networkpolicy default-deny -n cis-required >/dev/null
kubectl get serviceaccount app -n cis-required -o jsonpath='{.automountServiceAccountToken}' | grep -q false
kubectl get deployment app -n cis-required -o jsonpath='{.spec.template.spec.serviceAccountName}' | grep -q '^app$'
kubectl get deployment app -n cis-required -o jsonpath='{.spec.template.spec.securityContext.runAsNonRoot}' | grep -q true
