# CIS Kubernetes Benchmark – Required Remediation

This exam-style lab gives you a deliberately weak namespace and asks you to remediate workload-level controls. The goal is least privilege and explicit traffic policy, not merely making a scanner green.

You must preserve application availability while applying: Pod Security Admission labels, a dedicated service account with token automount disabled, and a default-deny NetworkPolicy.
