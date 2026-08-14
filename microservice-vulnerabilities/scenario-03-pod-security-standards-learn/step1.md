# Use Pod Security Standards — Learn

Pod Security Admission is a building inspector: privileged, baseline, and restricted are progressively stricter profiles. Labels choose enforce, audit, and warn behavior.

Label a disposable namespace, submit a deliberately unsafe pod, and read the rejection. Compare runAsNonRoot, capabilities, host namespaces, seccomp, and volume restrictions.

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
