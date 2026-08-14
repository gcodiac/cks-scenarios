# Implement container runtime security — Inferno

A container is a process with namespaces and capabilities, not a miniature VM. Privileged mode, host namespaces, writable root filesystems, and runtime sockets are high-risk shortcuts.

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

Remove the requested dangerous setting, add a non-root/read-only/capability-drop control, and verify the application still starts.
