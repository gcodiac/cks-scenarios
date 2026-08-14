# Restrict access to the Kubernetes API — Inferno

The API server is the cluster front door. Authentication answers who you are; authorization answers what you may do; admission answers whether the requested object is acceptable.

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

Read the Kubernetes API authentication, authorization, and kubeconfig documentation. The exam task is to harden selected API-server flags and prove that legitimate access still works.
