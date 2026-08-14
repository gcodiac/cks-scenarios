# Use Pod Security Standards — Inferno

Pod Security Admission is a building inspector: privileged, baseline, and restricted are progressively stricter profiles. Labels choose enforce, audit, and warn behavior.

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

Apply the requested enforce/audit/warn labels and remediate the workload securityContext until it is admitted without weakening the policy.
