# Restrict access to the Kubernetes API — Learn

The API server is the cluster front door. Authentication answers who you are; authorization answers what you may do; admission answers whether the requested object is acceptable.

Use kubectl auth can-i, inspect kubeconfig contexts, and locate the API server manifest. Explain why anonymous access, insecure ports, broad authorization, and untrusted kubeconfigs increase blast radius.

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
