# Protect Node Metadata and Endpoints — Production

## How this looks in production

On EC2/EKS, use IMDSv2, set the metadata hop limit appropriately, disable metadata access where a node does not need it, and prefer IRSA or EKS Pod Identity over node-wide instance roles. Security groups and routing can restrict metadata, but they do not replace least-privilege IAM.

The Kubernetes side is unchanged: avoid host namespaces and hostPath, minimize node permissions, and make metadata access an explicit exception. Cloud teams own the instance profile; platform teams own the pod boundary.


## Deep-dive workflow

This section expands the exam objective into a security investigation:

1. **Define the asset and boundary.** Write down what is being protected, who can reach it, and whether the control is enforced by the API server, admission, a node, the runtime, the network plugin, or the workload.
2. **Capture a baseline.** Record the current object, labels, identities, processes, ports, events, logs, and relevant configuration before making a change.
3. **Trace the control path.** Follow the request or workload through every intermediary. Do not stop at an object existing; verify that the active component consumes it.
4. **Make one narrow change.** Preserve unrelated workloads, names, namespaces, availability, and existing policy intent.
5. **Test both sides.** Prove the desired behavior and test a nearby denied, invalid, or unexpected case where applicable.
6. **Preserve evidence.** Save the command output, manifest, timestamp, and final status so another operator can reproduce the conclusion.

**Security focus:** Inspect the host boundary, identity boundary, reachable services, and persistence mechanism before applying a hardening change.

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
