# Configure appropriate OS-level security domains — Learn

AppArmor and seccomp constrain what a process may do after admission. They are different: AppArmor mediates file/network capabilities; seccomp filters syscalls.

Inspect node profile availability, pod annotations, securityContext.seccompProfile, and rejection events. Start with RuntimeDefault before writing a custom profile.

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
