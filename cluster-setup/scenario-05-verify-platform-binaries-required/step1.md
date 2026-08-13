# Verify Platform Binaries — Required

## Exam task

Verify the platform tools available on the node:

1. Record Kubernetes server and client versions.
2. Locate kubectl, kubeadm, and kubelet where present.
3. Calculate SHA-256 checksums and compare them with checksums from the official Kubernetes release source.
4. Confirm ownership and permissions are appropriate.
5. Do not replace a binary unless the task explicitly asks for remediation.

~~~bash
command -v kubectl kubeadm kubelet
kubectl version -o json
sha256sum /usr/bin/kubectl /usr/bin/kubeadm /usr/bin/kubelet 2>/dev/null || true
stat -c '%U:%G %a %n' /usr/bin/kubectl /usr/bin/kubeadm /usr/bin/kubelet 2>/dev/null || true
~~~

Write down version, source, checksum, and verification result for each binary.
