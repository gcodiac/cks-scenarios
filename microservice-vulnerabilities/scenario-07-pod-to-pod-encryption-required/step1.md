# Implement pod-to-pod encryption — Required

Identify the CNI, inspect its encryption mode, and understand node-to-node versus pod-to-pod paths. Do not mistake TLS at an ingress for east-west encryption.

Exam task:

- Inspect the current state before changing anything.
- Implement the minimum secure configuration requested by the examiner.
- Preserve unrelated workloads and permissions.
- Verify with evidence from the correct Kubernetes API, host file, or command.

Useful starting point:

~~~bash
kubectl get --raw='/readyz'
kubectl get nodes -o wide
kubectl get events -A --sort-by=.lastTimestamp
~~~

Replace the generic task bullets with the exact exam question when authoring a variant.
