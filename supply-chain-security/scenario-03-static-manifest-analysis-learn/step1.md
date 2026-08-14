# Perform static analysis of Kubernetes manifests — Learn

Static analysis catches insecure intent before a manifest reaches the API server: privileged containers, host paths, missing probes, mutable images, and excessive capabilities.

Run kube-linter, kube-score, or a policy scanner against a disposable manifest. Separate a real security finding from a context-specific false positive.

Helpful references:

- [CKS curriculum](https://github.com/cncf/curriculum)
- [Kubernetes security documentation](https://kubernetes.io/docs/concepts/security/)
- [Kubernetes documentation](https://kubernetes.io/docs/)

Try these commands:

~~~bash
kubectl version
kubectl get nodes -o wide
kubectl get pods -A
~~~

Use them to observe the environment. You do not need to prove that you ran them; the point is to make the cluster feel familiar.
