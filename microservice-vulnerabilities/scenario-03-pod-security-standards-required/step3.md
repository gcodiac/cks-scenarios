# Guided implementation — Use Pod Security Standards

## Work through the control

Use the fresh stage environment and complete this sequence:

1. Read the task twice and list every immutable constraint.
2. Inventory the relevant objects, nodes, identities, files, processes, and events.
3. Draw a short trust-flow in your notes: actor → API or network entry point → control → workload or host resource.
4. Inspect the current state and save a baseline.
5. Apply the smallest requested remediation.
6. Re-run the baseline commands and perform a functional or authorization test.

Inspect the host boundary, identity boundary, reachable services, and persistence mechanism before applying a hardening change.

<details>
<summary>Stuck? Open a hint</summary>

Use kubectl get ... -o yaml for stored intent, kubectl describe ... for conditions and Events, and kubectl auth can-i when identity or RBAC is involved. For traffic, compare labels and EndpointSlices before changing a policy. For a node or runtime task, identify the exact host file, process flag, socket, or service that owns the behavior.
</details>

Do not call a control effective until the observation proves the active path is using it.
