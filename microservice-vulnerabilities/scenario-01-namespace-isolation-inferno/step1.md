# Use namespace isolation — Inferno

Namespaces are team rooms, not strong physical walls by themselves. They organize names and policy scope; RBAC, NetworkPolicies, and Pod Security make the walls meaningful.

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

Move a workload into the requested namespace, apply the required labels and policies, and prove that an identity from another namespace cannot access it.
