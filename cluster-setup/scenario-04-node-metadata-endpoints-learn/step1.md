# Protect Node Metadata and Endpoints — Learn

## The idea

Cloud instance metadata is a control panel attached to a node. A workload that can reach it may discover credentials, identity documents, user-data, or networking details. Protecting it means reducing both paths to the endpoint and permissions behind the node identity.

Also distinguish cloud metadata from Kubernetes endpoints: kubelet read-only ports, the kubelet API, cloud metadata IPs, host networking, and host-mounted credentials each expand the blast radius.

Read the [Kubernetes node security guidance](https://kubernetes.io/docs/concepts/security/), [AWS IMDS guidance](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/configuring-instance-metadata-service.html), and [EKS Pod Identity](https://docs.aws.amazon.com/eks/latest/userguide/pod-identities.html).

~~~bash
kubectl get nodes -o wide
kubectl get pods -A -o custom-columns='NAMESPACE:.metadata.namespace,NAME:.metadata.name,HOSTNETWORK:.spec.hostNetwork,HOSTPID:.spec.hostPID,HOSTPATHS:.spec.volumes[*].hostPath.path'
kubectl get --raw='/api/v1/nodes' | head
~~~

The goal is visibility: identify which workloads could cross a node boundary.
