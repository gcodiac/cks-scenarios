# CIS Kubernetes Benchmark – Learn

The CIS Kubernetes Benchmark is a prescriptive checklist for securely configuring Kubernetes. It is a benchmark, not a scanner that automatically fixes a cluster.

In this lab you will run `kube-bench`, distinguish control-plane, worker, and cluster-level checks, and interpret PASS, FAIL, and WARN results.

The checks are version-sensitive. Always identify the Kubernetes and benchmark versions before applying a recommendation; a control may not apply to every distribution or managed service.

Environment: a single-node kubeadm cluster with `kubectl` configured and internet access for the `aquasec/kube-bench` image.
