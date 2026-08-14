# Detect threats within the physical infrastructure — Inferno

Physical infrastructure threats appear as node changes: unexpected processes, kernel messages, altered binaries, new listeners, or access to runtime sockets.

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

Triage the supplied node signal, cordon or isolate safely, collect evidence, and restore service from a trusted node or image.
