# Use Ingress and Egress Rules to Restrict Network Access with TLS — Required

## Exam task

Create an Ingress for service web in namespace cks-ingress:

- Host: demo.example.test.
- TLS secret: demo-tls.
- Route / to service web on port 80.
- Redirect or reject clear-text HTTP according to the controller available.
- Do not expose the service as NodePort or LoadBalancer.

Generate a short-lived lab certificate if needed:

~~~bash
openssl req -x509 -nodes -newkey rsa:2048 -days 1 -keyout /tmp/demo.key -out /tmp/demo.crt -subj '/CN=demo.example.test'
kubectl create secret tls demo-tls -n cks-ingress --cert=/tmp/demo.crt --key=/tmp/demo.key
~~~

Verify the Ingress spec, Secret type, backend service, and namespace. Controller-specific annotations must be justified.


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
