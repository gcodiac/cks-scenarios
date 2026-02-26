#!/bin/bash

# Ensure falco namespace exists
kubectl get namespace falco >/dev/null 2>&1 || exit 1

# Ensure Helm release exists
helm status falco -n falco >/dev/null 2>&1 || exit 1

# Ensure at least one Falco pod is Running
RUNNING_PODS=$(kubectl get pods -n falco \
  --field-selector=status.phase=Running \
  --no-headers 2>/dev/null | wc -l)

if [ "$RUNNING_PODS" -lt 1 ]; then
  exit 1
fi

exit 0