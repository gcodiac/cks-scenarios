# Use Ingress and Egress Rules to Restrict Network Access with TLS — Learn

## The idea

Ingress is the front door into cluster services. TLS proves the identity of that front door and encrypts traffic between the client and the TLS termination point. An Ingress object is only a routing declaration; an Ingress controller must implement it.

Egress is the controlled exit from workloads. Think of ingress as the reception desk and egress as the loading dock: both need an explicit policy.

Read the [Ingress documentation](https://kubernetes.io/docs/concepts/services-networking/ingress/) and [TLS Secret guide](https://kubernetes.io/docs/concepts/configuration/secret/#tls-secrets).

~~~bash
openssl req -x509 -nodes -newkey rsa:2048 -days 1 -keyout /tmp/lab.key -out /tmp/lab.crt -subj '/CN=demo.example.test'
kubectl create secret tls demo-tls -n cks-ingress --cert=/tmp/lab.crt --key=/tmp/lab.key --dry-run=client -o yaml
kubectl explain ingress.spec
~~~

This stage is exploratory; no validation of your commands is required.


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
