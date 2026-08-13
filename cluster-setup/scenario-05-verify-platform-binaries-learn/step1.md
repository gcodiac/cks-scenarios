# Verify Platform Binaries — Learn

## The idea

Binary verification answers: is this the software we intended to run? A version string identifies a release; a cryptographic digest gives evidence that the bytes match a trusted artifact. Keep provenance, checksum, signer, version, and acquisition source together.

Read the [Kubernetes releases](https://kubernetes.io/releases/), [download tools](https://kubernetes.io/releases/download/), and [Kubernetes image verification guidance](https://kubernetes.io/docs/tasks/administer-cluster/verify-signed-images/).

~~~bash
command -v kubectl kubeadm kubelet || true
kubectl version
sha256sum "$(command -v kubectl)"
ls -l "$(command -v kubectl)"
~~~

Compare client and server versions. A matching filename is not proof of integrity; do not download a checksum from the same untrusted location as the binary.
