# Exercise caution in using service accounts — Inferno

A service account is a workload identity, not a human account. Automatic token mounting is like handing every process a master key when most applications need none.

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

Create a dedicated service account, disable automatic token mounting unless required, and bind only the requested permission. Prove the account cannot read unrelated secrets or resources.
