# Use Ingress and Egress Rules to Restrict Network Access with TLS — Inferno

## Inferno task: rotate without breaking the route

A certificate is expiring and the current Ingress has a broad wildcard host plus an accidental clear-text path.

1. Inspect the Ingress, TLS Secret, Service, controller events, and generated configuration.
2. Generate a replacement certificate with the correct DNS name.
3. Update the Secret without deleting the Ingress or changing the service selector.
4. Narrow hosts and paths to the requested application.
5. Prove that the controller observed the new secret and the backend remains reachable.

~~~bash
kubectl describe ingress -n cks-ingress
kubectl get secret demo-tls -n cks-ingress -o jsonpath='{.type}{"\n"}'
kubectl get events -n cks-ingress --sort-by=.lastTimestamp
~~~

Do not paste private keys into notes or commit them to a repository.
