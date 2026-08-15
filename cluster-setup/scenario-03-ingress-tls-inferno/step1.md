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


## Deep-dive workflow

This section expands the exam objective into a security investigation:

1. **Define the asset and boundary.** Write down what is being protected, who can reach it, and whether the control is enforced by the API server, admission, a node, the runtime, the network plugin, or the workload.
2. **Capture a baseline.** Record the current object, labels, identities, processes, ports, events, logs, and relevant configuration before making a change.
3. **Trace the control path.** Follow the request or workload through every intermediary. Do not stop at an object existing; verify that the active component consumes it.
4. **Make one narrow change.** Preserve unrelated workloads, names, namespaces, availability, and existing policy intent.
5. **Test both sides.** Prove the desired behavior and test a nearby denied, invalid, or unexpected case where applicable.
6. **Preserve evidence.** Save the command output, manifest, timestamp, and final status so another operator can reproduce the conclusion.

**Security focus:** Map selectors and namespaces first, then reason about allowed paths, DNS, ports, and the direction of traffic.

Suggested investigation commands:

~~~bash
kubectl get --raw='/readyz?verbose'
kubectl get nodes -o wide
kubectl get events -A --sort-by=.lastTimestamp
kubectl get pods -A -o wide
kubectl get RESOURCE NAME -n NAMESPACE -o yaml
kubectl describe RESOURCE NAME -n NAMESPACE
~~~

Replace the placeholders only after identifying the real resource. The describe command explains symptoms; rendered YAML and status prove the stored state.
