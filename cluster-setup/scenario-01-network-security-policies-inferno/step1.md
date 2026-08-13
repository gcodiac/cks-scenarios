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
