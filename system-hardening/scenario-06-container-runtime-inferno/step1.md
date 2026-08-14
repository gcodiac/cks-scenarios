# Securely use the container runtime — Inferno

The runtime is the last host boundary before a container process executes. Runtime sockets and privileged settings can turn a pod compromise into node compromise.

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

Restrict access to the runtime socket, remove an unsafe runtime setting, or verify the configured sandbox and logging behavior without interrupting running workloads.
