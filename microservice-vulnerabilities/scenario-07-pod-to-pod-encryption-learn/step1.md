# Implement pod-to-pod encryption — Learn

NetworkPolicy controls who may talk; encryption protects what is said. Pod-to-pod encryption usually belongs to the CNI or service mesh, not a YAML field on one pod.

Identify the CNI, inspect its encryption mode, and understand node-to-node versus pod-to-pod paths. Do not mistake TLS at an ingress for east-west encryption.

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
