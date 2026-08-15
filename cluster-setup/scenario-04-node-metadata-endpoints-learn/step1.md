# Protect Node Metadata and Endpoints — Learn

## The idea

Cloud instance metadata is a control panel attached to a node. A workload that can reach it may discover credentials, identity documents, user-data, or networking details. Protecting it means reducing both paths to the endpoint and permissions behind the node identity.

Also distinguish cloud metadata from Kubernetes endpoints: kubelet read-only ports, the kubelet API, cloud metadata IPs, host networking, and host-mounted credentials each expand the blast radius.

Read the [Kubernetes node security guidance](https://kubernetes.io/docs/concepts/security/), [AWS IMDS guidance](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/configuring-instance-metadata-service.html), and [EKS Pod Identity](https://docs.aws.amazon.com/eks/latest/userguide/pod-identities.html).

~~~bash
kubectl get nodes -o wide
kubectl get pods -A -o custom-columns='NAMESPACE:.metadata.namespace,NAME:.metadata.name,HOSTNETWORK:.spec.hostNetwork,HOSTPID:.spec.hostPID,HOSTPATHS:.spec.volumes[*].hostPath.path'
kubectl get --raw='/api/v1/nodes' | head
~~~

The goal is visibility: identify which workloads could cross a node boundary.


## Deep-dive workflow

This section expands the exam objective into a security investigation:

1. **Define the asset and boundary.** Write down what is being protected, who can reach it, and whether the control is enforced by the API server, admission, a node, the runtime, the network plugin, or the workload.
2. **Capture a baseline.** Record the current object, labels, identities, processes, ports, events, logs, and relevant configuration before making a change.
3. **Trace the control path.** Follow the request or workload through every intermediary. Do not stop at an object existing; verify that the active component consumes it.
4. **Make one narrow change.** Preserve unrelated workloads, names, namespaces, availability, and existing policy intent.
5. **Test both sides.** Prove the desired behavior and test a nearby denied, invalid, or unexpected case where applicable.
6. **Preserve evidence.** Save the command output, manifest, timestamp, and final status so another operator can reproduce the conclusion.

**Security focus:** Inspect the host boundary, identity boundary, reachable services, and persistence mechanism before applying a hardening change.

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
