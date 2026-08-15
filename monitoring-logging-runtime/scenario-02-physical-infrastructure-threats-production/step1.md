# Detect threats within the physical infrastructure — Production tutorial

Use immutable node groups, GuardDuty, CloudTrail, SSM, and centralized logs. Provider detection complements Kubernetes runtime controls.

A production implementation normally includes:

- an approved baseline and owner;
- infrastructure-as-code or image automation;
- monitoring and evidence retention;
- a change window, rollback, and exception expiry;
- a test after Kubernetes, node, image, or cloud changes.

On AWS, the same security intent applies. AWS may operate one layer, such as the EKS control plane, while your team owns identities, workload policy, node configuration, and evidence. Map that shared-responsibility boundary explicitly.


## Deep-dive workflow

This section expands the exam objective into a security investigation:

1. **Define the asset and boundary.** Write down what is being protected, who can reach it, and whether the control is enforced by the API server, admission, a node, the runtime, the network plugin, or the workload.
2. **Capture a baseline.** Record the current object, labels, identities, processes, ports, events, logs, and relevant configuration before making a change.
3. **Trace the control path.** Follow the request or workload through every intermediary. Do not stop at an object existing; verify that the active component consumes it.
4. **Make one narrow change.** Preserve unrelated workloads, names, namespaces, availability, and existing policy intent.
5. **Test both sides.** Prove the desired behavior and test a nearby denied, invalid, or unexpected case where applicable.
6. **Preserve evidence.** Save the command output, manifest, timestamp, and final status so another operator can reproduce the conclusion.

**Security focus:** Build a baseline first, identify the process or syscall/network anomaly, preserve evidence, and separate detection from containment.

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
