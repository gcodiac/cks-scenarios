# Implement container runtime security — Learn

A container is a process with namespaces and capabilities, not a miniature VM. Privileged mode, host namespaces, writable root filesystems, and runtime sockets are high-risk shortcuts.

Inspect effective securityContext, Linux capabilities, mounts, user IDs, and runtime class. Compare the pod manifest with the process seen by the runtime.

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
