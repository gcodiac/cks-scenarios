# Update Kubernetes frequently — Required

Read the version-skew policy. Inspect node versions, deprecated APIs, PodDisruptionBudgets, and drain behavior. Practice cordon, drain, uncordon on a disposable node or reason through the sequence.

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
