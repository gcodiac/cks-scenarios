# Use secrets to store sensitive data — Production tutorial

In AWS, Secrets Manager or Parameter Store with the Secrets Store CSI Driver may provide the source of truth. Kubernetes RBAC and encryption at rest still matter for the copy in the cluster.

A production implementation normally includes:

- an approved baseline and owner;
- infrastructure-as-code or image automation;
- monitoring and evidence retention;
- a change window, rollback, and exception expiry;
- a test after Kubernetes, node, image, or cloud changes.

On AWS, the same security intent applies. AWS may operate one layer, such as the EKS control plane, while your team owns identities, workload policy, node configuration, and evidence. Map that shared-responsibility boundary explicitly.
