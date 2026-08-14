# Analyze system logs — Learn

Logs are a timeline for detection and recovery. Good investigation preserves timestamps, identity, source, and correlation instead of searching one process at a time.

Use journalctl, kubelet logs, container runtime logs, Kubernetes Events, and audit logs. Practice filtering a time window and saving evidence without changing the host.

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
