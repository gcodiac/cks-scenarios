# Understand and implement Kubernetes security primitives — Learn

Kubernetes security primitives are layered: namespaces, RBAC, admission, security contexts, NetworkPolicies, Secrets, and audit logs each answer a different question.

Map a request to the primitive that enforces it. Inspect namespace labels, service accounts, securityContext, policies, and admission messages in one workload.

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
