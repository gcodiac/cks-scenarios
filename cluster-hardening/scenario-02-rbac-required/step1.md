# Use Role Based Access Controls (RBAC) to minimize exposure — Required

Create a read-only Role, bind it to a test user or service account, and use kubectl auth can-i to test both allowed and denied actions. Compare RoleBinding with ClusterRoleBinding.

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
