# Minimize IAM roles — Production tutorial

On AWS, prefer IAM roles for service accounts or EKS Pod Identity over broad node roles. Review trust policies and CloudTrail evidence.

A production implementation normally includes:

- an approved baseline and owner;
- infrastructure-as-code or image automation;
- monitoring and evidence retention;
- a change window, rollback, and exception expiry;
- a test after Kubernetes, node, image, or cloud changes.

On AWS, the same security intent applies. AWS may operate one layer, such as the EKS control plane, while your team owns identities, workload policy, node configuration, and evidence. Map that shared-responsibility boundary explicitly.
