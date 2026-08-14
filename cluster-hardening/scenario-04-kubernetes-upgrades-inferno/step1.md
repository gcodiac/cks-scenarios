# Update Kubernetes frequently — Inferno

An upgrade is controlled replacement, not a surprise reboot. Version skew rules protect compatibility between kubelet, API server, and clients.

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

Upgrade one component at a time according to kubeadm guidance, preserve workloads with drain and disruption budgets, and verify control-plane and node health after each step. Never run an upgrade command without checking the target version.
