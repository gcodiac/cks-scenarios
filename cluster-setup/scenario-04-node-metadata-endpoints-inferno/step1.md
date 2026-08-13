# Protect Node Metadata and Endpoints — Inferno

## Inferno task: find the escape routes

A workload has been given a host mount and a node-facing setting hidden in a generated Deployment. Trace the complete path rather than checking only the top-level YAML.

1. Compare the Deployment template, live Pod, ServiceAccount, and admission events.
2. Search all volumes for host paths and all containers for privileged mode, capabilities, host ports, and host namespaces.
3. Check whether a DaemonSet or debug pod creates a second metadata path.
4. Remove unsafe access, roll out a replacement, and confirm old Pods are gone.
5. On a kubeadm node, inspect kubelet listening addresses and firewall rules without exposing the kubelet API.

~~~bash
kubectl get pods -n cks-metadata -o yaml
kubectl get ds,deploy,job,cronjob -n cks-metadata -o yaml
sudo ss -lntp
sudo systemctl cat kubelet
~~~

Treat node access as cluster-admin-equivalent: prove both that the route is unavailable and that the workload still works.
