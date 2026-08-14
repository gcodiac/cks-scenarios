# Configure and use audit logging — Learn

Audit logging records API activity as a security trail. Request and response stages, users, resources, and metadata must be balanced against volume and sensitive data exposure.

Inspect the audit policy and sample events. Generate a harmless API request and identify verb, user, source, namespace, resource, and stage.

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
