# Securely configure the host OS — Learn

Kernel parameters, file permissions, time, MAC controls, and SSH settings are the node's foundation. Secure defaults reduce the consequences of a container escape.

Inspect sysctl values, /etc/kubernetes permissions, SSH configuration, AppArmor/SELinux state, and time synchronization.

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
