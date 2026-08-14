# Minimize base image footprint — Learn

A base image is the first layer of your application attack surface. Fewer packages mean fewer CVEs and fewer tools an attacker can use.

Compare Debian, Alpine, distroless, and scratch trade-offs. Inspect image layers, declared user, entrypoint, package inventory, and reproducibility.

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
