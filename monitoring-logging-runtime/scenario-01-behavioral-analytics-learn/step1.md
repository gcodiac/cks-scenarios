# Perform behavioral analytics of system and workload — Learn

Behavioral analytics detects actions that differ from the normal workload story: a web pod spawning a shell, reading credentials, or opening an unexpected socket.

Create a benign baseline from process, file, network, Kubernetes audit, and runtime events. Read Falco-style rules and identify condition, output, priority, and context.

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
