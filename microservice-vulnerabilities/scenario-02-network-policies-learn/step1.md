# Use NetworkPolicies — Learn

NetworkPolicy is an allow-list firewall for pod traffic. Selecting a pod for one direction changes that direction from default allow to policy-controlled.

Explore pod labels, namespace selectors, DNS egress, and additive policy behavior. Test connectivity from disposable pods rather than guessing from YAML.

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
