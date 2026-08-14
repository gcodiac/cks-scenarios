# Detect threats within the physical infrastructure — Learn

Physical infrastructure threats appear as node changes: unexpected processes, kernel messages, altered binaries, new listeners, or access to runtime sockets.

Inspect node processes, listening ports, journal messages, integrity metadata, and cloud instance activity. Preserve evidence before remediation.

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
