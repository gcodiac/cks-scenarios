# Protect Node Metadata and Endpoints — Production

## How this looks in production

On EC2/EKS, use IMDSv2, set the metadata hop limit appropriately, disable metadata access where a node does not need it, and prefer IRSA or EKS Pod Identity over node-wide instance roles. Security groups and routing can restrict metadata, but they do not replace least-privilege IAM.

The Kubernetes side is unchanged: avoid host namespaces and hostPath, minimize node permissions, and make metadata access an explicit exception. Cloud teams own the instance profile; platform teams own the pod boundary.
