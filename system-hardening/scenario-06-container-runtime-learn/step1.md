# Securely use the container runtime — Learn

The runtime is the last host boundary before a container process executes. Runtime sockets and privileged settings can turn a pod compromise into node compromise.

Identify containerd or CRI-O, inspect its socket permissions, use crictl to list pods and inspect sandboxes, and compare runtime versus Kubernetes views.

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
