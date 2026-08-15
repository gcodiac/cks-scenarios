# Use Network Security Policies to Restrict Cluster-Level Access — Learn

## The idea

A NetworkPolicy is a firewall rule attached to a set of pods. The important mental model is **default allow until a policy selects a pod**; once a policy selects a pod for ingress or egress, that direction becomes allow-list based. Policies are additive: a second policy grants more access, it does not override the first.

Think of a hotel. Labels identify the rooms, podSelector identifies which rooms the rule protects, and from/to lists the guests allowed through the door. A policy does nothing unless its selector matches a pod.

Read the [Kubernetes NetworkPolicy documentation](https://kubernetes.io/docs/concepts/services-networking/network-policies/). Support depends on the cluster network plugin.

## Hands-on

~~~bash
kubectl get pods -n cks-network --show-labels
kubectl get networkpolicy -A
kubectl describe deployment -n cks-network frontend
~~~

Create a temporary policy and inspect it. This stage is exploratory; you are not graded on whether you run every command.


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
