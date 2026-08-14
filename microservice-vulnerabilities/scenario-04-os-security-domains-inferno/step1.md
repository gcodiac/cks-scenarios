# Configure appropriate OS-level security domains — Inferno

AppArmor and seccomp constrain what a process may do after admission. They are different: AppArmor mediates file/network capabilities; seccomp filters syscalls.

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

Apply the requested AppArmor or seccomp profile to a workload, test the expected behavior, and verify the profile is actually loaded rather than merely declared.
