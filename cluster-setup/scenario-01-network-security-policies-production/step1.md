# Use Network Security Policies to Restrict Cluster-Level Access — Production

## How this looks in production

The Kubernetes policy remains the same on Amazon EKS. The surrounding layers are different:

- Confirm the EKS network plugin and NetworkPolicy enforcement mode.
- Security groups for pods, VPC security groups, and network ACLs are additional layers.
- Use labels owned by platform teams and test policies in CI before rollout.
- Document DNS, metrics, ingress, egress proxies, and cloud control-plane endpoints.

In a company, policy changes go through code review, staged namespaces, connectivity tests, and rollback. The Kubernetes object and the operational discipline are unchanged.
