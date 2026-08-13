# Use CIS Benchmarks to Review Security Configuration — Inferno

## Inferno task: kubeadm configuration investigation

Work from the actual node, not memory. Back up files before editing.

1. Locate static pod manifests in /etc/kubernetes/manifests.
2. Locate kubelet configuration in /var/lib/kubelet/config.yaml and its systemd drop-ins.
3. Inspect API server authentication and authorization flags, etcd TLS flags, controller-manager and scheduler kubeconfigs, and kubelet anonymous/authentication settings.
4. Remediate a small set of applicable findings using the correct source of truth.
5. Wait for recovery and re-run kube-bench.

~~~bash
sudo ls -l /etc/kubernetes/manifests /var/lib/kubelet
sudo grep -R --line-number -- '--anonymous-auth\|--authorization-mode\|--insecure-port\|--client-ca-file' /etc/kubernetes/manifests /var/lib/kubelet 2>/dev/null
kubectl get --raw='/readyz?verbose'
~~~

Never edit every manifest at once. A healthy API server is part of acceptance.
