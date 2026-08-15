# Use Network Security Policies to Restrict Cluster-Level Access — Production

## How this looks in production

The Kubernetes policy remains the same on Amazon EKS. The surrounding layers are different:

- Confirm the EKS network plugin and NetworkPolicy enforcement mode.
- Security groups for pods, VPC security groups, and network ACLs are additional layers.
- Use labels owned by platform teams and test policies in CI before rollout.
- Document DNS, metrics, ingress, egress proxies, and cloud control-plane endpoints.

In a company, policy changes go through code review, staged namespaces, connectivity tests, and rollback. The Kubernetes object and the operational discipline are unchanged.


## Deep-dive workflow

This section expands the exam objective into a security investigation:

1. **Define the asset and boundary.** Write down what is being protected, who can reach it, and whether the control is enforced by the API server, admission, a node, the runtime, the network plugin, or the workload.
2. **Capture a baseline.** Record the current object, labels, identities, processes, ports, events, logs, and relevant configuration before making a change.
3. **Trace the control path.** Follow the request or workload through every intermediary. Do not stop at an object existing; verify that the active component consumes it.
4. **Make one narrow change.** Preserve unrelated workloads, names, namespaces, availability, and existing policy intent.
5. **Test both sides.** Prove the desired behavior and test a nearby denied, invalid, or unexpected case where applicable.
6. **Preserve evidence.** Save the command output, manifest, timestamp, and final status so another operator can reproduce the conclusion.

**Security focus:** Map selectors and namespaces first, then reason about allowed paths, DNS, ports, and the direction of traffic.

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
