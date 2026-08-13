# Configure appropriate OS-level security domains – Inferno

Placeholder advanced task for **Configure appropriate OS-level security domains**.

Task: investigate a deliberately misconfigured environment, preserve a backup, remediate the control using the correct source of truth, and prove the cluster remains healthy.

```bash
kubectl get --raw='/readyz?verbose'
kubectl get events -A --sort-by=.lastTimestamp
```

Replace this placeholder with the difficult variant and troubleshooting questions.
