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


## Deep-dive workflow

This section expands the exam objective into a security investigation:

1. **Define the asset and boundary.** Write down what is being protected, who can reach it, and whether the control is enforced by the API server, admission, a node, the runtime, the network plugin, or the workload.
2. **Capture a baseline.** Record the current object, labels, identities, processes, ports, events, logs, and relevant configuration before making a change.
3. **Trace the control path.** Follow the request or workload through every intermediary. Do not stop at an object existing; verify that the active component consumes it.
4. **Make one narrow change.** Preserve unrelated workloads, names, namespaces, availability, and existing policy intent.
5. **Test both sides.** Prove the desired behavior and test a nearby denied, invalid, or unexpected case where applicable.
6. **Preserve evidence.** Save the command output, manifest, timestamp, and final status so another operator can reproduce the conclusion.

**Security focus:** Identify the asset, trust boundary, control point, evidence source, and smallest reversible remediation.

Suggested investigation commands:

~~~bash
kubectl get --raw='/readyz?verbose'
kubectl get nodes -o wide
kubectl get events -A --sort-by=.lastTimestamp
kubectl get pods -A -o wide
kubectl get RESOURCE NAME -n NAMESPACE -o yaml
kubectl describe RESOURCE NAME -n NAMESPACE
~~~

Replace the placeholders only after identifying the real resource. The describe command explains symptoms; rendered YAML and status prove the stored state.
