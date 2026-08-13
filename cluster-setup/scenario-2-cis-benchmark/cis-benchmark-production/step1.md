# Step 1 – Create an assessment record

Capture the cluster identity and benchmark output:

```bash
date -u +%Y-%m-%dT%H:%M:%SZ
kubectl version
kubectl get nodes -o wide
kubectl get --raw='/version'
kubectl apply -f https://raw.githubusercontent.com/aquasecurity/kube-bench/main/job.yaml
kubectl wait --for=condition=complete job/kube-bench --timeout=180s
kubectl logs job/kube-bench > /tmp/cis-production-report.txt
```

For each finding record: check ID, benchmark version, evidence, risk, owner, target date, remediation/change reference, validation evidence, and applicability. Separate FAIL from WARN and do not convert an unsupported check into a pass.
