# Use CIS Benchmarks to Review Security Configuration — Production

## How this looks in production

CIS assessment is the same discipline on EKS, but AWS manages the control plane. You assess worker-node configuration, workload policies, IAM, logging, and provider shared-responsibility controls; you cannot edit EKS API-server manifests.

Pin the benchmark version, Kubernetes version, image digest, and profile. Retain output with cluster identity and date. Every exception needs a control ID, rationale, compensating control, owner, expiry, and approval. Re-test after upgrades and infrastructure changes.


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
