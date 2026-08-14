# Minimize IAM roles — Inferno

IAM should be a small set of explicit capabilities, like a key ring containing only the keys a role needs.

Deep-dive mission:

1. Find the authoritative configuration source.
2. Identify the unsafe setting and preserve a backup.
3. Remediate only the affected boundary.
4. Test both the requested access and a denied access.
5. Confirm the API server, node, and workloads remain healthy.

~~~bash
sudo find /etc/kubernetes /var/lib/kubelet -maxdepth 3 -type f 2>/dev/null | sort
kubectl get --raw='/readyz?verbose'
kubectl get events -A --sort-by=.lastTimestamp
~~~

Remove an unnecessary local or cloud permission, replace it with a scoped identity, and verify the intended operation still works.
