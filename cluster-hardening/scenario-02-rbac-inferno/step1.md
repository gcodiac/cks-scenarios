# Use Role Based Access Controls (RBAC) to minimize exposure — Inferno

RBAC is a keycard system: a Role names rooms and actions, a RoleBinding gives a person that keycard, and ClusterRole is a keycard that can span namespaces.

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

Create the smallest Role and binding that permits the requested action. Remove wildcard verbs/resources and any unnecessary cluster-wide binding, then test the exact permissions.
