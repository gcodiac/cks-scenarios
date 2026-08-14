# Minimize base image footprint — Inferno

A base image is the first layer of your application attack surface. Fewer packages mean fewer CVEs and fewer tools an attacker can use.

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

Replace the requested image with a smaller approved base, preserve the application contract, and verify the resulting image runs as a non-root user.
