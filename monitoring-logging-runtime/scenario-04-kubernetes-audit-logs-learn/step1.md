# Understand and use audit logs — Learn

Audit logs answer who did what, to which object, when, from where, and whether it succeeded. They are the Kubernetes control-plane paper trail.

Generate safe API requests and inspect event stages, users, groups, resource names, response codes, and annotations. Compare Metadata, Request, and RequestResponse levels.

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
