#!/bin/bash
set -euo pipefail
command -v kubectl >/dev/null
command -v sha256sum >/dev/null
mkdir -p /tmp/cks-binary-verification
kubectl version -o json > /tmp/cks-binary-verification/kubectl-version.json 2>/dev/null || kubectl version > /tmp/cks-binary-verification/kubectl-version.txt
