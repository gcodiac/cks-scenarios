# Minimize external access — Inferno

A secure node has few doors: SSH, kubelet, runtime sockets, metrics, and application ports should each have an owner and source allow-list.

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

Close or restrict one exposed management endpoint in the lab, then prove required cluster traffic still works and the endpoint is no longer reachable from an unauthorized source.
