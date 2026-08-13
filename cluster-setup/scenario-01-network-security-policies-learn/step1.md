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
