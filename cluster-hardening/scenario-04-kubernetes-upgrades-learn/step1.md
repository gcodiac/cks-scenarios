# Update Kubernetes frequently — Learn

An upgrade is controlled replacement, not a surprise reboot. Version skew rules protect compatibility between kubelet, API server, and clients.

Read the version-skew policy. Inspect node versions, deprecated APIs, PodDisruptionBudgets, and drain behavior. Practice cordon, drain, uncordon on a disposable node or reason through the sequence.

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
