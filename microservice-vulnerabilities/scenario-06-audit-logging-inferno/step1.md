# Configure and use audit logging — Inferno

Audit logging records API activity as a security trail. Request and response stages, users, resources, and metadata must be balanced against volume and sensitive data exposure.

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

Enable or adjust the requested audit rule, send output to the configured sink, and demonstrate an event for the target resource without logging unnecessary request bodies.
