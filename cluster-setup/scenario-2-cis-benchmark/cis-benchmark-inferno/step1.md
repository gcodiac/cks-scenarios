# Step 1 – Investigate before changing

Run a scoped benchmark and inspect the kubeadm configuration:

```bash
kubectl apply -f https://raw.githubusercontent.com/aquasecurity/kube-bench/main/job.yaml
kubectl wait --for=condition=complete job/kube-bench --timeout=180s
kubectl logs job/kube-bench | tee /tmp/cis-inferno.txt
sudo ls -l /etc/kubernetes/manifests /var/lib/kubelet
sudo grep -R --line-number -- '--authorization-mode\|--anonymous-auth\|--read-only-port\|--protect-kernel-defaults' /etc/kubernetes/manifests /var/lib/kubelet 2>/dev/null
```

Record the current values and back up files before remediation. Focus on applicable checks covering API server authentication/authorization, etcd TLS, scheduler/controller-manager profile, and kubelet configuration.
