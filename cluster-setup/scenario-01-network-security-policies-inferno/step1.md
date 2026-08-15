# Use Network Security Policies to Restrict Cluster-Level Access — Inferno

## Inferno task: policy reasoning under pressure

The namespace contains overlapping policies and a workload whose labels changed. Find the effective access instead of assuming the newest policy wins.

1. Export every policy before editing.
2. Identify which pods are isolated for ingress and egress.
3. Restore the intended model: frontend may call backend, backend may receive DNS and required upstream traffic, and every other path is denied.
4. Account for DNS by selecting the kube-system namespace rather than hard-coding a pod IP.
5. Prove that a policy in one namespace cannot select another namespace without an explicit namespaceSelector.

~~~bash
kubectl get networkpolicy -A -o yaml
kubectl get pods -A --show-labels
kubectl describe networkpolicy -n cks-network
kubectl get events -A --sort-by=.lastTimestamp
~~~

The difficult part is usually a correct-looking rule that selects nothing, or an additive rule that quietly re-opens a path.


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
