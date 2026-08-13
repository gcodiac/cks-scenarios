# Use Ingress and Egress Rules to Restrict Network Access with TLS — Production

## How this looks in production

On AWS, this requirement is commonly implemented with the AWS Load Balancer Controller and an ACM certificate. ACM stores and renews the certificate; the controller maps the Ingress to an ALB and applies listeners, security groups, and target groups.

The security intent does not change: explicit hosts, TLS, least-privilege routing, and no unintended public service. Some teams terminate TLS at the ALB and re-encrypt to the pod; document that trust boundary and use NetworkPolicy and security groups for the remaining path.
