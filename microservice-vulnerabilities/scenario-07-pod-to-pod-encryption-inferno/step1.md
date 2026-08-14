# Implement pod-to-pod encryption — Inferno

NetworkPolicy controls who may talk; encryption protects what is said. Pod-to-pod encryption usually belongs to the CNI or service mesh, not a YAML field on one pod.

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

Enable or verify the requested CNI/service-mesh encryption setting and collect evidence from configuration and traffic/metrics.
