# Use CIS Benchmarks to Review Security Configuration — Production

## How this looks in production

CIS assessment is the same discipline on EKS, but AWS manages the control plane. You assess worker-node configuration, workload policies, IAM, logging, and provider shared-responsibility controls; you cannot edit EKS API-server manifests.

Pin the benchmark version, Kubernetes version, image digest, and profile. Retain output with cluster identity and date. Every exception needs a control ID, rationale, compensating control, owner, expiry, and approval. Re-test after upgrades and infrastructure changes.
