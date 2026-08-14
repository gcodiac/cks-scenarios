# Minimize IAM roles — Learn

IAM should be a small set of explicit capabilities, like a key ring containing only the keys a role needs.

List local users, groups, sudo rules, cloud instance profiles, and Kubernetes identities. Identify where node-wide permissions are being used for one workload.

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
