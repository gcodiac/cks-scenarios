# Use namespace isolation — Learn

Namespaces are team rooms, not strong physical walls by themselves. They organize names and policy scope; RBAC, NetworkPolicies, and Pod Security make the walls meaningful.

Create two namespaces, compare namespaced resources, labels, service accounts, and cross-namespace DNS. Observe which controls do and do not cross a namespace boundary.

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
