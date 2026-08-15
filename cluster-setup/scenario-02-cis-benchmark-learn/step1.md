# Use CIS Benchmarks to Review Security Configuration — Learn

## The idea

The CIS Kubernetes Benchmark is a checklist of secure configuration recommendations. It is like a vehicle inspection: it reports evidence and recommendations; it does not repair the vehicle. A result is meaningful only when the Kubernetes distribution and benchmark version match.

Read the [CIS Kubernetes Benchmark overview](https://www.cisecurity.org/benchmark/kubernetes) and the [kube-bench project](https://github.com/aquasecurity/kube-bench). Learn the difference between PASS, FAIL, WARN, and a control that is not applicable.

## Run a baseline

~~~bash
kubectl apply -f https://raw.githubusercontent.com/aquasecurity/kube-bench/main/job.yaml
kubectl wait --for=condition=complete job/kube-bench --timeout=180s
kubectl logs job/kube-bench | tee /tmp/cis-baseline.txt
~~~

Group findings into control plane, etcd, worker node, and policy sections. No remediation is required in this stage.


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
