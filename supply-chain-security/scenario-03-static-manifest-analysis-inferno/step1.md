# Perform static analysis of Kubernetes manifests — Inferno

Static analysis catches insecure intent before a manifest reaches the API server: privileged containers, host paths, missing probes, mutable images, and excessive capabilities.

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

Fix the requested manifest findings, run the scanner again, and record justified exceptions in code review.
