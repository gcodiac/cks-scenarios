# Use Role Based Access Controls (RBAC) to minimize exposure — Production tutorial

In a company, map IAM groups to Kubernetes groups and keep application teams namespace-scoped. EKS access entries authenticate identities; RBAC still defines least privilege.

A production implementation normally includes:

- an approved baseline and owner;
- infrastructure-as-code or image automation;
- monitoring and evidence retention;
- a change window, rollback, and exception expiry;
- a test after Kubernetes, node, image, or cloud changes.

On AWS, the same security intent applies. AWS may operate one layer, such as the EKS control plane, while your team owns identities, workload policy, node configuration, and evidence. Map that shared-responsibility boundary explicitly.
