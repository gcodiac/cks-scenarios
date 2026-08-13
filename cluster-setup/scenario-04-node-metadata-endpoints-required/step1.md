# Protect Node Metadata and Endpoints — Required

## Exam task

Audit namespace cks-metadata and remediate the workload so that:

- It does not use hostNetwork, hostPID, or hostIPC.
- It has no unnecessary hostPath volume.
- It does not run privileged or add dangerous capabilities.
- Its service-account token is not mounted unless required.
- Access to node and cloud metadata is blocked by available network controls or node configuration.

Inspect first:

~~~bash
kubectl get deployment metadata-demo -n cks-metadata -o yaml
kubectl get serviceaccount -n cks-metadata
kubectl get networkpolicy -n cks-metadata
~~~

Make the smallest change that satisfies the task and verify the rendered Pod template.
