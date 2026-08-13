# Stage 1 – Learn

Open `cis-benchmark-learn/step1.md` and `cis-benchmark-learn/step2.md` for the guided exercise. Run the benchmark, save its output, identify its version and scope, and classify findings by control-plane, worker-node, and policy sections.

Start with:

```bash
kubectl apply -f https://raw.githubusercontent.com/aquasecurity/kube-bench/main/job.yaml
kubectl wait --for=condition=complete job/kube-bench --timeout=180s
kubectl logs job/kube-bench
```
