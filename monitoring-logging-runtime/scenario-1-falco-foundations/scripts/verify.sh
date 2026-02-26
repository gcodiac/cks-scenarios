#!/bin/bash

# Check namespace exists
kubectl get namespace falco >/dev/null 2>&1 || exit 1

# Check DaemonSet exists
kubectl get daemonset falco -n falco >/dev/null 2>&1 || exit 1

# Check at least one Falco pod is Running
RUNNING=$(kubectl get pods -n falco \
  --field-selector=status.phase=Running \
  --no-headers 2>/dev/null | wc -l)

if [ "$RUNNING" -lt 1 ]; then
  exit 1
fi

exit 0