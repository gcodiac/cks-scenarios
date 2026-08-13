# Use Network Security Policies to Restrict Cluster-Level Access — Required

## Exam task

In namespace cks-network, implement segmentation with these exact requirements:

1. Create a default-deny policy for both ingress and egress.
2. Allow DNS egress to kube-system on UDP and TCP port 53.
3. Allow frontend to reach backend on TCP port 80.
4. Do not allow the backend to initiate traffic to frontend.
5. Keep the workloads running and place every policy in cks-network.

Inspect labels and selectors before writing YAML:

~~~bash
kubectl get pods -n cks-network --show-labels
kubectl get svc,endpoints,networkpolicy -n cks-network
kubectl explain networkpolicy.spec
~~~

Verify selectors, policy types, ports, and namespace scope. NetworkPolicy is an L3/L4 control, not an HTTP authorization policy.
