# Restrict access to the Kubernetes API — Required

Use kubectl auth can-i, inspect kubeconfig contexts, and locate the API server manifest. Explain why anonymous access, insecure ports, broad authorization, and untrusted kubeconfigs increase blast radius.

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
