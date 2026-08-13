# Step 2 – Remediate and verify

Use the benchmark's check IDs as your acceptance criteria. Typical kubeadm remediations include:

- API server: disable anonymous access and the insecure read-only port; use an explicit authorization mode.
- etcd: verify client and peer TLS flags reference the correct CA and certificates.
- controller-manager and scheduler: confirm their kubeconfig and TLS settings are explicit.
- kubelet: use an explicit authorization mode, disable anonymous authentication, and enable kernel-default protection where supported.

Edit only the relevant source of truth (`/var/lib/kubelet/config.yaml`, the kubelet systemd drop-in, or a static pod manifest). Then wait for recovery:

```bash
kubectl get --raw='/readyz?verbose'
kubectl get nodes
kubectl apply -f https://raw.githubusercontent.com/aquasecurity/kube-bench/main/job.yaml
kubectl wait --for=condition=complete job/kube-bench --timeout=180s
kubectl logs job/kube-bench | grep -E '1\.|2\.|3\.|4\.'
```

Do not claim a pass solely because the API is reachable: capture the new evidence and document controls that are not applicable.
