# Use secrets to store sensitive data — Learn

A Kubernetes Secret is a delivery mechanism, not automatically a complete secret-management program. Base64 is encoding, not encryption.

Inspect Secret types, mounted versus environment delivery, RBAC access, encryption-at-rest configuration, and shell/history exposure. Read the Kubernetes Secret and encryption documentation.

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
