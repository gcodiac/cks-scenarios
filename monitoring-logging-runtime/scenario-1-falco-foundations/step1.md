
# Step 1 – Deploy Falco Using Helm

In this step, deploy Falco into the Kubernetes cluster using the official Helm chart.

---

## 1. Add the Official Falco Helm Repository

Add the Falco charts repository and update it:

```bash
helm repo add falcosecurity https://falcosecurity.github.io/charts
helm repo update
````

---

## 2. Install Falco

Install Falco into a dedicated namespace called `falco`:

```bash
helm install falco \
  --namespace falco \
  --create-namespace \
  --set tty=true \
  falcosecurity/falco
```

This will:

* Create the `falco` namespace
* Deploy Falco as a DaemonSet (one pod per node)
* Install required RBAC resources

---

## 3. Wait for Falco to Become Ready

Check the Falco pods:

```bash
kubectl get pods -n falco
```

Falco may take a few seconds to initialize.

Wait until the pod shows:

```
1/1   Running
```

You can also wait explicitly:

```bash
kubectl wait --for=condition=Ready pod --all -n falco
```

Once the Falco pod is running, proceed to the next step.

