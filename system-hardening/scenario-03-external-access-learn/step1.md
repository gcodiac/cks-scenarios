# Minimize external access — Learn

A secure node has few doors: SSH, kubelet, runtime sockets, metrics, and application ports should each have an owner and source allow-list.

Inspect listening sockets, firewall rules, cloud security groups conceptually, and Kubernetes Service types. Distinguish control-plane access from application ingress.

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
