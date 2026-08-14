# Detect threats within workloads — Learn

Workload detection combines Kubernetes identity with process and network behavior. Context makes an alert useful: who deployed it, what image, which node, and what changed?

Generate benign workload events and inspect pod logs, events, audit records, and runtime alerts. Practice following one request from API object to process.

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
