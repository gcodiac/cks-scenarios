# Update Kubernetes frequently — Required

Read the version-skew policy. Inspect node versions, deprecated APIs, PodDisruptionBudgets, and drain behavior. Practice cordon, drain, uncordon on a disposable node or reason through the sequence.

Exam task:

- Inspect the current state before changing anything.
- Implement the minimum secure configuration requested by the examiner.
- Preserve unrelated workloads and permissions.
- Verify with evidence from the correct Kubernetes API, host file, or command.

Useful starting point:

~~~bash
kubectl get --raw='/readyz'
kubectl get nodes -o wide
kubectl get events -A --sort-by=.lastTimestamp
~~~

Replace the generic task bullets with the exact exam question when authoring a variant.


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
