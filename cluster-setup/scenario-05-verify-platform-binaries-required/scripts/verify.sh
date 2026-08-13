#!/bin/bash
set -euo pipefail
command -v kubectl >/dev/null
test -s /tmp/cks-binary-verification/kubectl-version.json || test -s /tmp/cks-binary-verification/kubectl-version.txt
