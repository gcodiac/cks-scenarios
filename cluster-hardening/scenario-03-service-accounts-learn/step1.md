# Exercise caution in using service accounts — Learn

A service account is a workload identity, not a human account. Automatic token mounting is like handing every process a master key when most applications need none.

Inspect token mounting, projected tokens, image pull secrets, and service-account subjects in RBAC bindings. Use kubectl auth can-i with a service-account identity.

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
