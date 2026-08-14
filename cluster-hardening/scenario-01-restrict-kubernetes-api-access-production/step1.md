# Restrict access to the Kubernetes API — Production tutorial

On EKS, AWS IAM authenticates to the control plane and Kubernetes RBAC authorizes the request. The API intent is unchanged; AWS owns the control-plane process and you own identities, RBAC, and auditability.

A production implementation normally includes:

- an approved baseline and owner;
- infrastructure-as-code or image automation;
- monitoring and evidence retention;
- a change window, rollback, and exception expiry;
- a test after Kubernetes, node, image, or cloud changes.

On AWS, the same security intent applies. AWS may operate one layer, such as the EKS control plane, while your team owns identities, workload policy, node configuration, and evidence. Map that shared-responsibility boundary explicitly.
