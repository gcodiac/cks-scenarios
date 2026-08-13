# Step 2 – Read and scope findings

Review the report and group findings by section:

```bash
kubectl logs job/kube-bench | less
kubectl get nodes -o wide
kubectl version --short 2>/dev/null || kubectl version
```

Use the section headings to separate:

- 1.x: control-plane configuration
- 2.x: etcd configuration
- 3.x: control-plane policy
- 4.x: worker-node configuration
- 5.x: Kubernetes policies and workload security

For every FAIL or WARN, record the check ID, affected component, evidence, remediation, owner, and whether the recommendation is applicable. Do not blindly copy a command from a different Kubernetes version.
