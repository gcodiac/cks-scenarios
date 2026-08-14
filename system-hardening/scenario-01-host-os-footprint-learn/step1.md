# Minimize the host OS footprint — Learn

Every package, daemon, shell, compiler, and open port on a node is attack surface. A smaller node is easier to reason about and patch.

List packages, services, listeners, mounts, and writable paths. Compare a worker image with the services Kubernetes actually needs.

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
