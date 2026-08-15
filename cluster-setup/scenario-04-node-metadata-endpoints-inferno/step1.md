# Protect Node Metadata and Endpoints — Inferno

## Inferno task: find the escape routes

A workload has been given a host mount and a node-facing setting hidden in a generated Deployment. Trace the complete path rather than checking only the top-level YAML.

1. Compare the Deployment template, live Pod, ServiceAccount, and admission events.
2. Search all volumes for host paths and all containers for privileged mode, capabilities, host ports, and host namespaces.
3. Check whether a DaemonSet or debug pod creates a second metadata path.
4. Remove unsafe access, roll out a replacement, and confirm old Pods are gone.
5. On a kubeadm node, inspect kubelet listening addresses and firewall rules without exposing the kubelet API.

~~~bash
kubectl get pods -n cks-metadata -o yaml
kubectl get ds,deploy,job,cronjob -n cks-metadata -o yaml
sudo ss -lntp
sudo systemctl cat kubelet
~~~

Treat node access as cluster-admin-equivalent: prove both that the route is unavailable and that the workload still works.


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
