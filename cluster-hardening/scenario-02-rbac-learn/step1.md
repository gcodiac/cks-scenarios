# Use Role Based Access Controls (RBAC) to minimize exposure — Learn

RBAC is a keycard system: a Role names rooms and actions, a RoleBinding gives a person that keycard, and ClusterRole is a keycard that can span namespaces.

Create a read-only Role, bind it to a test user or service account, and use kubectl auth can-i to test both allowed and denied actions. Compare RoleBinding with ClusterRoleBinding.

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
