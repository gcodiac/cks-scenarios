#!/bin/bash
set -euo pipefail
kubectl get deployment metadata-demo -n cks-metadata >/dev/null
test -z "$(kubectl get deployment metadata-demo -n cks-metadata -o jsonpath='{.spec.template.spec.hostNetwork}')"
