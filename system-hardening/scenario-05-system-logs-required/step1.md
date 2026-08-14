# Analyze system logs — Required

Use journalctl, kubelet logs, container runtime logs, Kubernetes Events, and audit logs. Practice filtering a time window and saving evidence without changing the host.

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
