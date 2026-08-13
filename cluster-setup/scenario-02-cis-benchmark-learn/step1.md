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
