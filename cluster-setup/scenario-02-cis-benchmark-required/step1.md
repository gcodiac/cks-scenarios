# Use CIS Benchmarks to Review Security Configuration — Required

## Exam task

Run the benchmark and remediate these workload controls:

1. The cis-required namespace must enforce the restricted Pod Security Standard.
2. The application must use a dedicated service account with automatic token mounting disabled.
3. The pod must run as non-root with RuntimeDefault seccomp.
4. Apply default-deny ingress and egress with a NetworkPolicy.
5. Re-run the relevant check or provide command evidence for each remediation.

Use benchmark output as evidence, not as a command generator:

~~~bash
kubectl logs job/kube-bench
kubectl get ns cis-required --show-labels
kubectl get deploy,sa,networkpolicy -n cis-required -o yaml
~~~

Keep changes scoped to the requested controls and do not weaken a policy to make a check pass.


## Deep-dive workflow

This section expands the exam objective into a security investigation:

1. **Define the asset and boundary.** Write down what is being protected, who can reach it, and whether the control is enforced by the API server, admission, a node, the runtime, the network plugin, or the workload.
2. **Capture a baseline.** Record the current object, labels, identities, processes, ports, events, logs, and relevant configuration before making a change.
3. **Trace the control path.** Follow the request or workload through every intermediary. Do not stop at an object existing; verify that the active component consumes it.
4. **Make one narrow change.** Preserve unrelated workloads, names, namespaces, availability, and existing policy intent.
5. **Test both sides.** Prove the desired behavior and test a nearby denied, invalid, or unexpected case where applicable.
6. **Preserve evidence.** Save the command output, manifest, timestamp, and final status so another operator can reproduce the conclusion.

**Security focus:** Use benchmark output as evidence and map each finding to its enforcing object, node file, process flag, or distribution-specific control.

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
