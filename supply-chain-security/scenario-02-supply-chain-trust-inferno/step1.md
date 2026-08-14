# Secure the supply chain — Inferno

Supply-chain trust answers where an artifact came from and whether it was changed. Tags are labels; digests, signatures, attestations, and provenance are evidence.

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

Require the requested trusted registry or signature, replace a mutable tag with a digest, and verify admission behavior.
