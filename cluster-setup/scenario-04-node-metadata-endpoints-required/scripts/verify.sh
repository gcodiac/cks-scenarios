#!/bin/bash
set -euo pipefail
test -z "$(kubectl get deployment metadata-demo -n cks-metadata -o jsonpath='{.spec.template.spec.hostNetwork}')"
test -z "$(kubectl get deployment metadata-demo -n cks-metadata -o jsonpath='{.spec.template.spec.hostPID}')"
