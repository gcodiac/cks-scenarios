# Step 1 – Harden the namespace

Inspect the fixture:

```bash
kubectl get namespace cis-required --show-labels
kubectl get deployment -n cis-required -o yaml
```

Apply the Kubernetes Pod Security **restricted** profile in enforce mode. Use the version label appropriate for the cluster (the fixture uses `latest`):

```bash
kubectl label namespace cis-required \
  pod-security.kubernetes.io/enforce=restricted \
  pod-security.kubernetes.io/enforce-version=latest \
  pod-security.kubernetes.io/audit=restricted \
  pod-security.kubernetes.io/warn=restricted --overwrite
```

If an existing workload is rejected, inspect its security context and remediate it rather than weakening the namespace policy.
