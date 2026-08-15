# Verify Platform Binaries — Inferno

## Inferno task: verify the trust chain

A tool has the expected version but was copied into the node outside the package manager. Investigate before replacing it.

1. Resolve the real path and inspect symlinks.
2. Check ownership, mode, extended attributes, package ownership, and process paths.
3. Obtain the official checksum for the exact Kubernetes release and architecture over a trusted channel.
4. Compare hashes byte-for-byte and quarantine a mismatch rather than deleting evidence.
5. Check static pod image references and digests as well as host binaries.

~~~bash
readlink -f "$(command -v kubectl)"
stat "$(command -v kubectl)"
sha256sum "$(command -v kubectl)"
ps auxww | grep -E 'kube-(apiserver|scheduler|controller-manager)' | grep -v grep
sudo grep -R 'image:' /etc/kubernetes/manifests
~~~

A version match is not enough. Explain your source of trust and retain command output as evidence.


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
