# Verify Platform Binaries — Production

## How this looks in production

EKS control-plane binaries are AWS-managed. You verify versions and AWS release posture rather than replacing those binaries. Worker-node AMIs, bootstrap components, container images, and admission policies remain your responsibility.

Use signed artifacts, trusted registries, SBOMs, image signatures, immutable AMIs, and a controlled CI/CD promotion path. The verification principle is identical on AWS; only the ownership boundary changes.
