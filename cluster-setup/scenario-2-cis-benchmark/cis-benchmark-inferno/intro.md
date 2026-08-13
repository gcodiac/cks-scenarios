# CIS Kubernetes Benchmark – Inferno

This is a high-pressure kubeadm hardening exercise. Work from evidence, make backups, and validate each change. Static pod edits can temporarily take down the API server; do not edit every manifest at once.

The exact flags vary by Kubernetes release. Inspect the running manifests and the benchmark output before changing anything. Managed Kubernetes control planes are out of scope for this lab because their flags are provider-managed.
