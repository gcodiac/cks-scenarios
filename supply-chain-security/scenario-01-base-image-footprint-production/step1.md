# Minimize base image footprint — Production tutorial

Use a golden-image catalog, SBOMs, rebuild automation, and patch SLAs. ECR is storage; it does not make an image safe by itself.

A production implementation normally includes:

- an approved baseline and owner;
- infrastructure-as-code or image automation;
- monitoring and evidence retention;
- a change window, rollback, and exception expiry;
- a test after Kubernetes, node, image, or cloud changes.

On AWS, the same security intent applies. AWS may operate one layer, such as the EKS control plane, while your team owns identities, workload policy, node configuration, and evidence. Map that shared-responsibility boundary explicitly.
