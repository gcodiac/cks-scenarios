# Understand and use audit logs — Inferno

Audit logs answer who did what, to which object, when, from where, and whether it succeeded. They are the Kubernetes control-plane paper trail.

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

Find the requested action, adjust the policy or sink configuration, and demonstrate a useful event without leaking Secret data unnecessarily.
