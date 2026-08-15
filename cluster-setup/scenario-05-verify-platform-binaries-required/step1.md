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
