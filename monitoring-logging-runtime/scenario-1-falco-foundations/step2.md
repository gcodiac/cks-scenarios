# Step 2 – Trigger and Inspect Falco Alerts

In this step, you will:

- Watch Falco logs in real time
- Create a test pod
- Perform suspicious actions
- Observe Falco alerts as they happen

---

## 1. Watch Falco Logs (Terminal 1)

First, open a terminal and watch the Falco logs live.

List the Falco pods:

```bash
kubectl get pods -n falco
````

Copy the Falco pod name, then stream its logs:

```bash
kubectl logs -n falco <falco-pod-name> -f
```

Keep this terminal open.
You should now see Falco output in real time.

---

## 2. Create a Test Pod (Terminal 2)

Open a second terminal.

Create a simple pod that stays running:

```bash
kubectl run falco-demo \
  --image=alpine:3.19 \
  --restart=Never \
  --command -- sh -c "sleep 3600"
```

Wait until it is running:

```bash
kubectl get pod falco-demo
```

---

## 3. Spawn a Shell Inside the Container

Exec into the pod:

```bash
kubectl exec -it falco-demo -- sh
```

As soon as you attach an interactive shell, look at Terminal 1.

You should observe a Falco alert similar to:

```
Notice A shell was spawned in a container with an attached terminal | evt_type=execve ...
```

This corresponds to the default Falco rule that detects interactive shells inside containers.

---

## 4. Trigger Another Suspicious Action

Still inside the pod, attempt to read sensitive files:

```bash
cat /etc/passwd
cat /etc/shadow || echo "permission denied"
```

Return to Terminal 1 and observe the new Falco alert.

You should see output indicating:

* Sensitive file access
* Rule name
* Priority (e.g., Notice or Warning)
* Container and process details

---

Exit the pod when finished:

```bash
exit
```

Falco is now actively detecting suspicious runtime behavior inside containers.


