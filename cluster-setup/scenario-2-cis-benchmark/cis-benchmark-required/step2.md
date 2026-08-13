# Step 2 – Remove ambient access and isolate traffic

Create a dedicated service account with token mounting disabled, point the deployment at it, and make the deployment's containers use a non-root security context.

```bash
kubectl create serviceaccount app -n cis-required --dry-run=client -o yaml | kubectl apply -f -
kubectl patch serviceaccount app -n cis-required -p '{"automountServiceAccountToken":false}'
kubectl patch deployment app -n cis-required --type=merge -p '{"spec":{"template":{"spec":{"serviceAccountName":"app","automountServiceAccountToken":false,"securityContext":{"runAsNonRoot":true,"seccompProfile":{"type":"RuntimeDefault"}}}}}}'
```

Apply a default-deny policy for ingress and egress, then add only the traffic the application needs. For this fixture, default denial is the required result:

```bash
kubectl apply -f - <<'EOF'
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: default-deny
  namespace: cis-required
spec:
  podSelector: {}
  policyTypes: [Ingress, Egress]
EOF
```

Confirm the deployment rolls out and inspect the final manifest before finishing.
