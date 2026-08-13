# Step 1 – Run a baseline benchmark

Run the benchmark in the node's host namespaces so it can inspect Kubernetes configuration:

```bash
kubectl apply -f https://raw.githubusercontent.com/aquasecurity/kube-bench/main/job.yaml
kubectl wait --for=condition=complete job/kube-bench --timeout=180s
kubectl logs job/kube-bench
```

Save the output for later:

```bash
kubectl logs job/kube-bench > /tmp/cis-baseline.txt
```

The provided check confirms that the Job completed. A completed Job is not the same thing as a passing benchmark.
