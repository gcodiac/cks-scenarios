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


## Deep-dive workflow

This section expands the exam objective into a security investigation:

1. **Define the asset and boundary.** Write down what is being protected, who can reach it, and whether the control is enforced by the API server, admission, a node, the runtime, the network plugin, or the workload.
2. **Capture a baseline.** Record the current object, labels, identities, processes, ports, events, logs, and relevant configuration before making a change.
3. **Trace the control path.** Follow the request or workload through every intermediary. Do not stop at an object existing; verify that the active component consumes it.
4. **Make one narrow change.** Preserve unrelated workloads, names, namespaces, availability, and existing policy intent.
5. **Test both sides.** Prove the desired behavior and test a nearby denied, invalid, or unexpected case where applicable.
6. **Preserve evidence.** Save the command output, manifest, timestamp, and final status so another operator can reproduce the conclusion.

**Security focus:** Use benchmark output as evidence and map each finding to its enforcing object, node file, process flag, or distribution-specific control.

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
