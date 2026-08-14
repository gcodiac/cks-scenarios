# Detect threats within workloads — Inferno

Workload detection combines Kubernetes identity with process and network behavior. Context makes an alert useful: who deployed it, what image, which node, and what changed?

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

Investigate the supplied suspicious workload, contain it without destroying evidence, and document recovery and follow-up actions.
