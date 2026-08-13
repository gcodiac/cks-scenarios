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
