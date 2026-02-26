## `step1.md`


# Step 1 – Deploy Falco Using the Official Manifest

In this step, you will:

1. Verify Kubernetes access.
2. Deploy Falco using the official upstream Kubernetes manifest.
3. Verify that the Falco pods are running.
4. Inspect initial Falco logs.

---

## 1. Verify Kubernetes Access

First, confirm that your cluster is available and ready.

Check the node:

```bash

kubectl get nodes
```
You should see one node in `Ready` state.

Check system pods:

```bash
kubectl get pods -A
```

This confirms that `kubectl` is correctly configured.

---

## 2. Deploy Falco Using the Official Manifest

Falco provides an official Kubernetes DaemonSet manifest in its GitHub repository.

Apply it directly from the source:

```bash
kubectl apply -f https://raw.githubusercontent.com/falcosecurity/falco/master/deploy/kubernetes/falco-daemonset.yaml
```

This will create:

* A `falco` namespace
* ServiceAccount and RBAC resources
* ConfigMap
* DaemonSet
* Falco pods (one per node)

You should see multiple resources being created.

---

## 3. Verify Falco Deployment

Check that the `falco` namespace now exists:

```bash
kubectl get namespaces
```

Then check Falco pods:

```bash
kubectl get pods -n falco
```

You should see a pod similar to:

```text
falco-xxxxx   1/1   Running   0   1m
```

If the pod is in `ContainerCreating`, wait 30–60 seconds and check again.

If it is not running, inspect it:

```bash
kubectl describe pod -n falco <falco-pod-name>
```

---

## 4. Inspect Falco Logs

Get the Falco pod name:

```bash
FALCO_POD=$(kubectl get pod -n falco -l app=falco -o jsonpath='{.items[0].metadata.name}')
echo $FALCO_POD
```

View recent logs:

```bash
kubectl logs -n falco $FALCO_POD --tail=50
```

You should see startup logs indicating:

* Falco version
* Driver initialization
* Rules loaded
* "Falco initialized" message

If everything looks healthy and the pod is running, Falco is now actively monitoring your node.

---

You’re ready to generate some runtime activity.

➡ Continue to the next step: **Trigger and Inspect Falco Alerts**
