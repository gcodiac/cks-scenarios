# Secure the supply chain — Learn

Supply-chain trust answers where an artifact came from and whether it was changed. Tags are labels; digests, signatures, attestations, and provenance are evidence.

Inspect image references, digests, registry allow-lists, Cosign signatures, and provenance attestations. Read the Sigstore Cosign documentation.

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
